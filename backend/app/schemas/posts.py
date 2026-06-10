from pydantic import BaseModel, Field


class PostCreateRequest(BaseModel):
    rage_level: int = Field(ge=1, le=5)
    category: str = Field(min_length=1, max_length=32)
    text: str | None = Field(default=None, max_length=300)


class CommentCreateRequest(BaseModel):
    text: str = Field(min_length=1, max_length=200)
