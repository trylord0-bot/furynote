from datetime import datetime, timedelta

from app.services.content_policy import check_rate_limit, check_text_policy


def test_text_without_url_or_spam_is_allowed() -> None:
    result = check_text_policy("오늘 운전하다가 정말 화가 났다")

    assert result.allowed is True


def test_url_is_blocked() -> None:
    result = check_text_policy("여기 봐주세요 https://example.com")

    assert result.allowed is False
    assert result.code == "CONTENT_BLOCKED_URL"


def test_spam_keyword_is_blocked() -> None:
    result = check_text_policy("무료 가입하면 수익")

    assert result.allowed is False
    assert result.code == "CONTENT_BLOCKED_SPAM"


def test_profanity_from_badwords_file_is_blocked() -> None:
    result = check_text_policy("진짜 시발 너무 화난다")

    assert result.allowed is False
    assert result.code == "CONTENT_BLOCKED_PROFANITY"


def test_regex_like_badword_is_matched_as_literal_text() -> None:
    result = check_text_policy("문장 안의 @!@ 문자열")

    assert result.allowed is False
    assert result.code == "CONTENT_BLOCKED_PROFANITY"


def test_five_attempts_in_sixty_seconds_is_rate_limited() -> None:
    now = datetime(2026, 6, 10, 12, 0, 0)
    attempts = [now - timedelta(seconds=offset) for offset in (1, 5, 10, 20, 59)]

    result = check_rate_limit(attempts, now=now)

    assert result.allowed is False
    assert result.code == "RATE_LIMIT_EXCEEDED"
