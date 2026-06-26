from pathlib import Path

from app.core.config import build_settings


def test_api_port_defaults_to_8000() -> None:
    settings = build_settings({})

    assert settings.api_port == 8000


def test_dotenv_can_override_api_port(tmp_path: Path) -> None:
    dotenv = tmp_path / ".env"
    dotenv.write_text("API_PORT=8010\n", encoding="utf-8")

    settings = build_settings(dotenv_path=dotenv)

    assert settings.api_port == 8010


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


def test_dotenv_relative_log_dir_resolves_from_dotenv_dir(tmp_path: Path) -> None:
    dotenv = tmp_path / ".env"
    dotenv.write_text("LOG_DIR=custom-logs\n", encoding="utf-8")

    settings = build_settings(dotenv_path=dotenv)

    assert settings.log_dir == str((tmp_path / "custom-logs").resolve())


def test_log_dir_defaults_to_backend_logs_directory() -> None:
    settings = build_settings({})

    assert settings.log_dir.endswith("logs")


def test_dotenv_relative_firebase_credentials_path_resolves_from_dotenv_dir(
    tmp_path: Path,
) -> None:
    dotenv = tmp_path / ".env"
    dotenv.write_text("FIREBASE_CREDENTIALS_PATH=service-account.json\n", encoding="utf-8")

    settings = build_settings(dotenv_path=dotenv)

    assert settings.firebase_credentials_path == str(
        (tmp_path / "service-account.json").resolve()
    )


def test_explicit_env_firebase_credentials_path_takes_precedence(tmp_path: Path) -> None:
    dotenv = tmp_path / ".env"
    dotenv.write_text("FIREBASE_CREDENTIALS_PATH=from-dotenv.json\n", encoding="utf-8")

    settings = build_settings(
        {"FIREBASE_CREDENTIALS_PATH": "from-explicit-env.json"},
        dotenv_path=dotenv,
    )

    assert settings.firebase_credentials_path == "from-explicit-env.json"


def test_firebase_credentials_path_defaults_to_backend_service_account_file() -> None:
    settings = build_settings({})

    assert settings.firebase_credentials_path is not None
    assert settings.firebase_credentials_path.endswith(
        "furynote-firebase-adminsdk-fbsvc-c60c7a3f0c.json"
    )
