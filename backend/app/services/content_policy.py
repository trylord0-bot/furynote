from __future__ import annotations

import re
from dataclasses import dataclass
from datetime import datetime, timedelta


URL_PATTERN = re.compile(r"https?://|www\.", re.IGNORECASE)
SPAM_KEYWORDS = ("무료", "대출", "카지노", "가입", "수익", "광고")


@dataclass(frozen=True)
class PolicyResult:
    allowed: bool
    code: str | None = None
    message: str | None = None


def check_text_policy(text: str | None) -> PolicyResult:
    if not text:
        return PolicyResult(True)
    if URL_PATTERN.search(text):
        return PolicyResult(False, "CONTENT_BLOCKED_URL", "URL이 포함된 포스팅은 등록할 수 없어요.")
    if any(keyword in text for keyword in SPAM_KEYWORDS):
        return PolicyResult(False, "CONTENT_BLOCKED_SPAM", "광고성 문구가 포함되어 있어요.")
    return PolicyResult(True)


def check_rate_limit(attempt_times: list[datetime], now: datetime | None = None) -> PolicyResult:
    current = now or datetime.utcnow()
    window_start = current - timedelta(seconds=60)
    recent_count = sum(1 for attempted_at in attempt_times if attempted_at >= window_start)
    if recent_count >= 5:
        return PolicyResult(False, "RATE_LIMIT_EXCEEDED", "잠시 후 다시 시도해주세요.")
    return PolicyResult(True)
