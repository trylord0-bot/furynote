from pydantic import BaseModel, Field


class PurchaseVerifyRequest(BaseModel):
    platform: str = Field(pattern="^(ios|android)$")
    receipt_data: str = Field(min_length=1)
