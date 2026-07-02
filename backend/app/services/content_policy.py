from __future__ import annotations

import logging
import re
from dataclasses import dataclass
from datetime import datetime, timedelta
from functools import cache
from pathlib import Path

logger = logging.getLogger(__name__)

URL_PATTERN = re.compile(r"https?://|www\.", re.IGNORECASE)
SPAM_KEYWORDS = ("무료", "대출", "카지노", "가입", "수익", "광고")
BADWORDS_PATH = Path(__file__).resolve().parents[2] / "badwords_kr.txt"
ANIMAL_SOUNDS_PATH = Path(__file__).resolve().parents[2] / "animal_sounds_kr.txt"


@cache
def load_badwords() -> tuple[str, ...]:
    return tuple(
        word
        for line in BADWORDS_PATH.read_text(encoding="utf-8").splitlines()
        if (word := line.strip())
    )


@cache
def load_animal_sounds() -> tuple[str, ...]:
    return tuple(
        sound
        for line in ANIMAL_SOUNDS_PATH.read_text(encoding="utf-8").splitlines()
        if (sound := line.strip())
    )


@dataclass(frozen=True)
class PolicyResult:
    allowed: bool
    code: str | None = None
    message: str | None = None
    is_internal_error: bool = False
    text: str | None = None


def check_text_policy(text: str | None) -> PolicyResult:
    if not text:
        logger.info("[Step 1/2] 텍스트 없음 — URL·스팸 검사 생략")
        return PolicyResult(True, text=text)
    if URL_PATTERN.search(text):
        logger.info("[Step 1] URL 감지 — 차단")
        return PolicyResult(False, "CONTENT_BLOCKED_URL", "URL이 포함된 포스팅은 등록할 수 없어요.")
    logger.info("[Step 1] URL 검사 통과")
    if any(keyword in text for keyword in SPAM_KEYWORDS):
        logger.info("[Step 2] 광고 키워드 감지 — 차단")
        return PolicyResult(False, "CONTENT_BLOCKED_SPAM", "광고성 문구가 포함되어 있어요.")
    logger.info("[Step 2] 광고 키워드 검사 통과")
    logger.info("[Step 3] 비속어 차단 검사 생략 — 치환 정책 사용")
    return PolicyResult(True, text=text)


def sanitize_text_policy(text: str | None) -> PolicyResult:
    result = check_text_policy(text)
    if not result.allowed or not text:
        return result
    sanitized = replace_badwords_with_animal_sounds(text)
    if sanitized != text:
        logger.info("[Step 3] 비속어 감지 — 동물 울음소리로 치환")
    return PolicyResult(True, text=sanitized)


def replace_badwords_with_animal_sounds(text: str) -> str:
    sanitized = text
    replacement_index = 0
    animal_sounds = load_animal_sounds()
    for word in sorted(load_badwords(), key=len, reverse=True):
        match_count = sanitized.count(word)
        if match_count == 0:
            continue
        sound = animal_sounds[replacement_index % len(animal_sounds)]
        sanitized = sanitized.replace(word, sound)
        replacement_index += match_count
    return sanitized


def check_moderation(text: str | None, api_key: str | None) -> PolicyResult:
    """OpenAI Moderation API로 유해 콘텐츠를 검사한다. API 키가 없거나 호출 실패 시 통과."""
    if not text:
        logger.info("[Step 3] Moderation 검사 생략 — 텍스트 없음")
        return PolicyResult(True)
    if not api_key:
        logger.warning("[Step 3] Moderation 검사 생략 — OPENAI_API_KEY 미설정")
        return PolicyResult(True)
    try:
        from openai import OpenAI

        logger.info("[Step 3] OpenAI Moderation API 호출 시작 (text_len=%d)", len(text))
        client = OpenAI(api_key=api_key)
        response = client.moderations.create(
            model="omni-moderation-latest",
            input=text,
        )
        result = response.results[0]
        flagged_cats = [cat for cat, flagged in vars(result.categories).items() if flagged]
        if result.flagged:
            logger.info("[Step 3] Moderation 차단 — flagged_categories=%s", flagged_cats)
            return PolicyResult(False, "CONTENT_BLOCKED_MODERATION", "부적절한 내용이 포함되어 있어요.")
        logger.info("[Step 3] Moderation 통과")
    except Exception as exc:
        logger.error("[Step 3] OpenAI Moderation API 호출 실패: %s", exc, exc_info=True)
        return PolicyResult(False, "INTERNAL_ERROR", "서버 오류가 발생했어요. 잠시 후 다시 시도해주세요.", is_internal_error=True)
    return PolicyResult(True)


def check_rate_limit(attempt_times: list[datetime], now: datetime | None = None) -> PolicyResult:
    current = now or datetime.now()
    window_start = current - timedelta(seconds=60)
    recent_count = sum(1 for attempted_at in attempt_times if attempted_at >= window_start)
    logger.info("[Step 4] 최근 60초 포스팅 횟수: %d/5", recent_count)
    if recent_count >= 5:
        logger.info("[Step 4] Rate limit 초과 — 차단")
        return PolicyResult(False, "RATE_LIMIT_EXCEEDED", "잠시 후 다시 시도해주세요.")
    logger.info("[Step 4] Rate limit 통과")
    return PolicyResult(True)
