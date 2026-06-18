from __future__ import annotations

import logging
from pathlib import Path

import firebase_admin
from firebase_admin import credentials, messaging

from app.db.base import create_session
from app.repositories.db_repository import DbStore

logger = logging.getLogger(__name__)

_app: firebase_admin.App | None = None


def init_firebase(credentials_path: str | None) -> None:
    """Initialize Firebase Admin SDK from a service-account JSON path read from env (FIREBASE_CREDENTIALS_PATH).

    Safe to call when the path is unset/missing — push notifications are simply disabled, the
    rest of the app keeps working (mirrors how OPENAI_API_KEY is optional).
    """
    global _app
    if _app is not None:
        return

    if not credentials_path or not Path(credentials_path).exists():
        logger.warning("FIREBASE_CREDENTIALS_PATH가 설정되지 않아 댓글 푸시 알림이 비활성화됩니다.")
        return

    try:
        cred = credentials.Certificate(credentials_path)
        _app = firebase_admin.initialize_app(cred)
        logger.info("Firebase Admin SDK 초기화 완료")
    except Exception as exc:
        logger.error("Firebase Admin SDK 초기화 실패: %s", exc)


def is_enabled() -> bool:
    return _app is not None


def send_comment_notification(
    *,
    device_id: str,
    fcm_token: str,
    nickname: str,
    text: str,
    post_id: str,
) -> None:
    """Send a "new comment" push to a post's author. Runs as a FastAPI BackgroundTask, so it
    must never raise — failures are logged and swallowed."""
    if not is_enabled():
        logger.info(
            "Firebase Admin SDK가 비활성화되어 댓글 푸시 알림을 건너뜁니다: device_id=%s post_id=%s",
            device_id,
            post_id,
        )
        return

    message = messaging.Message(
        notification=messaging.Notification(
            title=f"{nickname}님이 댓글을 남겼어요",
            body=text,
        ),
        data={"type": "comment", "post_id": post_id},
        token=fcm_token,
    )

    try:
        logger.info(
            "댓글 푸시 알림 발송 요청: device_id=%s post_id=%s token_tail=%s",
            device_id,
            post_id,
            _token_tail(fcm_token),
        )
        message_id = messaging.send(message)
        logger.info(
            "댓글 푸시 알림 발송 완료: device_id=%s post_id=%s message_id=%s",
            device_id,
            post_id,
            message_id,
        )
    except messaging.UnregisteredError:
        logger.info("만료된 FCM 토큰을 정리합니다: device_id=%s", device_id)
        _invalidate_token(device_id)
    except Exception as exc:
        logger.warning("댓글 푸시 알림 전송 실패: %s", exc)


def _token_tail(fcm_token: str) -> str:
    return f"...{fcm_token[-6:]}" if len(fcm_token) > 6 else "***"


def _invalidate_token(device_id: str) -> None:
    session = create_session()
    try:
        DbStore(session).delete_device_token(device_id)
    finally:
        session.close()
