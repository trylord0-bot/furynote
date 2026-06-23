import logging
from contextlib import asynccontextmanager
from logging.handlers import TimedRotatingFileHandler
from pathlib import Path

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from sqlalchemy import create_engine, text

from app.api.v1.router import api_router
from app.core.config import DEFAULT_HMAC_SECRET, Settings, get_settings
from app.core.middleware import SignatureMiddleware
from app.db.base import Base
from app.services import push_service
import app.models.entities  # noqa: F401 — registers ORM models with Base.metadata

LOG_FORMAT = "%(asctime)s [%(levelname)s] %(name)s: %(message)s"
LOG_FILE_NAME = "backend.log"
logger = logging.getLogger(__name__)


def _configure_logging(settings: Settings) -> None:
    log_dir = Path(settings.log_dir)
    log_dir.mkdir(parents=True, exist_ok=True)
    log_file = log_dir / LOG_FILE_NAME

    root_logger = logging.getLogger()
    root_logger.setLevel(logging.INFO)
    formatter = logging.Formatter(LOG_FORMAT)

    if not root_logger.handlers:
        stream_handler = logging.StreamHandler()
        stream_handler.setFormatter(formatter)
        root_logger.addHandler(stream_handler)

    log_file_key = str(log_file.resolve())
    for handler in root_logger.handlers:
        if getattr(handler, "_furynote_log_file", None) == log_file_key:
            return

    file_handler = TimedRotatingFileHandler(
        log_file,
        when="midnight",
        interval=1,
        encoding="utf-8",
    )
    file_handler.setFormatter(formatter)
    file_handler._furynote_log_file = log_file_key
    root_logger.addHandler(file_handler)


def _init_db() -> None:
    settings = get_settings()
    try:
        engine = create_engine(settings.database_url, pool_pre_ping=True)
        with engine.connect() as conn:
            conn.execute(text("SELECT 1"))
        Base.metadata.create_all(bind=engine)
        engine.dispose()
        logger.info(
            "MariaDB 연결 성공 및 테이블 초기화: %s:%s/%s",
            settings.db_host,
            settings.db_port,
            settings.db_name,
        )
    except Exception as exc:
        logger.error("MariaDB 초기화 실패: %s", exc)


@asynccontextmanager
async def lifespan(app: FastAPI):
    settings = get_settings()
    logger.info("서버 시작 — 환경: %s, 앱: %s", settings.app_env, settings.app_name)
    if settings.openai_api_key:
        logger.info("OpenAI Moderation API 활성화 (key=%s...%s)", settings.openai_api_key[:8], settings.openai_api_key[-4:])
    else:
        logger.warning("OPENAI_API_KEY 미설정 — Moderation 검사가 비활성화됩니다.")
    _init_db()
    push_service.init_firebase(settings.firebase_credentials_path)
    yield
    logger.info("서버 종료")


def create_app() -> FastAPI:
    settings = get_settings()
    _configure_logging(settings)
    app = FastAPI(title=settings.app_name, lifespan=lifespan)

    app.add_middleware(
        CORSMiddleware,
        allow_origins=["*"],
        allow_methods=["*"],
        allow_headers=["*"],
    )
    app.add_middleware(
        SignatureMiddleware,
        secret=settings.hmac_secret,
        protected_prefix=settings.api_v1_prefix,
    )
    if settings.hmac_secret == DEFAULT_HMAC_SECRET and settings.app_env != "local":
        logger.warning("APP_HMAC_SECRET이 기본값입니다. 운영 환경에서는 반드시 강력한 값으로 설정하세요.")

    app.include_router(api_router, prefix=settings.api_v1_prefix)
    return app


app = create_app()
