import base64
import io
import json
import time
from datetime import datetime
from urllib.parse import urlsplit
from uuid import uuid4

from fastapi.testclient import TestClient
from PIL import Image
from sqlalchemy import create_engine, text
from sqlalchemy.orm import sessionmaker

from app.api.v1.device import update_avatar
from app.core.config import DEFAULT_HMAC_SECRET, build_settings
from app.core.signature import compute_signature
from app.main import create_app
from app.repositories.db_repository import DbStore, get_db_store
from app.repositories.memory import reset_store
from app.schemas.device import AvatarUpdateRequest


def client() -> TestClient:
    reset_store()
    return TestClient(create_app())


def _signed_headers(
    method: str,
    url: str,
    body: str,
    extra: dict | None = None,
    timestamp: str | None = None,
    nonce: str | None = None,
) -> dict:
    path = urlsplit(url).path
    ts = timestamp if timestamp is not None else str(time.time())
    n = nonce if nonce is not None else str(uuid4())
    signature = compute_signature(DEFAULT_HMAC_SECRET, method, path, ts, n, body)
    headers = {"X-Timestamp": ts, "X-Nonce": n, "X-Signature": signature}
    if extra:
        headers.update(extra)
    return headers


def signed_get(api: TestClient, url: str, headers: dict | None = None):
    return api.get(url, headers=_signed_headers("GET", url, "", headers))


def signed_post(api: TestClient, url: str, json_body: dict | None = None, headers: dict | None = None):
    if json_body is None:
        return api.post(url, headers=_signed_headers("POST", url, "", headers))
    body = json.dumps(json_body, separators=(",", ":"))
    all_headers = _signed_headers("POST", url, body, headers)
    all_headers["Content-Type"] = "application/json"
    return api.post(url, headers=all_headers, content=body.encode("utf-8"))


def signed_patch(api: TestClient, url: str, json_body: dict, headers: dict | None = None):
    body = json.dumps(json_body, separators=(",", ":"))
    all_headers = _signed_headers("PATCH", url, body, headers)
    all_headers["Content-Type"] = "application/json"
    return api.patch(url, headers=all_headers, content=body.encode("utf-8"))


def signed_delete(api: TestClient, url: str, headers: dict | None = None):
    return api.delete(url, headers=_signed_headers("DELETE", url, "", headers))


def sqlite_store() -> DbStore:
    engine = create_engine("sqlite:///:memory:")
    with engine.begin() as conn:
        conn.execute(
            text(
                """
                CREATE TABLE device_tokens (
                  id INTEGER PRIMARY KEY AUTOINCREMENT,
                  device_id VARCHAR(128) UNIQUE NOT NULL,
                  fcm_token VARCHAR(256) NOT NULL,
                  notify_comment BOOLEAN NOT NULL,
                  avatar_data TEXT NULL,
                  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
                )
                """
            )
        )
        conn.execute(
            text(
                """
                CREATE TABLE posts (
                  id INTEGER PRIMARY KEY AUTOINCREMENT,
                  post_id VARCHAR(36) UNIQUE NOT NULL,
                  device_id VARCHAR(128) NOT NULL,
                  nickname VARCHAR(64) NOT NULL,
                  profile_code VARCHAR(5) NULL,
                  rage_level INTEGER NOT NULL,
                  category VARCHAR(32) NOT NULL,
                  text TEXT NULL,
                  avatar_data TEXT NULL,
                  like_count INTEGER NOT NULL DEFAULT 0,
                  comment_count INTEGER NOT NULL DEFAULT 0,
                  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                  deleted_at DATETIME NULL
                )
                """
            )
        )
        conn.execute(
            text(
                """
                CREATE TABLE post_likes (
                  id INTEGER PRIMARY KEY AUTOINCREMENT,
                  post_id VARCHAR(36) NOT NULL,
                  device_id VARCHAR(128) NOT NULL,
                  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                  UNIQUE (post_id, device_id)
                )
                """
            )
        )
        conn.execute(
            text(
                """
                CREATE TABLE comments (
                  id INTEGER PRIMARY KEY AUTOINCREMENT,
                  comment_id VARCHAR(36) UNIQUE NOT NULL,
                  post_id VARCHAR(36) NOT NULL,
                  device_id VARCHAR(128) NOT NULL,
                  nickname VARCHAR(64) NOT NULL,
                  profile_code VARCHAR(5) NULL,
                  avatar_data TEXT NULL,
                  text VARCHAR(200) NOT NULL,
                  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                  deleted_at DATETIME NULL
                )
                """
            )
        )
    session = sessionmaker(bind=engine, autoflush=False, autocommit=False)()
    return DbStore(session)


