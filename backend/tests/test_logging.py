import asyncio
import logging
from logging.handlers import TimedRotatingFileHandler
from pathlib import Path

import pytest
from fastapi import FastAPI

from app.core.config import build_settings
from app.main import _configure_logging, _init_db, lifespan, logger


def test_configure_logging_writes_to_settings_log_dir(tmp_path: Path) -> None:
    root_logger = logging.getLogger()
    original_handlers = list(root_logger.handlers)
    for handler in original_handlers:
        root_logger.removeHandler(handler)

    try:
        settings = build_settings({"LOG_DIR": str(tmp_path)})

        _configure_logging(settings)
        logging.getLogger("app.tests").info("hello from test")

        for handler in root_logger.handlers:
            handler.flush()

        log_text = (tmp_path / "backend.log").read_text(encoding="utf-8")
        assert log_text
        assert "hello from test" in log_text
    finally:
        for handler in list(root_logger.handlers):
            handler.close()
            root_logger.removeHandler(handler)
        for handler in original_handlers:
            root_logger.addHandler(handler)


def test_configure_logging_rotates_log_file_daily(tmp_path: Path) -> None:
    root_logger = logging.getLogger()
    original_handlers = list(root_logger.handlers)
    for handler in original_handlers:
        root_logger.removeHandler(handler)

    try:
        settings = build_settings({"LOG_DIR": str(tmp_path)})

        _configure_logging(settings)

        rotating_handlers = [
            handler
            for handler in root_logger.handlers
            if isinstance(handler, TimedRotatingFileHandler)
        ]
        assert len(rotating_handlers) == 1
        assert rotating_handlers[0].baseFilename == str((tmp_path / "backend.log").resolve())
        assert rotating_handlers[0].when == "MIDNIGHT"
        assert rotating_handlers[0].interval == 24 * 60 * 60
    finally:
        for handler in list(root_logger.handlers):
            handler.close()
            root_logger.removeHandler(handler)
        for handler in original_handlers:
            root_logger.addHandler(handler)


def test_lifespan_logs_api_port_and_database_before_openai(monkeypatch, caplog) -> None:
    settings = build_settings(
        {
            "APP_ENV": "local",
            "APP_NAME": "Fury Note API",
            "API_PORT": "8010",
            "OPENAI_API_KEY": "sk-test1234567890",
            "FIREBASE_CREDENTIALS_PATH": "",
        }
    )

    def fake_init_db() -> None:
        logger.info("TEST_DB_INITIALIZED")

    monkeypatch.setattr("app.main.get_settings", lambda: settings)
    monkeypatch.setattr("app.main._init_db", fake_init_db)
    monkeypatch.setattr("app.main.push_service.init_firebase", lambda path: None)
    caplog.set_level(logging.INFO, logger="app.main")

    async def run_lifespan() -> None:
        async with lifespan(FastAPI()):
            pass

    asyncio.run(run_lifespan())

    messages = [record.getMessage() for record in caplog.records]
    assert any("포트: 8010" in message for message in messages)
    db_index = messages.index("TEST_DB_INITIALIZED")
    openai_index = next(
        index
        for index, message in enumerate(messages)
        if "OpenAI Moderation API 활성화" in message
    )
    assert db_index < openai_index


def test_lifespan_stops_before_openai_when_database_fails(monkeypatch, caplog) -> None:
    settings = build_settings(
        {
            "APP_ENV": "local",
            "API_PORT": "8010",
            "OPENAI_API_KEY": "sk-test1234567890",
            "FIREBASE_CREDENTIALS_PATH": "",
        }
    )
    push_called = False

    def failing_init_db() -> None:
        raise RuntimeError("database down")

    def fake_init_firebase(path: str | None) -> None:
        nonlocal push_called
        push_called = True

    monkeypatch.setattr("app.main.get_settings", lambda: settings)
    monkeypatch.setattr("app.main._init_db", failing_init_db)
    monkeypatch.setattr("app.main.push_service.init_firebase", fake_init_firebase)
    caplog.set_level(logging.INFO, logger="app.main")

    async def run_lifespan() -> None:
        async with lifespan(FastAPI()):
            pass

    with pytest.raises(RuntimeError, match="database down"):
        asyncio.run(run_lifespan())

    assert "OpenAI Moderation API 활성화" not in caplog.text
    assert push_called is False


def test_init_db_raises_when_database_connection_fails(monkeypatch, caplog) -> None:
    settings = build_settings({"APP_ENV": "local"})

    def failing_create_engine(*args, **kwargs):
        raise RuntimeError("connection refused")

    monkeypatch.setattr("app.main.get_settings", lambda: settings)
    monkeypatch.setattr("app.main.create_engine", failing_create_engine)
    caplog.set_level(logging.ERROR, logger="app.main")

    with pytest.raises(RuntimeError, match="connection refused"):
        _init_db()

    assert "MariaDB 초기화 실패" in caplog.text
