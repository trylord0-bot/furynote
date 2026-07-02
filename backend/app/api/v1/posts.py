import logging
import re
from datetime import datetime

from fastapi import APIRouter, BackgroundTasks, Depends, Header, HTTPException, Query

from app.core.config import get_settings
from app.core.responses import error, ok
from app.repositories.db_repository import DbStore, get_db_store
from app.repositories.memory import DeleteResult
from app.schemas.posts import CommentCreateRequest, PostCreateRequest
from app.services import push_service
from app.services.content_policy import PolicyResult, check_moderation, check_rate_limit, sanitize_text_policy

logger = logging.getLogger(__name__)

router = APIRouter()

_PROFILE_CODE_RE = re.compile(r"\s*(#\d{4})$")


def _policy_error(result: PolicyResult) -> HTTPException:
    status_code = 500 if result.is_internal_error else 400
    return HTTPException(
        status_code=status_code,
        detail=error(result.code or "INVALID_REQUEST", result.message or "Blocked"),
    )


def _author_snapshot(
    nickname: str | None,
    profile_code: str | None,
    device_id: str,
    store: DbStore,
) -> tuple[str, str | None]:
    resolved_nickname = (nickname or "").strip()
    resolved_profile_code = profile_code
    match = _PROFILE_CODE_RE.search(resolved_nickname)
    if match is not None:
        resolved_profile_code = resolved_profile_code or match.group(1)
        resolved_nickname = _PROFILE_CODE_RE.sub("", resolved_nickname).strip()

    if not resolved_nickname:
        nickname_for = getattr(store, "nickname_for", None)
        resolved_nickname = nickname_for(device_id) if nickname_for else "화난 호랑이"

    if resolved_profile_code is None:
        profile_code_for = getattr(store, "profile_code_for", None)
        resolved_profile_code = profile_code_for(device_id) if profile_code_for else None

    return resolved_nickname, resolved_profile_code


@router.post("", status_code=201)
def create_post(
    payload: PostCreateRequest,
    x_device_id: str = Header(alias="X-Device-ID"),
    store: DbStore = Depends(get_db_store),
) -> dict:
    logger.info("포스팅 요청 — device_id=%s", x_device_id)

    text_result = sanitize_text_policy(payload.text)
    if not text_result.allowed:
        logger.info("포스팅 거절 — code=%s device_id=%s", text_result.code, x_device_id)
        raise _policy_error(text_result)
    sanitized_text = text_result.text

    mod_result = check_moderation(sanitized_text, get_settings().openai_api_key)
    if not mod_result.allowed:
        logger.info("포스팅 거절 — code=%s device_id=%s", mod_result.code, x_device_id)
        raise _policy_error(mod_result)

    rate_result = check_rate_limit([*store.recent_post_attempts(x_device_id), datetime.now()])
    if not rate_result.allowed:
        logger.info("포스팅 거절 — code=%s device_id=%s", rate_result.code, x_device_id)
        raise HTTPException(status_code=429, detail=error(rate_result.code or "RATE_LIMIT_EXCEEDED", rate_result.message or "Blocked"))

    nickname, profile_code = _author_snapshot(
        payload.nickname,
        payload.profile_code,
        x_device_id,
        store,
    )
    post = store.create_post(
        x_device_id,
        nickname,
        profile_code,
        payload.rage_level,
        payload.category,
        sanitized_text,
    )
    logger.info("포스팅 등록 완료 — post_id=%s device_id=%s", post["post_id"], x_device_id)
    return ok({"post_id": post["post_id"], "created_at": post["created_at"].isoformat()})


@router.get("")
def list_posts(
    x_device_id: str = Header(alias="X-Device-ID"),
    cursor: str | None = Query(default=None),
    size: int = Query(default=20, ge=1, le=50),
    mine: bool = Query(default=False),
    store: DbStore = Depends(get_db_store),
) -> dict:
    return ok(store.list_posts_page(x_device_id, size, cursor, mine_only=mine))