def test_device_register_upserts_token_and_notification_setting() -> None:
    api = client()

    created = signed_post(api, "/v1/device/register", {"device_id": "device-1", "fcm_token": "token-a"})
    updated = signed_post(api, "/v1/device/register", {"device_id": "device-1", "fcm_token": "token-b"})
    notification = signed_patch(
        api,
        "/v1/device/notification",
        {"notify_comment": False},
        {"X-Device-ID": "device-1"},
    )

    assert created.status_code == 200
    assert updated.json()["data"]["registered"] is True
    assert updated.json()["data"]["fcm_token"] == "token-b"
    assert notification.json()["data"]["notify_comment"] is False


def test_avatar_upload_applies_exif_orientation_before_snapshot() -> None:
    image = Image.new("RGB", (120, 60), "red")
    for x in range(60, 120):
        for y in range(60):
            image.putpixel((x, y), (0, 0, 255))
    exif = image.getexif()
    exif[274] = 6
    raw = io.BytesIO()
    image.save(raw, format="JPEG", exif=exif.tobytes())

    class Store:
        avatar_base64: str | None = None

        def update_avatar(self, device_id: str, avatar_data: str | None) -> None:
            self.avatar_base64 = avatar_data

    store = Store()

    update_avatar(
        AvatarUpdateRequest(avatar_base64=base64.b64encode(raw.getvalue()).decode()),
        x_device_id="device-1",
        store=store,
    )

    assert store.avatar_base64 is not None
    saved = Image.open(io.BytesIO(base64.b64decode(store.avatar_base64)))
    top = saved.crop((0, 0, saved.width, 24)).resize((1, 1)).getpixel((0, 0))
    bottom = (
        saved.crop((0, saved.height - 24, saved.width, saved.height))
        .resize((1, 1))
        .getpixel((0, 0))
    )

    assert top[0] > 200 and top[2] < 80
    assert bottom[2] > 200 and bottom[0] < 80


def test_post_create_blocks_urls_with_envelope_error() -> None:
    api = client()
    signed_post(api, "/v1/device/register", {"device_id": "device-1", "fcm_token": "token"})

    response = signed_post(
        api,
        "/v1/posts",
        {"rage_level": 3, "category": "driving", "text": "look https://example.com"},
        {"X-Device-ID": "device-1"},
    )

    assert response.status_code == 400
    assert response.json()["detail"]["error"]["code"] == "CONTENT_BLOCKED_URL"


def test_post_and_comment_creation_replace_file_based_profanity(monkeypatch) -> None:
    settings = build_settings(
        env={
            "APP_ENV": "local",
            "API_V1_PREFIX": "/v1",
            "APP_HMAC_SECRET": DEFAULT_HMAC_SECRET,
            "OPENAI_API_KEY": "",
        }
    )
    monkeypatch.setattr("app.main.get_settings", lambda: settings)
    monkeypatch.setattr("app.api.v1.posts.get_settings", lambda: settings)

    api = client()
    now = datetime.utcnow()

    class RouteStore:
        created_post_text: str | None = None
        created_comment_text: str | None = None

        def recent_post_attempts(self, device_id: str) -> list[datetime]:
            return []

        def create_post(self, *args) -> dict:
            self.created_post_text = args[5]
            return {"post_id": "post-1", "created_at": now}

        def recent_comment_attempts(self, device_id: str) -> list[datetime]:
            return []

        def create_comment(self, *args) -> dict:
            self.created_comment_text = args[4]
            return {
                "comment_id": "comment-1",
                "post_id": "post-1",
                "device_id": "device-1",
                "nickname": "테스터",
                "profile_code": "#4827",
                "text": args[4],
                "created_at": now,
                "post_owner_device_id": "device-1",
            }

        def get_device_token(self, device_id: str) -> None:
            return None

        def serialize_comment(self, comment: dict, device_id: str) -> dict:
            return comment

    route_store = RouteStore()
    api.app.dependency_overrides[get_db_store] = lambda: route_store
    headers = {"X-Device-ID": "device-1"}

    created_post = signed_post(
        api,
        "/v1/posts",
        {"nickname": "테스터", "rage_level": 3, "category": "work", "text": "시발 화난다"},
        headers,
    )
    created_comment = signed_post(
        api,
        "/v1/posts/post-1/comments",
        {"nickname": "테스터", "text": "댓글에도 시발 포함"},
        headers,
    )

    assert created_post.status_code == 201
    assert route_store.created_post_text == "멍멍 화난다"
    assert created_comment.status_code == 201
    assert route_store.created_comment_text == "댓글에도 멍멍 포함"
    assert created_comment.json()["data"]["text"] == "댓글에도 멍멍 포함"


