from datetime import datetime
from uuid import uuid4

from fastapi import APIRouter, Header, HTTPException, Query

from app.core.responses import error, ok
from app.schemas.posts import CommentCreateRequest, PostCreateRequest
from app.services.content_policy import check_rate_limit, check_text_policy


router = APIRouter()


@router.post("", status_code=201)
def create_post(payload: PostCreateRequest, x_device_id: str = Header(alias="X-Device-ID")) -> dict:
    text_result = check_text_policy(payload.text)
    if not text_result.allowed:
        raise HTTPException(status_code=400, detail=error(text_result.code or "INVALID_REQUEST", text_result.message or "Blocked"))

    rate_result = check_rate_limit([])
    if not rate_result.allowed:
        raise HTTPException(status_code=429, detail=error(rate_result.code or "RATE_LIMIT_EXCEEDED", rate_result.message or "Blocked"))

    return ok({"post_id": str(uuid4()), "device_id": x_device_id, "created_at": datetime.utcnow().isoformat()})


@router.get("")
def list_posts(
    x_device_id: str = Header(alias="X-Device-ID"),
    cursor: str | None = Query(default=None),
    size: int = Query(default=20, ge=1, le=50),
) -> dict:
    return ok({"posts": [], "next_cursor": cursor, "has_more": False, "size": size, "device_id": x_device_id})


@router.delete("/{post_id}")
def delete_post(post_id: str, x_device_id: str = Header(alias="X-Device-ID")) -> dict:
    return ok({"deleted": True, "post_id": post_id, "device_id": x_device_id})


@router.post("/{post_id}/like")
def toggle_like(post_id: str, x_device_id: str = Header(alias="X-Device-ID")) -> dict:
    return ok({"post_id": post_id, "device_id": x_device_id, "is_liked": True, "like_count": 1})


@router.post("/{post_id}/comments", status_code=201)
def create_comment(
    post_id: str, payload: CommentCreateRequest, x_device_id: str = Header(alias="X-Device-ID")
) -> dict:
    return ok(
        {
            "comment_id": str(uuid4()),
            "post_id": post_id,
            "nickname": "anonymous",
            "text": payload.text,
            "is_mine": True,
            "device_id": x_device_id,
            "created_at": datetime.utcnow().isoformat(),
        }
    )


@router.get("/{post_id}/comments")
def list_comments(
    post_id: str,
    x_device_id: str = Header(alias="X-Device-ID"),
    cursor: str | None = Query(default=None),
    size: int = Query(default=30, ge=1, le=50),
) -> dict:
    return ok({"comments": [], "next_cursor": cursor, "has_more": False, "post_id": post_id, "device_id": x_device_id, "size": size})


@router.delete("/{post_id}/comments/{comment_id}")
def delete_comment(post_id: str, comment_id: str, x_device_id: str = Header(alias="X-Device-ID")) -> dict:
    return ok({"deleted": True, "post_id": post_id, "comment_id": comment_id, "device_id": x_device_id})
