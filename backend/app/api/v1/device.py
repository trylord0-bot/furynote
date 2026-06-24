import base64
import io

from fastapi import APIRouter, Depends, Header, HTTPException
from PIL import Image, ImageOps

from app.core.responses import ok
from app.repositories.db_repository import DbStore, get_db_store
from app.schemas.device import AvatarUpdateRequest, DeviceRegisterRequest, NotificationUpdateRequest, TokenUpdateRequest


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


@router.patch("/avatar")
def update_avatar(
    payload: AvatarUpdateRequest,
    x_device_id: str = Header(alias="X-Device-ID"),
    store: DbStore = Depends(get_db_store),
) -> dict:
    if payload.avatar_base64 is None:
        store.update_avatar(x_device_id, None)
        return ok({"updated": True, "cleared": True})

    try:
        image_bytes = base64.b64decode(payload.avatar_base64)
        img = ImageOps.exif_transpose(
            Image.open(io.BytesIO(image_bytes))
        ).convert("RGB")
        w, h = img.size
        side = min(w, h)
        left = (w - side) // 2
        top = (h - side) // 2
        img = img.crop((left, top, left + side, top + side))
        img = img.resize((256, 256), Image.LANCZOS)
        buf = io.BytesIO()
        img.save(buf, format="JPEG", quality=85)
        converted = base64.b64encode(buf.getvalue()).decode()
    except Exception:
        raise HTTPException(status_code=400, detail="Invalid image data")

    store.update_avatar(x_device_id, converted)
    return ok({"updated": True, "cleared": False})