def test_post_create_list_like_comment_and_delete_flow() -> None:
    api = client()
    signed_post(api, "/v1/device/register", {"device_id": "device-1", "fcm_token": "token"})

    created = signed_post(
        api,
        "/v1/posts",
        {"rage_level": 4, "category": "work", "text": "회의가 너무 늦게 잡혔다"},
        {"X-Device-ID": "device-1"},
    )
    post_id = created.json()["data"]["post_id"]

    listed = signed_get(api, "/v1/posts", {"X-Device-ID": "device-1"})
    liked = signed_post(api, f"/v1/posts/{post_id}/like", None, {"X-Device-ID": "device-1"})
    unliked = signed_post(api, f"/v1/posts/{post_id}/like", None, {"X-Device-ID": "device-1"})
    commented = signed_post(
        api,
        f"/v1/posts/{post_id}/comments",
        {"text": "나도 그랬어요"},
        {"X-Device-ID": "device-1"},
    )
    comments = signed_get(api, f"/v1/posts/{post_id}/comments", {"X-Device-ID": "device-1"})
    deleted = signed_delete(api, f"/v1/posts/{post_id}", {"X-Device-ID": "device-1"})
    after_delete = signed_get(api, "/v1/posts", {"X-Device-ID": "device-1"})

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


def test_comment_serialization_includes_author_avatar() -> None:
    store = DbStore.__new__(DbStore)
    now = datetime.utcnow()

    serialized = store.serialize_comment(
        {
            "comment_id": "comment-1",
            "device_id": "commenter",
            "nickname": "친구",
            "profile_code": "#1111",
            "text": "아바타가 있는 댓글",
            "created_at": now,
            "avatar_base64": "encoded-avatar",
        },
        "viewer",
    )

    assert serialized["avatar_base64"] == "encoded-avatar"
    assert serialized["profile_code"] == "#1111"


def test_post_avatar_is_snapshotted_when_post_is_created() -> None:
    store = sqlite_store()
    store.update_avatar("device-1", "avatar-at-post-time")

    store.create_post("device-1", "화난 호랑이", "#4827", 4, "work", "회의가 너무 늦게 잡혔다")
    store.update_avatar("device-1", "new-current-avatar")

    posts = store.list_posts_page("viewer", size=10)["posts"]

    assert posts[0]["nickname"] == "화난 호랑이"
    assert posts[0]["profile_code"] == "#4827"
    assert posts[0]["avatar_base64"] == "avatar-at-post-time"


def test_posts_are_ranked_weekly_by_likes_then_recent_creation() -> None:
    store = sqlite_store()
    created_posts = {
        "previous-week-popular": store.create_post(
            "device-1",
            "지난주",
            "#1111",
            3,
            "work",
            "지난주 인기 글",
        ),
        "current-week-low": store.create_post(
            "device-2",
            "이번주 낮은 좋아요",
            "#2222",
            3,
            "work",
            "이번주 낮은 좋아요 글",
        ),
        "current-week-high-old": store.create_post(
            "device-3",
            "이번주 높은 좋아요 옛글",
            "#3333",
            3,
            "work",
            "이번주 높은 좋아요 옛글",
        ),
        "current-week-high-new": store.create_post(
            "device-4",
            "이번주 높은 좋아요 새글",
            "#4444",
            3,
            "work",
            "이번주 높은 좋아요 새글",
        ),
    }
    updates = [
        ("previous-week-popular", "2026-06-28 09:00:00", 99),
        ("current-week-low", "2026-07-02 09:00:00", 1),
        ("current-week-high-old", "2026-06-30 09:00:00", 5),
        ("current-week-high-new", "2026-07-01 09:00:00", 5),
    ]
    for key, created_at, like_count in updates:
        store.session.execute(
            text(
                "UPDATE posts SET created_at = :created_at, like_count = :like_count "
                "WHERE post_id = :post_id"
            ),
            {
                "created_at": created_at,
                "like_count": like_count,
                "post_id": created_posts[key]["post_id"],
            },
        )
    store.session.commit()

    posts = store.list_posts_page("viewer", size=10)["posts"]

    assert [post["text"] for post in posts] == [
        "이번주 높은 좋아요 새글",
        "이번주 높은 좋아요 옛글",
        "이번주 낮은 좋아요 글",
        "지난주 인기 글",
    ]


