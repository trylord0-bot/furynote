from pydantic import BaseModel, Field


class PostCreateRequest(BaseModel):
    nickname: str = Field(min_length=1, max_length=64)
    rage_level: int = Field(ge=1, le=5)
    category: str = Field(min_length=1, max_length=32)
    text: str | None = Field(default=None, max_length=300)


class CommentCreateRequest(BaseModel):
    nickname: str = Field(min_length=1, max_length=64)
    text: str = Field(min_length=1, max_length=200)
