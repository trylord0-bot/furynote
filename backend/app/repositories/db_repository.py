from __future__ import annotations

from datetime import datetime, timedelta
from uuid import uuid4

from fastapi import Depends
from sqlalchemy import func, select, update
from sqlalchemy.orm import Session

from app.db.base import get_db
from app.models.entities import Comment, DeviceToken, Post, PostLike
from app.repositories.memory import DeleteResult


def _nickname_for(device_id: str) -> str:
    number = abs(hash(device_id)) % 10000
    return f"화난 호랑이#{number:04d}"


class DbStore:
    def __init__(self, session: Session) -> None:
        self.session = session

    # ── Device ────────────────────────────────────────────────────────────────

    def register_device(self, device_id: str, fcm_token: str) -> dict:
        device = self.session.execute(
            select(DeviceToken).where(DeviceToken.device_id == device_id)
        ).scalar_one_or_none()

        if device is None:
            device = DeviceToken(device_id=device_id, fcm_token=fcm_token, notify_comment=True)
            self.session.add(device)
        else:
            device.fcm_token = fcm_token

        self.session.commit()
        return {
            "device_id": device.device_id,
            "fcm_token": device.fcm_token,
            "notify_comment": device.notify_comment,
        }

    def update_token(self, device_id: str, fcm_token: str) -> dict:
        return self.register_device(device_id, fcm_token)

    def update_notification(self, device_id: str, notify_comment: bool) -> dict:
        device = self.session.execute(
            select(DeviceToken).where(DeviceToken.device_id == device_id)
        ).scalar_one_or_none()

        if device is None:
            device = DeviceToken(device_id=device_id, fcm_token="pending", notify_comment=notify_comment)
            self.session.add(device)
        else:
            device.notify_comment = notify_comment

        self.session.commit()
        return {"device_id": device.device_id, "notify_comment": device.notify_comment}

    # ── Posts ─────────────────────────────────────────────────────────────────

    def recent_post_attempts(self, device_id: str) -> list[datetime]:
        since = datetime.utcnow() - timedelta(seconds=60)
        rows = self.session.execute(
            select(Post.created_at)
            .where(Post.device_id == device_id)
            .where(Post.created_at >= since)
            .where(Post.deleted_at.is_(None))
        ).all()
        return [row[0] for row in rows]

    def create_post(self, device_id: str, rage_level: int, category: str, text: str | None) -> dict:
        post = Post(
            post_id=str(uuid4()),
            device_id=device_id,
            nickname=_nickname_for(device_id),
            rage_level=rage_level,
            category=category,
            text=text,
        )
        self.session.add(post)
        self.session.commit()
        self.session.refresh(post)
        return {"post_id": post.post_id, "created_at": post.created_at}

    def list_posts_page(self, device_id: str, size: int, cursor: str | None = None) -> dict:
        offset = int(cursor) if cursor else 0

        total = self.session.execute(
            select(func.count(Post.id)).where(Post.deleted_at.is_(None))
        ).scalar_one()

        posts = self.session.execute(
            select(Post)
            .where(Post.deleted_at.is_(None))
            .order_by(Post.created_at.desc())
            .offset(offset)
            .limit(size)
        ).scalars().all()

        post_ids = [p.post_id for p in posts]
        liked_ids: set[str] = set()
        if post_ids:
            liked_ids = {
                row[0]
                for row in self.session.execute(
                    select(PostLike.post_id)
                    .where(PostLike.device_id == device_id)
                    .where(PostLike.post_id.in_(post_ids))
                )
            }

        next_offset = offset + size
        has_more = total > next_offset
        return {
            "posts": [self._serialize_post(p, device_id, liked_ids) for p in posts],
            "next_cursor": str(next_offset) if has_more else None,
            "has_more": has_more,
        }

    def delete_post(self, post_id: str, device_id: str) -> DeleteResult:
        post = self.session.execute(
            select(Post).where(Post.post_id == post_id).where(Post.deleted_at.is_(None))
        ).scalar_one_or_none()

        if post is None:
            return DeleteResult.NOT_FOUND
        if post.device_id != device_id:
            return DeleteResult.FORBIDDEN

        now = datetime.utcnow()
        post.deleted_at = now
        self.session.execute(
            update(Comment)
            .where(Comment.post_id == post_id)
            .where(Comment.deleted_at.is_(None))
            .values(deleted_at=now)
        )
        self.session.commit()
        return DeleteResult.DELETED

    def toggle_like(self, post_id: str, device_id: str) -> dict | None:
        post = self.session.execute(
            select(Post).where(Post.post_id == post_id).where(Post.deleted_at.is_(None))
        ).scalar_one_or_none()

        if post is None:
            return None

        existing = self.session.execute(
            select(PostLike)
            .where(PostLike.post_id == post_id)
            .where(PostLike.device_id == device_id)
        ).scalar_one_or_none()

        if existing is not None:
            self.session.delete(existing)
            post.like_count = max(0, post.like_count - 1)
            is_liked = False
        else:
            self.session.add(PostLike(post_id=post_id, device_id=device_id))
            post.like_count += 1
            is_liked = True

        self.session.commit()
        return {"is_liked": is_liked, "like_count": post.like_count}

    # ── Comments ──────────────────────────────────────────────────────────────

    def create_comment(self, post_id: str, device_id: str, text: str) -> dict | None:
        post = self.session.execute(
            select(Post).where(Post.post_id == post_id).where(Post.deleted_at.is_(None))
        ).scalar_one_or_none()

        if post is None:
            return None

        comment = Comment(
            comment_id=str(uuid4()),
            post_id=post_id,
            device_id=device_id,
            nickname=_nickname_for(device_id),
            text=text,
        )
        self.session.add(comment)
        post.comment_count += 1
        self.session.commit()
        self.session.refresh(comment)
        return {
            "comment_id": comment.comment_id,
            "post_id": comment.post_id,
            "device_id": comment.device_id,
            "nickname": comment.nickname,
            "text": comment.text,
            "created_at": comment.created_at,
            "deleted_at": comment.deleted_at,
        }

    def list_comments(self, post_id: str, device_id: str, size: int) -> list[dict]:
        comments = self.session.execute(
            select(Comment)
            .where(Comment.post_id == post_id)
            .where(Comment.deleted_at.is_(None))
            .order_by(Comment.created_at.asc())
            .limit(size)
        ).scalars().all()

        return [self.serialize_comment(
            {
                "comment_id": c.comment_id,
                "device_id": c.device_id,
                "nickname": c.nickname,
                "text": c.text,
                "created_at": c.created_at,
            },
            device_id,
        ) for c in comments]

    def delete_comment(self, post_id: str, comment_id: str, device_id: str) -> DeleteResult:
        comment = self.session.execute(
            select(Comment)
            .where(Comment.comment_id == comment_id)
            .where(Comment.post_id == post_id)
            .where(Comment.deleted_at.is_(None))
        ).scalar_one_or_none()

        if comment is None:
            return DeleteResult.NOT_FOUND
        if comment.device_id != device_id:
            return DeleteResult.FORBIDDEN

        comment.deleted_at = datetime.utcnow()
        post = self.session.execute(
            select(Post).where(Post.post_id == post_id)
        ).scalar_one_or_none()
        if post:
            post.comment_count = max(0, post.comment_count - 1)

        self.session.commit()
        return DeleteResult.DELETED

    # ── Serialization ─────────────────────────────────────────────────────────

    def _serialize_post(self, post: Post, device_id: str, liked_ids: set[str]) -> dict:
        return {
            "post_id": post.post_id,
            "nickname": post.nickname,
            "rage_level": post.rage_level,
            "category": post.category,
            "text": post.text,
            "like_count": post.like_count,
            "comment_count": post.comment_count,
            "is_liked": post.post_id in liked_ids,
            "is_mine": post.device_id == device_id,
            "created_at": post.created_at.isoformat(),
        }

    def serialize_comment(self, comment: dict, viewer_device_id: str) -> dict:
        return {
            "comment_id": comment["comment_id"],
            "nickname": comment["nickname"],
            "text": comment["text"],
            "is_mine": comment["device_id"] == viewer_device_id,
            "created_at": comment["created_at"].isoformat(),
        }


def get_db_store(db: Session = Depends(get_db)) -> DbStore:
    return DbStore(db)
