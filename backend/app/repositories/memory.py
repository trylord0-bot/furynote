from __future__ import annotations

from dataclasses import dataclass, field
from datetime import datetime
from enum import Enum
from uuid import uuid4


class DeleteResult(str, Enum):
    DELETED = "deleted"
    FORBIDDEN = "forbidden"
    NOT_FOUND = "not_found"


@dataclass
class MemoryStore:
    devices: dict[str, dict] = field(default_factory=dict)
    posts: dict[str, dict] = field(default_factory=dict)
    likes: set[tuple[str, str]] = field(default_factory=set)
    comments: dict[str, dict] = field(default_factory=dict)
    purchases: dict[str, dict] = field(default_factory=dict)
    post_attempts: dict[str, list[datetime]] = field(default_factory=dict)

    def clear(self) -> None:
        self.devices.clear()
        self.posts.clear()
        self.likes.clear()
        self.comments.clear()
        self.purchases.clear()
        self.post_attempts.clear()

    def register_device(self, device_id: str, fcm_token: str) -> dict:
        device = self.devices.get(
            device_id,
            {"device_id": device_id, "notify_comment": True, "created_at": datetime.utcnow()},
        )
        device["fcm_token"] = fcm_token
        device["updated_at"] = datetime.utcnow()
        self.devices[device_id] = device
        return device

    def update_token(self, device_id: str, fcm_token: str) -> dict:
        device = self.register_device(device_id, fcm_token)
        return device

    def update_notification(self, device_id: str, notify_comment: bool) -> dict:
        device = self.devices.setdefault(
            device_id,
            {
                "device_id": device_id,
                "fcm_token": "",
                "notify_comment": True,
                "created_at": datetime.utcnow(),
            },
        )
        device["notify_comment"] = notify_comment
        device["updated_at"] = datetime.utcnow()
        return device

    def get_device_token(self, device_id: str) -> dict | None:
        return self.devices.get(device_id)

    def update_avatar(self, device_id: str, avatar_data: str | None) -> None:
        device = self.devices.setdefault(
            device_id,
            {
                "device_id": device_id,
                "fcm_token": "",
                "notify_comment": True,
                "created_at": datetime.utcnow(),
            },
        )
        device["avatar_data"] = avatar_data
        device["updated_at"] = datetime.utcnow()

    def create_post(self, device_id: str, rage_level: int, category: str, text: str | None) -> dict:
        now = datetime.utcnow()
        post_id = str(uuid4())
        post = {
            "post_id": post_id,
            "device_id": device_id,
            "nickname": self.nickname_for(device_id),
            "rage_level": rage_level,
            "category": category,
            "text": text,
            "like_count": 0,
            "comment_count": 0,
            "created_at": now,
            "deleted_at": None,
        }
        self.posts[post_id] = post
        self.post_attempts.setdefault(device_id, []).append(now)
        return post

    def recent_post_attempts(self, device_id: str) -> list[datetime]:
        return self.post_attempts.get(device_id, [])

    def list_posts_page(self, device_id: str, size: int, cursor: str | None = None) -> dict:
        visible = [post for post in self.posts.values() if post["deleted_at"] is None]
        visible.sort(key=lambda post: post["created_at"], reverse=True)
        offset = int(cursor) if cursor else 0
        page_items = visible[offset : offset + size]
        next_offset = offset + size
        has_more = len(visible) > next_offset
        next_cursor = str(next_offset) if has_more else None

        return {
            "posts": [self.serialize_post(post, device_id) for post in page_items],
            "next_cursor": next_cursor,
            "has_more": has_more,
        }

    def delete_post(self, post_id: str, device_id: str) -> DeleteResult:
        post = self.posts.get(post_id)
        if not post or post["deleted_at"] is not None:
            return DeleteResult.NOT_FOUND
        if post["device_id"] != device_id:
            return DeleteResult.FORBIDDEN
        post["deleted_at"] = datetime.utcnow()
        for comment in self.comments.values():
            if comment["post_id"] == post_id:
                comment["deleted_at"] = datetime.utcnow()
        return DeleteResult.DELETED

    def toggle_like(self, post_id: str, device_id: str) -> dict | None:
        post = self.posts.get(post_id)
        if not post or post["deleted_at"] is not None:
            return None
        key = (post_id, device_id)
        if key in self.likes:
            self.likes.remove(key)
            post["like_count"] = max(0, post["like_count"] - 1)
            is_liked = False
        else:
            self.likes.add(key)
            post["like_count"] += 1
            is_liked = True
        return {"is_liked": is_liked, "like_count": post["like_count"]}

    def create_comment(self, post_id: str, device_id: str, text: str) -> dict | None:
        post = self.posts.get(post_id)
        if not post or post["deleted_at"] is not None:
            return None
        comment_id = str(uuid4())
        comment = {
            "comment_id": comment_id,
            "post_id": post_id,
            "device_id": device_id,
            "nickname": self.nickname_for(device_id),
            "text": text,
            "created_at": datetime.utcnow(),
            "deleted_at": None,
        }
        self.comments[comment_id] = comment
        post["comment_count"] += 1
        return comment

    def list_comments(self, post_id: str, device_id: str, size: int) -> list[dict]:
        visible = [
            comment
            for comment in self.comments.values()
            if comment["post_id"] == post_id and comment["deleted_at"] is None
        ]
        visible.sort(key=lambda comment: comment["created_at"])
        return [self.serialize_comment(comment, device_id) for comment in visible[:size]]

    def delete_comment(self, post_id: str, comment_id: str, device_id: str) -> DeleteResult:
        comment = self.comments.get(comment_id)
        if not comment or comment["post_id"] != post_id or comment["deleted_at"] is not None:
            return DeleteResult.NOT_FOUND
        if comment["device_id"] != device_id:
            return DeleteResult.FORBIDDEN
        comment["deleted_at"] = datetime.utcnow()
        post = self.posts.get(post_id)
        if post:
            post["comment_count"] = max(0, post["comment_count"] - 1)
        return DeleteResult.DELETED

    def verify_purchase(self, device_id: str, platform: str, receipt_data: str) -> dict:
        purchase = {
            "device_id": device_id,
            "platform": platform,
            "receipt_data": receipt_data,
            "purchased_at": datetime.utcnow(),
        }
        self.purchases[device_id] = purchase
        return purchase

    def purchase_status(self, device_id: str) -> dict | None:
        return self.purchases.get(device_id)

    def nickname_for(self, device_id: str) -> str:
        number = abs(hash(device_id)) % 10000
        return f"화난 호랑이#{number:04d}"

    def serialize_post(self, post: dict, viewer_device_id: str) -> dict:
        return {
            "post_id": post["post_id"],
            "nickname": post["nickname"],
            "rage_level": post["rage_level"],
            "category": post["category"],
            "text": post["text"],
            "like_count": post["like_count"],
            "comment_count": post["comment_count"],
            "is_liked": (post["post_id"], viewer_device_id) in self.likes,
            "is_mine": post["device_id"] == viewer_device_id,
            "created_at": post["created_at"].isoformat(),
            "avatar_base64": self.devices.get(post["device_id"], {}).get("avatar_data"),
        }

    def serialize_comment(self, comment: dict, viewer_device_id: str) -> dict:
        return {
            "comment_id": comment["comment_id"],
            "nickname": comment["nickname"],
            "text": comment["text"],
            "is_mine": comment["device_id"] == viewer_device_id,
            "created_at": comment["created_at"].isoformat(),
            "avatar_base64": self.devices.get(comment["device_id"], {}).get("avatar_data"),
        }


store = MemoryStore()


def get_store() -> MemoryStore:
    return store


def reset_store() -> None:
    store.clear()
