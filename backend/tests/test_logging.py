import logging
from logging.handlers import TimedRotatingFileHandler
from pathlib import Path

from app.core.config import build_settings
from app.main import _configure_logging


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
