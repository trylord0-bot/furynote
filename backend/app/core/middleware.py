from __future__ import annotations

from starlette.middleware.base import BaseHTTPMiddleware
from starlette.requests import Request
from starlette.responses import JSONResponse, Response

from app.core.responses import error
from app.core.signature import SignatureError, verify_request_signature


class SignatureMiddleware(BaseHTTPMiddleware):
    def __init__(self, app, secret: str, protected_prefix: str) -> None:
        super().__init__(app)
        self._secret = secret
        self._protected_prefix = protected_prefix

    async def dispatch(self, request: Request, call_next) -> Response:
        if not request.url.path.startswith(self._protected_prefix):
            return await call_next(request)

        body_bytes = await request.body()
        try:
            verify_request_signature(
                self._secret,
                request.method,
                request.url.path,
                body_bytes.decode("utf-8"),
                request.headers.get("x-timestamp"),
                request.headers.get("x-nonce"),
                request.headers.get("x-signature"),
            )
        except SignatureError as exc:
            return JSONResponse(status_code=401, content=error(exc.code, exc.message))

        return await call_next(request)
