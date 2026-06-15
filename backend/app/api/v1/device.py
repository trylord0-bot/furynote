from fastapi import APIRouter, Depends, Header

from app.core.responses import ok
from app.repositories.db_repository import DbStore, get_db_store
from app.schemas.device import DeviceRegisterRequest, NotificationUpdateRequest, TokenUpdateRequest


router = APIRouter()


@router.post("/register")
def register_device(
    payload: DeviceRegisterRequest,
    store: DbStore = Depends(get_db_store),
) -> dict:
    device = store.register_device(payload.device_id, payload.fcm_token)
    return ok(
        {
            "registered": True,
            "device_id": device["device_id"],
            "fcm_token": device["fcm_token"],
            "notify_comment": device["notify_comment"],
        }
    )


@router.patch("/token")
def update_token(
    payload: TokenUpdateRequest,
    x_device_id: str = Header(alias="X-Device-ID"),
    store: DbStore = Depends(get_db_store),
) -> dict:
    device = store.update_token(x_device_id, payload.fcm_token)
    return ok({"updated": True, "device_id": x_device_id, "fcm_token": device["fcm_token"]})


@router.patch("/notification")
def update_notification(
    payload: NotificationUpdateRequest,
    x_device_id: str = Header(alias="X-Device-ID"),
    store: DbStore = Depends(get_db_store),
) -> dict:
    device = store.update_notification(x_device_id, payload.notify_comment)
    return ok({"updated": True, "device_id": x_device_id, "notify_comment": device["notify_comment"]})
