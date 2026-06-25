from __future__ import annotations

from datetime import datetime

from sqlalchemy import BigInteger, DateTime, Enum, Integer, String, Text, UniqueConstraint, func
from sqlalchemy.orm import Mapped, mapped_column

from app.db.base import Base


class TimestampMixin:
    created_at: Mapped[datetime] = mapped_column(DateTime, nullable=False, server_default=func.now())


class DeviceToken(TimestampMixin, Base):
    __tablename__ = "device_tokens"

    id: Mapped[int] = mapped_column(BigInteger, primary_key=True, autoincrement=True)
    device_id: Mapped[str] = mapped_column(String(128), unique=True, nullable=False, index=True)
    fcm_token: Mapped[str] = mapped_column(String(256), nullable=False)
    notify_comment: Mapped[bool] = mapped_column(nullable=False, default=True)
    avatar_data: Mapped[str | None] = mapped_column(Text, nullable=True)
    updated_at: Mapped[datetime] = mapped_column(
        DateTime, nullable=False, server_default=func.now(), onupdate=func.now()
    )


class Post(TimestampMixin, Base):
    __tablename__ = "posts"

    id: Mapped[int] = mapped_column(BigInteger, primary_key=True, autoincrement=True)
    post_id: Mapped[str] = mapped_column(String(36), unique=True, nullable=False, index=True)
    device_id: Mapped[str] = mapped_column(String(128), nullable=False, index=True)
    nickname: Mapped[str] = mapped_column(String(64), nullable=False)
    profile_code: Mapped[str | None] = mapped_column(String(5), nullable=True)
    rage_level: Mapped[int] = mapped_column(nullable=False)
    category: Mapped[str] = mapped_column(String(32), nullable=False)
    text: Mapped[str | None] = mapped_column(Text, nullable=True)
    avatar_data: Mapped[str | None] = mapped_column(Text, nullable=True)
    like_count: Mapped[int] = mapped_column(Integer, nullable=False, default=0)
    comment_count: Mapped[int] = mapped_column(Integer, nullable=False, default=0)
    deleted_at: Mapped[datetime | None] = mapped_column(DateTime, nullable=True, index=True)


class PostLike(TimestampMixin, Base):
    __tablename__ = "post_likes"
    __table_args__ = (UniqueConstraint("post_id", "device_id", name="uq_post_like"),)

    id: Mapped[int] = mapped_column(BigInteger, primary_key=True, autoincrement=True)
    post_id: Mapped[str] = mapped_column(String(36), nullable=False, index=True)
    device_id: Mapped[str] = mapped_column(String(128), nullable=False)


class Comment(TimestampMixin, Base):
    __tablename__ = "comments"

    id: Mapped[int] = mapped_column(BigInteger, primary_key=True, autoincrement=True)
    comment_id: Mapped[str] = mapped_column(String(36), unique=True, nullable=False, index=True)
    post_id: Mapped[str] = mapped_column(String(36), nullable=False, index=True)
    device_id: Mapped[str] = mapped_column(String(128), nullable=False, index=True)
    nickname: Mapped[str] = mapped_column(String(64), nullable=False)
    profile_code: Mapped[str | None] = mapped_column(String(5), nullable=True)
    avatar_data: Mapped[str | None] = mapped_column(Text, nullable=True)
    text: Mapped[str] = mapped_column(String(200), nullable=False)
    deleted_at: Mapped[datetime | None] = mapped_column(DateTime, nullable=True, index=True)


class ProPurchase(TimestampMixin, Base):
    __tablename__ = "pro_purchases"

    id: Mapped[int] = mapped_column(BigInteger, primary_key=True, autoincrement=True)
    device_id: Mapped[str] = mapped_column(String(128), unique=True, nullable=False, index=True)
    platform: Mapped[str] = mapped_column(Enum("ios", "android"), nullable=False)
    receipt_data: Mapped[str] = mapped_column(Text, nullable=False)
    purchased_at: Mapped[datetime] = mapped_column(DateTime, nullable=False, server_default=func.now())
