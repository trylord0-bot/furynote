from fastapi.testclient import TestClient

from app.main import create_app


def client() -> TestClient:
    return TestClient(create_app())


def test_device_register_upserts_token_and_notification_setting() -> None:
    api = client()

    created = api.post(
        "/v1/device/register",
        json={"device_id": "device-1", "fcm_token": "token-a"},
    )
    updated = api.post(
        "/v1/device/register",
        json={"device_id": "device-1", "fcm_token": "token-b"},
    )
    notification = api.patch(
        "/v1/device/notification",
        headers={"X-Device-ID": "device-1"},
        json={"notify_comment": False},
    )

    assert created.status_code == 200
    assert updated.json()["data"]["registered"] is True
    assert updated.json()["data"]["fcm_token"] == "token-b"
    assert notification.json()["data"]["notify_comment"] is False


def test_post_create_blocks_urls_with_envelope_error() -> None:
    api = client()
    api.post("/v1/device/register", json={"device_id": "device-1", "fcm_token": "token"})

    response = api.post(
        "/v1/posts",
        headers={"X-Device-ID": "device-1"},
        json={"rage_level": 3, "category": "driving", "text": "look https://example.com"},
    )

    assert response.status_code == 400
    assert response.json()["detail"]["error"]["code"] == "CONTENT_BLOCKED_URL"


def test_post_create_list_like_comment_and_delete_flow() -> None:
    api = client()
    api.post("/v1/device/register", json={"device_id": "device-1", "fcm_token": "token"})

    created = api.post(
        "/v1/posts",
        headers={"X-Device-ID": "device-1"},
        json={"rage_level": 4, "category": "work", "text": "회의가 너무 늦게 잡혔다"},
    )
    post_id = created.json()["data"]["post_id"]

    listed = api.get("/v1/posts", headers={"X-Device-ID": "device-1"})
    liked = api.post(f"/v1/posts/{post_id}/like", headers={"X-Device-ID": "device-1"})
    unliked = api.post(f"/v1/posts/{post_id}/like", headers={"X-Device-ID": "device-1"})
    commented = api.post(
        f"/v1/posts/{post_id}/comments",
        headers={"X-Device-ID": "device-1"},
        json={"text": "나도 그랬어요"},
    )
    comments = api.get(f"/v1/posts/{post_id}/comments", headers={"X-Device-ID": "device-1"})
    deleted = api.delete(f"/v1/posts/{post_id}", headers={"X-Device-ID": "device-1"})
    after_delete = api.get("/v1/posts", headers={"X-Device-ID": "device-1"})

    assert created.status_code == 201
    assert listed.json()["data"]["posts"][0]["post_id"] == post_id
    assert listed.json()["data"]["posts"][0]["is_mine"] is True
    assert liked.json()["data"]["is_liked"] is True
    assert liked.json()["data"]["like_count"] == 1
    assert unliked.json()["data"]["is_liked"] is False
    assert unliked.json()["data"]["like_count"] == 0
    assert commented.status_code == 201
    assert comments.json()["data"]["comments"][0]["text"] == "나도 그랬어요"
    assert deleted.json()["data"]["deleted"] is True
    assert after_delete.json()["data"]["posts"] == []


def test_purchase_verify_updates_status() -> None:
    api = client()
    api.post("/v1/device/register", json={"device_id": "device-1", "fcm_token": "token"})

    before = api.get("/v1/purchase/status", headers={"X-Device-ID": "device-1"})
    verified = api.post(
        "/v1/purchase/verify",
        headers={"X-Device-ID": "device-1"},
        json={"platform": "ios", "receipt_data": "receipt"},
    )
    after = api.get("/v1/purchase/status", headers={"X-Device-ID": "device-1"})

    assert before.json()["data"]["is_pro"] is False
    assert verified.json()["data"]["pro_activated"] is True
    assert after.json()["data"]["is_pro"] is True
    assert after.json()["data"]["purchased_at"] is not None
