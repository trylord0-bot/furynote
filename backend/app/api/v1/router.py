from fastapi import APIRouter

from app.api.v1 import device, posts, purchase


api_router = APIRouter()
api_router.include_router(device.router, prefix="/device", tags=["device"])
api_router.include_router(posts.router, prefix="/posts", tags=["posts"])
api_router.include_router(purchase.router, prefix="/purchase", tags=["purchase"])
