from pathlib import Path

from app.core.config import build_settings


def test_local_env_defaults_to_3303() -> None:
    settings = build_settings({"APP_ENV": "local"})

    assert settings.db_port == 3303


def test_non_local_env_defaults_to_3306() -> None:
    settings = build_settings({"APP_ENV": "production"})

    assert settings.db_port == 3306


def test_dotenv_can_override_database_port(tmp_path: Path) -> None:
    dotenv = tmp_path / ".env"
    dotenv.write_text("APP_ENV=local\nDB_PORT=4406\n", encoding="utf-8")

    settings = build_settings(dotenv_path=dotenv)

    assert settings.db_port == 4406
