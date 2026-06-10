from fastapi import APIRouter, Depends, Header

from app.core.responses import ok
from app.repositories.memory import MemoryStore, get_store
from app.schemas.purchase import PurchaseVerifyRequest


router = APIRouter()


@router.post("/verify")
def verify_purchase(
    payload: PurchaseVerifyRequest,
    x_device_id: str = Header(alias="X-Device-ID"),
    store: MemoryStore = Depends(get_store),
) -> dict:
    purchase = store.verify_purchase(x_device_id, payload.platform, payload.receipt_data)
    return ok(
        {
            "pro_activated": True,
            "device_id": x_device_id,
            "platform": payload.platform,
            "purchased_at": purchase["purchased_at"].isoformat(),
        }
    )


@router.get("/status")
def purchase_status(
    x_device_id: str = Header(alias="X-Device-ID"),
    store: MemoryStore = Depends(get_store),
) -> dict:
    purchase = store.purchase_status(x_device_id)
    return ok(
        {
            "device_id": x_device_id,
            "is_pro": purchase is not None,
            "purchased_at": purchase["purchased_at"].isoformat() if purchase else None,
        }
    )
