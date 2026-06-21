from __future__ import annotations

from collections.abc import Mapping
from typing import Any

from openai import OpenAI

from app.core.config import get_settings


MODEL = "omni-moderation-latest"
TOP_SCORE_LIMIT = 5

# 한국어 비속어/공격적 표현 샘플입니다. 실제 운영 차단 기준은
# OpenAI 카테고리 결과와 서비스 정책을 함께 보고 조정하세요.
SAMPLES: list[tuple[str, str]] = [
    ("mild_profanity", "아 진짜 짜증나네, 이런 바보 같은 상황이 다 있냐."),
    ("direct_insult", "너 진짜 멍청하고 한심하다."),
    ("strong_profanity", "이런 씨발, 개같은 일이 또 생겼네."),
    ("abusive_reply", "꺼져, 더 이상 상대하고 싶지 않아."),
    ("harassing_insult", "너 같은 놈은 아무도 좋아하지 않아. 진짜 최악이야."),
    ("threatening_language", "계속 그러면 가만두지 않을 거야."),
    ("mocking_profanity", "아주 지랄을 한다, 별것도 아닌 걸로 난리네."),
    ("casual_swearing", "오늘 하루 완전 개빡치네."),
    ("clean_control", "오늘은 날씨가 좋아서 산책하기 좋다."),
]


def _to_dict(value: Any) -> dict[str, Any]:
    if hasattr(value, "model_dump"):
        dumped = value.model_dump()
        if isinstance(dumped, Mapping):
            return dict(dumped)
    if isinstance(value, Mapping):
        return dict(value)
    return dict(vars(value))


def _flagged_categories(categories: Any) -> list[str]:
    return [name for name, flagged in _to_dict(categories).items() if flagged]


def _top_scores(category_scores: Any, limit: int = TOP_SCORE_LIMIT) -> list[tuple[str, float]]:
    scores: list[tuple[str, float]] = []
    for name, score in _to_dict(category_scores).items():
        if isinstance(score, int | float):
            scores.append((name, float(score)))
    return sorted(scores, key=lambda item: item[1], reverse=True)[:limit]


def main() -> None:
    settings = get_settings()
    if not settings.openai_api_key:
        raise RuntimeError("OPENAI_API_KEY가 설정되어 있지 않습니다. backend/.env를 확인하세요.")

    client = OpenAI(api_key=settings.openai_api_key)

    print(f"OpenAI Moderation API 한국어 비속어 샘플 테스트 (model={MODEL})")
    print("=" * 80)

    for index, (label, text) in enumerate(SAMPLES, start=1):
        response = client.moderations.create(model=MODEL, input=text)
        result = response.results[0]
        flagged_categories = _flagged_categories(result.categories)
        top_scores = _top_scores(result.category_scores)

        print(f"\n[{index}] {label}")
        print(f"input: {text}")
        print(f"flagged: {result.flagged}")
        print(f"flagged_categories: {flagged_categories or '-'}")
        print("top_scores:")
        for category, score in top_scores:
            print(f"  - {category}: {score:.6f}")


if __name__ == "__main__":
    main()
