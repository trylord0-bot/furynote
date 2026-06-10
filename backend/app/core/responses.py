from typing import Any


def ok(data: Any, status: bool = True) -> dict[str, Any]:
    return {"success": status, "data": data, "error": None}


def error(code: str, message: str) -> dict[str, Any]:
    return {"success": False, "data": None, "error": {"code": code, "message": message}}
