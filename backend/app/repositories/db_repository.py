from __future__ import annotations

import hashlib
from datetime import datetime, timedelta
from uuid import uuid4

from fastapi import Depends
from sqlalchemy import func, select, update
from sqlalchemy.orm import Session

from app.db.base import get_db
from app.models.entities import Comment, DeviceToken, Post, PostLike
from app.repositories.memory import DeleteResult


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

    def get_device_token(self, device_id: str) -> dict | None:
        device = self.session.execute(
            select(DeviceToken).where(DeviceToken.device_id == device_id)
        ).scalar_one_or_none()

        if device is None:
            return None
        return {
            "device_id": device.device_id,
            "fcm_token": device.fcm_token,
            "notify_comment": device.notify_comment,
            "avatar_base64": device.avatar_data,
        }

    def delete_device_token(self, device_id: str) -> None:
        device = self.session.execute(
            select(DeviceToken).where(DeviceToken.device_id == device_id)
        ).scalar_one_or_none()

        if device is not None:
            self.session.delete(device)
            self.session.commit()

    def update_avatar(self, device_id: str, avatar_data: str | None) -> None:
        device = self.session.execute(
            select(DeviceToken).where(DeviceToken.device_id == device_id)
        ).scalar_one_or_none()

        if device is None:
            device = DeviceToken(device_id=device_id, fcm_token="pending", notify_comment=True, avatar_data=avatar_data)
            self.session.add(device)
        else:
            device.avatar_data = avatar_data

        self.session.commit()

    def _avatar_for_device(self, device_id: str) -> str | None:
        return self.session.execute(
            select(DeviceToken.avatar_data).where(DeviceToken.device_id == device_id)
        ).scalar_one_or_none()

    def nickname_for(self, device_id: str) -> str:
        return "화난 호랑이"

    def profile_code_for(self, device_id: str) -> str:
        digest = hashlib.sha256(device_id.encode("utf-8")).hexdigest()
        number = int(digest[:8], 16) % 10000
        return f"#{number:04d}"

    # ── Posts ─────────────────────────────────────────────────────────────────

    def recent_post_attempts(self, device_id: str) -> list[datetime]:
        since = datetime.now() - timedelta(seconds=60)
        rows = self.session.execute(
            select(Post.created_at)
            .where(Post.device_id == device_id)
            .where(Post.created_at >= since)
            .where(Post.deleted_at.is_(None))
        ).all()
        return [row[0] for row in rows]

    def create_post(
        self,
        device_id: str,
        nickname: str,
        profile_code: str | None,
        rage_level: int,
        category: str,
        text: str | None,
    ) -> dict:
        post = Post(
            post_id=str(uuid4()),
            device_id=device_id,
            nickname=nickname,
            profile_code=profile_code,
            avatar_data=self._avatar_for_device(device_id),
            rage_level=rage_level,
            category=category,
            text=text,
        )
        self.session.add(post)
        self.session.commit()
        self.session.refresh(post)
        return {"post_id": post.post_id, "created_at": post.created_at}

    def list_posts_page(self, device_id: str, size: int, cursor: str | None = None, mine_only: bool = False) -> dict:
        offset = int(cursor) if cursor else 0

        count_q = select(func.count(Post.id)).where(Post.deleted_at.is_(None))
        if mine_only:
            count_q = count_q.where(Post.device_id == device_id)
        total = self.session.execute(count_q).scalar_one()

        rows_q = (
            select(Post)
            .where(Post.deleted_at.is_(None))
        )
        if mine_only:
            rows_q = rows_q.where(Post.device_id == device_id)
        week_order_key = self._post_week_order_key()
        rows = self.session.execute(
            rows_q.order_by(
                week_order_key.desc(),
                Post.like_count.desc(),
                Post.created_at.desc(),
                Post.id.desc(),
            )
            .offset(offset)
            .limit(size)
        ).all()

        post_ids = [row[0].post_id for row in rows]
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
            "posts": [self._serialize_post(row[0], device_id, liked_ids) for row in rows],
            "next_cursor": str(next_offset) if has_more else None,
            "has_more": has_more,
        }

    def _post_week_order_key(self):
        dialect_name = self.session.get_bind().dialect.name
        if dialect_name == "sqlite":
            return func.strftime("%Y-%W", Post.created_at)
        return func.yearweek(Post.created_at, 1)

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

    def recent_comment_attempts(self, device_id: str) -> list[datetime]:
        since = datetime.now() - timedelta(seconds=60)
        rows = self.session.execute(
            select(Comment.created_at)
            .where(Comment.device_id == device_id)
            .where(Comment.created_at >= since)
            .where(Comment.deleted_at.is_(None))
        ).all()
        return [row[0] for row in rows]

    def create_comment(
        self,
        post_id: str,
        device_id: str,
        nickname: str,
        profile_code: str | None,
        text: str,
    ) -> dict | None:
        post = self.session.execute(
            select(Post).where(Post.post_id == post_id).where(Post.deleted_at.is_(None))
        ).scalar_one_or_none()

        if post is None:
            return None

        comment = Comment(
            comment_id=str(uuid4()),
            post_id=post_id,
            device_id=device_id,
            nickname=nickname,
            profile_code=profile_code,
            avatar_data=self._avatar_for_device(device_id),
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
            "profile_code": comment.profile_code,
            "text": comment.text,
            "created_at": comment.created_at,
            "deleted_at": comment.deleted_at,
            "post_owner_device_id": post.device_id,
            "avatar_base64": comment.avatar_data,
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
                "comment_id": comment.comment_id,
                "device_id": comment.device_id,
                "nickname": comment.nickname,
                "profile_code": comment.profile_code,
                "text": comment.text,
                "created_at": comment.created_at,
                "avatar_base64": comment.avatar_data,
            },
            device_id,
        ) for comment in comments]

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
            "profile_code": post.profile_code,
            "rage_level": post.rage_level,
            "category": post.category,
            "text": post.text,
            "like_count": post.like_count,
            "comment_count": post.comment_count,
            "is_liked": post.post_id in liked_ids,
            "is_mine": post.device_id == device_id,
            "created_at": post.created_at.isoformat(),
            "avatar_base64": post.avatar_data,
        }

    def serialize_comment(self, comment: dict, viewer_device_id: str) -> dict:
        return {
            "comment_id": comment["comment_id"],
            "nickname": comment["nickname"],
            "profile_code": comment.get("profile_code"),
            "text": comment["text"],
            "is_mine": comment["device_id"] == viewer_device_id,
            "created_at": comment["created_at"].isoformat(),
            "avatar_base64": comment.get("avatar_base64"),
        }


def get_db_store(db: Session = Depends(get_db)) -> DbStore:
    return DbStore(db)
