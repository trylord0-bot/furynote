from __future__ import annotations

import hashlib
import hmac
import threading
import time


SIGNATURE_WINDOW_SECONDS = 300
_NONCE_TTL_SECONDS = SIGNATURE_WINDOW_SECONDS * 2

_nonce_seen: dict[str, float] = {}
_nonce_lock = threading.Lock()


class SignatureError(Exception):
    def __init__(self, code: str, message: str) -> None:
        super().__init__(message)
        self.code = code
        self.message = message


def compute_signature(secret: str, method: str, path: str, timestamp: str, nonce: str, body: str) -> str:
    message = f"{method.upper()}\n{path}\n{timestamp}\n{nonce}\n{body}"
    return hmac.new(secret.encode("utf-8"), message.encode("utf-8"), hashlib.sha256).hexdigest()


def _purge_expired_nonces(now: float) -> None:
    expired = [nonce for nonce, expires_at in _nonce_seen.items() if expires_at <= now]
    for nonce in expired:
        del _nonce_seen[nonce]


def verify_request_signature(
    secret: str,
    method: str,
    path: str,
    body: str,
    timestamp: str | None,
    nonce: str | None,
    signature: str | None,
) -> None:
    if not timestamp or not nonce or not signature:
        raise SignatureError("SIGNATURE_REQUIRED", "요청 서명이 필요해요.")

    try:
        sent_at = float(timestamp)
    except ValueError:
        raise SignatureError("SIGNATURE_INVALID", "잘못된 요청이에요.")

    now = time.time()
    if abs(now - sent_at) > SIGNATURE_WINDOW_SECONDS:
        raise SignatureError("SIGNATURE_EXPIRED", "요청 유효 시간이 지났어요. 다시 시도해주세요.")

    expected = compute_signature(secret, method, path, timestamp, nonce, body)
    if not hmac.compare_digest(expected, signature):
        raise SignatureError("SIGNATURE_INVALID", "잘못된 요청이에요.")

    with _nonce_lock:
        _purge_expired_nonces(now)
        if nonce in _nonce_seen:
            raise SignatureError("SIGNATURE_REPLAY", "이미 처리된 요청이에요.")
        _nonce_seen[nonce] = now + _NONCE_TTL_SECONDS