@router.delete("/{post_id}")
def delete_post(
    post_id: str,
    x_device_id: str = Header(alias="X-Device-ID"),
    store: DbStore = Depends(get_db_store),
) -> dict:
    result = store.delete_post(post_id, x_device_id)
    if result == DeleteResult.FORBIDDEN:
        raise HTTPException(status_code=403, detail=error("FORBIDDEN", "본인 포스팅만 삭제할 수 있어요."))
    if result == DeleteResult.NOT_FOUND:
        raise HTTPException(status_code=404, detail=error("POST_NOT_FOUND", "포스팅을 찾을 수 없어요."))
    return ok({"deleted": True})


@router.post("/{post_id}/like")
def toggle_like(
    post_id: str,
    x_device_id: str = Header(alias="X-Device-ID"),
    store: DbStore = Depends(get_db_store),
) -> dict:
    result = store.toggle_like(post_id, x_device_id)
    if result is None:
        raise HTTPException(status_code=404, detail=error("POST_NOT_FOUND", "포스팅을 찾을 수 없어요."))
    return ok(result)


@router.post("/{post_id}/comments", status_code=201)
def create_comment(
    post_id: str,
    payload: CommentCreateRequest,
    background_tasks: BackgroundTasks,
    x_device_id: str = Header(alias="X-Device-ID"),
    store: DbStore = Depends(get_db_store),
) -> dict:
    logger.info("댓글 요청 — post_id=%s device_id=%s", post_id, x_device_id)

    text_result = sanitize_text_policy(payload.text)
    if not text_result.allowed:
        logger.info("댓글 거절 — code=%s device_id=%s", text_result.code, x_device_id)
        raise _policy_error(text_result)
    sanitized_text = text_result.text or ""

    mod_result = check_moderation(sanitized_text, get_settings().openai_api_key)
    if not mod_result.allowed:
        logger.info("댓글 거절 — code=%s device_id=%s", mod_result.code, x_device_id)
        raise _policy_error(mod_result)

    rate_result = check_rate_limit([*store.recent_comment_attempts(x_device_id), datetime.now()])
    if not rate_result.allowed:
        logger.info("댓글 거절 — code=%s device_id=%s", rate_result.code, x_device_id)
        raise HTTPException(status_code=429, detail=error(rate_result.code or "RATE_LIMIT_EXCEEDED", rate_result.message or "Blocked"))

    nickname, profile_code = _author_snapshot(
        payload.nickname,
        payload.profile_code,
        x_device_id,
        store,
    )
    comment = store.create_comment(
        post_id,
        x_device_id,
        nickname,
        profile_code,
        sanitized_text,
    )
    if comment is None:
        raise HTTPException(status_code=404, detail=error("POST_NOT_FOUND", "포스팅을 찾을 수 없어요."))

    owner_device_id = comment["post_owner_device_id"]
    owner_device = store.get_device_token(owner_device_id)
    if (
        owner_device_id != x_device_id
        and owner_device is not None
        and owner_device["notify_comment"]
    ):
        background_tasks.add_task(
            push_service.send_comment_notification,
            device_id=owner_device_id,
            fcm_token=owner_device["fcm_token"],
            nickname=nickname,
            text=sanitized_text,
            post_id=post_id,
        )

    logger.info("댓글 등록 완료 — comment_id=%s post_id=%s device_id=%s", comment["comment_id"], post_id, x_device_id)
    return ok(store.serialize_comment(comment, x_device_id))


@router.get("/{post_id}/comments")
def list_comments(
    post_id: str,
    x_device_id: str = Header(alias="X-Device-ID"),
    cursor: str | None = Query(default=None),
    size: int = Query(default=30, ge=1, le=50),
    store: DbStore = Depends(get_db_store),
) -> dict:
    comments = store.list_comments(post_id, x_device_id, size)
    return ok({"comments": comments, "next_cursor": None, "has_more": False})


@router.delete("/{post_id}/comments/{comment_id}")
def delete_comment(
    post_id: str,
    comment_id: str,
    x_device_id: str = Header(alias="X-Device-ID"),
    store: DbStore = Depends(get_db_store),
) -> dict:
    result = store.delete_comment(post_id, comment_id, x_device_id)
    if result == DeleteResult.FORBIDDEN:
        raise HTTPException(status_code=403, detail=error("FORBIDDEN", "본인 댓글만 삭제할 수 있어요."))
    if result == DeleteResult.NOT_FOUND:
        raise HTTPException(status_code=404, detail=error("COMMENT_NOT_FOUND", "댓글을 찾을 수 없어요."))
    return ok({"deleted": True})
