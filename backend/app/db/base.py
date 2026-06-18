from typing import Generator

from sqlalchemy import create_engine
from sqlalchemy.orm import DeclarativeBase, Session, sessionmaker

from app.core.config import get_settings


class Base(DeclarativeBase):
    pass


_session_factory: sessionmaker | None = None


def _get_factory() -> sessionmaker:
    global _session_factory
    if _session_factory is None:
        engine = create_engine(get_settings().database_url, pool_pre_ping=True)
        _session_factory = sessionmaker(bind=engine, autoflush=False, autocommit=False)
    return _session_factory


def create_session_factory(database_url: str | None = None) -> sessionmaker:
    engine = create_engine(database_url or get_settings().database_url, pool_pre_ping=True)
    return sessionmaker(bind=engine, autoflush=False, autocommit=False)


def get_db() -> Generator[Session, None, None]:
    db = _get_factory()()
    try:
        yield db
    finally:
        db.close()


def create_session() -> Session:
    """Standalone session for use outside FastAPI's request dependency lifecycle (e.g. background tasks)."""
    return _get_factory()()
