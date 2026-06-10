from fastapi import APIRouter, Header

from app.core.responses import ok
from app.schemas.device import DeviceRegisterRequest, NotificationUpdateRequest, TokenUpdateRequest


router = APIRouter()


@router.post("/register")
def register_device(payload: DeviceRegisterRequest) -> dict:
    return ok({"registered": True, "device_id": payload.device_id})


@router.patch("/token")
def update_token(payload: TokenUpdateRequest, x_device_id: str = Header(alias="X-Device-ID")) -> dict:
    return ok({"updated": True, "device_id": x_device_id})


@router.patch("/notification")
def update_notification(
    payload: NotificationUpdateRequest, x_device_id: str = Header(alias="X-Device-ID")
) -> dict:
    return ok({"updated": True, "device_id": x_device_id, "notify_comment": payload.notify_comment})
