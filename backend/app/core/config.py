from __future__ import annotations

import os
from dataclasses import dataclass
from functools import lru_cache
from pathlib import Path


def _load_dotenv(path: Path) -> dict[str, str]:
    values: dict[str, str] = {}
    if not path.exists():
        return values
    for raw_line in path.read_text(encoding="utf-8").splitlines():
        line = raw_line.strip()
        if not line or line.startswith("#") or "=" not in line:
            continue
        key, value = line.split("=", 1)
        values[key.strip()] = value.strip().strip('"').strip("'")
    return values


@dataclass(frozen=True)
class Settings:
    app_env: str
    app_name: str
    api_v1_prefix: str
    db_host: str
    db_port: int
    db_name: str
    db_user: str
    db_password: str
    openai_api_key: str | None
    firebase_credentials_path: str | None
    apple_verify_url: str
    google_package_name: str

    @property
    def database_url(self) -> str:
        return (
            f"mysql+pymysql://{self.db_user}:{self.db_password}"
            f"@{self.db_host}:{self.db_port}/{self.db_name}?charset=utf8mb4"
        )


def build_settings(env: dict[str, str] | None = None, dotenv_path: Path | None = None) -> Settings:
    merged = dict(os.environ)
    if dotenv_path is not None:
        merged.update(_load_dotenv(dotenv_path))
    if env:
        merged.update(env)

    app_env = merged.get("APP_ENV", "production")
    default_port = "3303" if app_env == "local" else "3306"

    return Settings(
        app_env=app_env,
        app_name=merged.get("APP_NAME", "Fury Note API"),
        api_v1_prefix=merged.get("API_V1_PREFIX", "/v1"),
        db_host=merged.get("DB_HOST", "127.0.0.1"),
        db_port=int(merged.get("DB_PORT", default_port)),
        db_name=merged.get("DB_NAME", "furynote"),
        db_user=merged.get("DB_USER", "furynote"),
        db_password=merged.get("DB_PASSWORD", "furynote"),
        openai_api_key=merged.get("OPENAI_API_KEY") or None,
        firebase_credentials_path=merged.get("FIREBASE_CREDENTIALS_PATH") or None,
        apple_verify_url=merged.get(
            "APPLE_VERIFY_URL", "https://buy.itunes.apple.com/verifyReceipt"
        ),
        google_package_name=merged.get("GOOGLE_PACKAGE_NAME", "kr.co.lunlu.furynote"),
    )


@lru_cache
def get_settings() -> Settings:
    return build_settings(dotenv_path=Path(".env"))
