from fastapi import APIRouter, Depends, Header, HTTPException, Query

from app.core.responses import error, ok
from app.repositories.memory import DeleteResult, MemoryStore, get_store
from app.schemas.posts import CommentCreateRequest, PostCreateRequest
from app.services.content_policy import check_rate_limit, check_text_policy


router = APIRouter()


@router.post("", status_code=201)
def create_post(
    payload: PostCreateRequest,
    x_device_id: str = Header(alias="X-Device-ID"),
    store: MemoryStore = Depends(get_store),
) -> dict:
    text_result = check_text_policy(payload.text)
    if not text_result.allowed:
        raise HTTPException(status_code=400, detail=error(text_result.code or "INVALID_REQUEST", text_result.message or "Blocked"))

    rate_result = check_rate_limit([])
    if not rate_result.allowed:
        raise HTTPException(status_code=429, detail=error(rate_result.code or "RATE_LIMIT_EXCEEDED", rate_result.message or "Blocked"))

    post = store.create_post(x_device_id, payload.rage_level, payload.category, payload.text)
    return ok({"post_id": post["post_id"], "created_at": post["created_at"].isoformat()})


@router.get("")
def list_posts(
    x_device_id: str = Header(alias="X-Device-ID"),
    cursor: str | None = Query(default=None),
    size: int = Query(default=20, ge=1, le=50),
    store: MemoryStore = Depends(get_store),
) -> dict:
    posts = store.list_posts(x_device_id, size)
    return ok({"posts": posts, "next_cursor": cursor, "has_more": False})


@router.delete("/{post_id}")
def delete_post(
    post_id: str,
    x_device_id: str = Header(alias="X-Device-ID"),
    store: MemoryStore = Depends(get_store),
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
    store: MemoryStore = Depends(get_store),
) -> dict:
    result = store.toggle_like(post_id, x_device_id)
    if result is None:
        raise HTTPException(status_code=404, detail=error("POST_NOT_FOUND", "포스팅을 찾을 수 없어요."))
    return ok(result)


@router.post("/{post_id}/comments", status_code=201)
def create_comment(
    post_id: str,
    payload: CommentCreateRequest,
    x_device_id: str = Header(alias="X-Device-ID"),
    store: MemoryStore = Depends(get_store),
) -> dict:
    comment = store.create_comment(post_id, x_device_id, payload.text)
    if comment is None:
        raise HTTPException(status_code=404, detail=error("POST_NOT_FOUND", "포스팅을 찾을 수 없어요."))
    return ok(store.serialize_comment(comment, x_device_id))


@router.get("/{post_id}/comments")
def list_comments(
    post_id: str,
    x_device_id: str = Header(alias="X-Device-ID"),
    cursor: str | None = Query(default=None),
    size: int = Query(default=30, ge=1, le=50),
    store: MemoryStore = Depends(get_store),
) -> dict:
    return ok({"comments": store.list_comments(post_id, x_device_id, size), "next_cursor": cursor, "has_more": False})


@router.delete("/{post_id}/comments/{comment_id}")
def delete_comment(
    post_id: str,
    comment_id: str,
    x_device_id: str = Header(alias="X-Device-ID"),
    store: MemoryStore = Depends(get_store),
) -> dict:
    result = store.delete_comment(post_id, comment_id, x_device_id)
    if result == DeleteResult.FORBIDDEN:
        raise HTTPException(status_code=403, detail=error("FORBIDDEN", "본인 댓글만 삭제할 수 있어요."))
    if result == DeleteResult.NOT_FOUND:
        raise HTTPException(status_code=404, detail=error("COMMENT_NOT_FOUND", "댓글을 찾을 수 없어요."))
    return ok({"deleted": True})
