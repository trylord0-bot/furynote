import logging
from contextlib import asynccontextmanager

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from sqlalchemy import create_engine, text

from app.api.v1.router import api_router
from app.core.config import DEFAULT_HMAC_SECRET, get_settings
from app.core.middleware import SignatureMiddleware
from app.db.base import Base
import app.models.entities  # noqa: F401 — registers ORM models with Base.metadata

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(name)s: %(message)s",
)
logger = logging.getLogger(__name__)


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
    _init_db()
    yield
    logger.info("서버 종료")


def create_app() -> FastAPI:
    settings = get_settings()
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