def test_comment_avatar_is_snapshotted_when_comment_is_created() -> None:
    store = sqlite_store()
    store.create_post("owner", "작성자", "#1234", 3, "people", "원글")
    post_id = store.list_posts_page("viewer", size=10)["posts"][0]["post_id"]
    store.update_avatar("commenter", "avatar-at-comment-time")

    comment = store.create_comment(post_id, "commenter", "댓글러", "#5678", "나도 그랬어요")
    store.update_avatar("commenter", "new-current-avatar")

    comments = store.list_comments(post_id, "viewer", size=10)

    assert comment is not None
    assert comment["avatar_base64"] == "avatar-at-comment-time"
    assert comments[0]["nickname"] == "댓글러"
    assert comments[0]["profile_code"] == "#5678"
    assert comments[0]["avatar_base64"] == "avatar-at-comment-time"


def test_purchase_verify_updates_status() -> None:
    api = client()
    signed_post(api, "/v1/device/register", {"device_id": "device-1", "fcm_token": "token"})

    before = signed_get(api, "/v1/purchase/status", {"X-Device-ID": "device-1"})
    verified = signed_post(
        api,
        "/v1/purchase/verify",
        {"platform": "ios", "receipt_data": "receipt"},
        {"X-Device-ID": "device-1"},
    )
    after = signed_get(api, "/v1/purchase/status", {"X-Device-ID": "device-1"})

    assert before.json()["data"]["is_pro"] is False
    assert verified.json()["data"]["pro_activated"] is True
    assert after.json()["data"]["is_pro"] is True
    assert after.json()["data"]["purchased_at"] is not None


def test_other_device_cannot_delete_post_or_comment() -> None:
    api = client()
    signed_post(api, "/v1/device/register", {"device_id": "owner", "fcm_token": "token"})
    signed_post(api, "/v1/device/register", {"device_id": "other", "fcm_token": "token"})
    created = signed_post(
        api,
        "/v1/posts",
        {"rage_level": 3, "category": "people", "text": "말이 너무 날카로웠다"},
        {"X-Device-ID": "owner"},
    )
    post_id = created.json()["data"]["post_id"]
    comment = signed_post(
        api,
        f"/v1/posts/{post_id}/comments",
        {"text": "내 댓글"},
        {"X-Device-ID": "owner"},
    )
    comment_id = comment.json()["data"]["comment_id"]

    post_delete = signed_delete(api, f"/v1/posts/{post_id}", {"X-Device-ID": "other"})
    comment_delete = signed_delete(
        api,
        f"/v1/posts/{post_id}/comments/{comment_id}",
        {"X-Device-ID": "other"},
    )

    assert post_delete.status_code == 403
    assert post_delete.json()["detail"]["error"]["code"] == "FORBIDDEN"
    assert comment_delete.status_code == 403
    assert comment_delete.json()["detail"]["error"]["code"] == "FORBIDDEN"


