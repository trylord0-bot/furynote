import logging

from starlette.background import BackgroundTasks

from app.api.v1.posts import create_comment
from app.core.config import build_settings
from app.schemas.posts import CommentCreateRequest
from app.services import push_service


class _FakeStore:
    def __init__(self, post_owner_device_id: str = "author-device") -> None:
        self.post_owner_device_id = post_owner_device_id

    def recent_comment_attempts(self, device_id: str) -> list:
        return []

    def create_comment(
        self,
        post_id: str,
        device_id: str,
        nickname: str,
        profile_code: str | None,
        text: str,
    ) -> dict:
        return {
            "comment_id": "comment-1",
            "post_id": post_id,
            "device_id": device_id,
            "nickname": nickname,
            "profile_code": profile_code,
            "text": text,
            "created_at": _CreatedAt(),
            "post_owner_device_id": self.post_owner_device_id,
        }

    def get_device_token(self, device_id: str) -> dict:
        return {
            "device_id": device_id,
            "fcm_token": "owner-fcm-token",
            "notify_comment": True,
        }

    def serialize_comment(self, comment: dict, viewer_device_id: str) -> dict:
        return {
            "comment_id": comment["comment_id"],
            "nickname": comment["nickname"],
            "profile_code": comment.get("profile_code"),
            "text": comment["text"],
            "is_mine": comment["device_id"] == viewer_device_id,
            "created_at": comment["created_at"].isoformat(),
        }


class _CreatedAt:
    def isoformat(self) -> str:
        return "2026-06-18T00:00:00"


def test_author_comment_does_not_enqueue_push_notification_to_author(monkeypatch) -> None:
    settings = build_settings(env={"OPENAI_API_KEY": ""})
    monkeypatch.setattr("app.api.v1.posts.get_settings", lambda: settings)
    tasks = BackgroundTasks()

    response = create_comment(
        "post-1",
        CommentCreateRequest(nickname="작성자", text="내 글에 남긴 댓글"),
        tasks,
        x_device_id="author-device",
        store=_FakeStore(),
    )

    assert response["success"] is True
    assert tasks.tasks == []


def test_other_user_comment_enqueues_push_notification_to_author(monkeypatch) -> None:
    settings = build_settings(env={"OPENAI_API_KEY": ""})
    monkeypatch.setattr("app.api.v1.posts.get_settings", lambda: settings)
    tasks = BackgroundTasks()

    response = create_comment(
        "post-1",
        CommentCreateRequest(nickname="댓글러", text="내 글에 남긴 댓글"),
        tasks,
        x_device_id="commenter-device",
        store=_FakeStore(post_owner_device_id="author-device"),
    )

    assert response["success"] is True
    assert len(tasks.tasks) == 1
    task = tasks.tasks[0]
    assert task.func == push_service.send_comment_notification
    assert task.kwargs == {
        "device_id": "author-device",
        "fcm_token": "owner-fcm-token",
        "nickname": "댓글러",
        "text": "내 글에 남긴 댓글",
        "post_id": "post-1",
    }


def test_send_comment_notification_logs_fcm_send(monkeypatch, caplog) -> None:
    sent_messages = []

    def fake_send(message):
        sent_messages.append(message)
        return "projects/furynote/messages/message-1"

    monkeypatch.setattr(push_service, "_app", object())
    monkeypatch.setattr(push_service.messaging, "send", fake_send)
    caplog.set_level(logging.INFO, logger="app.services.push_service")

    push_service.send_comment_notification(
        device_id="author-device",
        fcm_token="owner-fcm-token",
        nickname="작성자",
        text="내 글에 남긴 댓글",
        post_id="post-1",
    )

    assert len(sent_messages) == 1
    assert "댓글 푸시 알림 발송 요청" in caplog.text
    assert "댓글 푸시 알림 발송 완료" in caplog.text
    assert "device_id=author-device" in caplog.text
    assert "post_id=post-1" in caplog.text
    assert "message_id=projects/furynote/messages/message-1" in caplog.text
