from datetime import datetime

from fastapi import APIRouter, Header

from app.core.responses import ok
from app.schemas.purchase import PurchaseVerifyRequest


router = APIRouter()


@router.post("/verify")
def verify_purchase(payload: PurchaseVerifyRequest, x_device_id: str = Header(alias="X-Device-ID")) -> dict:
    return ok(
        {
            "pro_activated": True,
            "device_id": x_device_id,
            "platform": payload.platform,
            "purchased_at": datetime.utcnow().isoformat(),
        }
    )


@router.get("/status")
def purchase_status(x_device_id: str = Header(alias="X-Device-ID")) -> dict:
    return ok({"device_id": x_device_id, "is_pro": False, "purchased_at": None})