def test_deleted_post_rejects_likes_and_comments() -> None:
    api = client()
    signed_post(api, "/v1/device/register", {"device_id": "owner", "fcm_token": "token"})
    created = signed_post(
        api,
        "/v1/posts",
        {"rage_level": 5, "category": "work", "text": "삭제될 글"},
        {"X-Device-ID": "owner"},
    )
    post_id = created.json()["data"]["post_id"]
    signed_delete(api, f"/v1/posts/{post_id}", {"X-Device-ID": "owner"})

    like = signed_post(api, f"/v1/posts/{post_id}/like", None, {"X-Device-ID": "owner"})
    comment = signed_post(
        api,
        f"/v1/posts/{post_id}/comments",
        {"text": "댓글 불가"},
        {"X-Device-ID": "owner"},
    )

    assert like.status_code == 404
    assert like.json()["detail"]["error"]["code"] == "POST_NOT_FOUND"
    assert comment.status_code == 404
    assert comment.json()["detail"]["error"]["code"] == "POST_NOT_FOUND"


def test_post_creation_rate_limits_sixth_attempt_in_sixty_seconds() -> None:
    api = client()
    signed_post(api, "/v1/device/register", {"device_id": "device-1", "fcm_token": "token"})

    responses = [
        signed_post(
            api,
            "/v1/posts",
            {"rage_level": 2, "category": "work", "text": f"attempt {index}"},
            {"X-Device-ID": "device-1"},
        )
        for index in range(6)
    ]

    assert [response.status_code for response in responses[:4]] == [201, 201, 201, 201]
    assert responses[4].status_code == 429
    assert responses[4].json()["detail"]["error"]["code"] == "RATE_LIMIT_EXCEEDED"
    assert responses[5].status_code == 429


def test_posts_cursor_pagination_returns_next_page() -> None:
    api = client()
    signed_post(api, "/v1/device/register", {"device_id": "device-1", "fcm_token": "token"})
    for index in range(3):
        signed_post(
            api,
            "/v1/posts",
            {"rage_level": 2, "category": "work", "text": f"post {index}"},
            {"X-Device-ID": "device-1"},
        )

    first_page = signed_get(api, "/v1/posts?size=2", {"X-Device-ID": "device-1"})
    next_cursor = first_page.json()["data"]["next_cursor"]
    second_page = signed_get(
        api,
        f"/v1/posts?size=2&cursor={next_cursor}",
        {"X-Device-ID": "device-1"},
    )

    assert first_page.json()["data"]["has_more"] is True
    assert len(first_page.json()["data"]["posts"]) == 2
    assert next_cursor is not None
    assert len(second_page.json()["data"]["posts"]) == 1
    assert second_page.json()["data"]["has_more"] is False


def test_request_without_signature_headers_is_rejected() -> None:
    api = client()

    response = api.post(
        "/v1/device/register",
        json={"device_id": "device-1", "fcm_token": "token"},
    )

    assert response.status_code == 401
    assert response.json()["error"]["code"] == "SIGNATURE_REQUIRED"


def test_request_with_tampered_signature_is_rejected() -> None:
    api = client()
    body = json.dumps({"device_id": "device-1", "fcm_token": "token"}, separators=(",", ":"))
    headers = _signed_headers("POST", "/v1/device/register", body)
    headers["X-Signature"] = "0" * 64
    headers["Content-Type"] = "application/json"

    response = api.post("/v1/device/register", headers=headers, content=body.encode("utf-8"))

    assert response.status_code == 401
    assert response.json()["error"]["code"] == "SIGNATURE_INVALID"


def test_request_with_expired_timestamp_is_rejected() -> None:
    api = client()
    body = json.dumps({"device_id": "device-1", "fcm_token": "token"}, separators=(",", ":"))
    old_timestamp = str(time.time() - 600)
    headers = _signed_headers("POST", "/v1/device/register", body, timestamp=old_timestamp)
    headers["Content-Type"] = "application/json"

    response = api.post("/v1/device/register", headers=headers, content=body.encode("utf-8"))

    assert response.status_code == 401
    assert response.json()["error"]["code"] == "SIGNATURE_EXPIRED"


def test_replayed_signature_is_rejected_on_second_use() -> None:
    api = client()
    body = json.dumps({"device_id": "device-1", "fcm_token": "token"}, separators=(",", ":"))
    headers = _signed_headers("POST", "/v1/device/register", body)
    headers["Content-Type"] = "application/json"

    first = api.post("/v1/device/register", headers=headers, content=body.encode("utf-8"))
    second = api.post("/v1/device/register", headers=headers, content=body.encode("utf-8"))

    assert first.status_code == 200
    assert second.status_code == 401
    assert second.json()["error"]["code"] == "SIGNATURE_REPLAY"
