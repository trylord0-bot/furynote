from pydantic import BaseModel, Field


class DeviceRegisterRequest(BaseModel):
    device_id: str = Field(min_length=1, max_length=128)
    fcm_token: str = Field(min_length=1, max_length=256)


class TokenUpdateRequest(BaseModel):
    fcm_token: str = Field(min_length=1, max_length=256)


class NotificationUpdateRequest(BaseModel):
    notify_comment: bool


class AvatarUpdateRequest(BaseModel):
    avatar_base64: str | None = None
