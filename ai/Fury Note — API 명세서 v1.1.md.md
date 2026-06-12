# 📡 Fury Note — API 명세서 v1.1
> 최종 업데이트: 2026-06-10
> Base URL: `https://api.furynote.app/v1`

---

## 공통 규칙

### 인증
모든 API 요청에 아래 헤더를 포함해야 한다.
```
X-Device-ID: {device_id}
```

### 공통 응답 포맷
```json
{
  "success": true,
  "data": { ... },
  "error": null
}
```

### 공통 에러 포맷
```json
{
  "success": false,
  "data": null,
  "error": {
    "code": "ERROR_CODE",
    "message": "에러 설명"
  }
}
```

### 에러 코드 목록

| 코드 | HTTP Status | 설명 |
|---|:---:|---|
| `DEVICE_NOT_FOUND` | 404 | 등록되지 않은 device_id |
| `INVALID_REQUEST` | 400 | 요청 파라미터 오류 |
| `POST_NOT_FOUND` | 404 | 존재하지 않는 포스팅 |
| `COMMENT_NOT_FOUND` | 404 | 존재하지 않는 댓글 |
| `FORBIDDEN` | 403 | 본인 소유가 아닌 리소스 접근 |
| `CONTENT_BLOCKED_URL` | 400 | URL 포함으로 차단 |
| `CONTENT_BLOCKED_SPAM` | 400 | 광고성 키워드로 차단 |
| `CONTENT_BLOCKED_MODERATION` | 400 | OpenAI Moderation으로 차단 |
| `RATE_LIMIT_EXCEEDED` | 429 | 60초 내 5회 이상 포스팅 시도 |
| `PURCHASE_INVALID` | 400 | 영수증 검증 실패 |
| `PURCHASE_ALREADY_EXISTS` | 409 | 이미 PRO 구매 완료된 기기 |
| `INTERNAL_ERROR` | 500 | 서버 내부 오류 |

---

## 1. Device

### 1-1. 기기 등록
앱 최초 실행 시 device_id와 FCM 토큰을 서버에 등록한다.

```
POST /device/register
```

**Request Body**
```json
{
  "device_id": "abc123xyz",
  "fcm_token": "fcm_token_string"
}
```

| 필드 | 타입 | 필수 | 설명 |
|---|---|:---:|---|
| `device_id` | string | ✅ | 기기 고유 ID |
| `fcm_token` | string | ✅ | Firebase FCM 토큰 |

**Response 200**
```json
{
  "success": true,
  "data": {
    "registered": true
  },
  "error": null
}
```

> 이미 등록된 device_id인 경우 FCM 토큰만 갱신 후 200 반환 (upsert 처리)

---

### 1-2. FCM 토큰 갱신
FCM 토큰이 갱신될 때 서버에 업데이트한다.

```
PATCH /device/token
```

**Request Header**
```
X-Device-ID: {device_id}
```

**Request Body**
```json
{
  "fcm_token": "new_fcm_token_string"
}
```

| 필드 | 타입 | 필수 | 설명 |
|---|---|:---:|---|
| `fcm_token` | string | ✅ | 갱신된 FCM 토큰 |

**Response 200**
```json
{
  "success": true,
  "data": {
    "updated": true
  },
  "error": null
}
```

---

### 1-3. 알림 설정 동기화
댓글 알림 ON/OFF 상태를 서버에 동기화한다.
(불필요한 FCM 발송 방지 목적)

```
PATCH /device/notification
```

**Request Header**
```
X-Device-ID: {device_id}
```

**Request Body**
```json
{
  "notify_comment": true
}
```

| 필드 | 타입 | 필수 | 설명 |
|---|---|:---:|---|
| `notify_comment` | boolean | ✅ | 댓글 알림 ON/OFF |

**Response 200**
```json
{
  "success": true,
  "data": {
    "updated": true
  },
  "error": null
}
```

---

## 2. Posts (피드)

### 2-1. 포스팅 등록
노트 기반 포스팅을 피드에 등록한다.
등록 전 콘텐츠 필터링 및 어뷰징 감지를 수행한다.

```
POST /posts
```

**Request Header**
```
X-Device-ID: {device_id}
```

**Request Body**
```json
{
  "rage_level": 3,
  "category": "driving",
  "text": "옆 차선 차가 갑자기 끼어들었는데 사과도 없이 가버림."
}
```

| 필드 | 타입 | 필수 | 설명 |
|---|---|:---:|---|
| `rage_level` | integer | ✅ | 분노 강도 (1~5) |
| `category` | string | ✅ | 카테고리 (family / romance / work / people / driving / custom) |
| `text` | string | ⬜ | 포스팅 텍스트 (없으면 null) |

**필터링 처리 순서**
```
[텍스트 있을 경우]
1. URL 포함 여부 확인 → CONTENT_BLOCKED_URL
2. 광고성 키워드 필터 → CONTENT_BLOCKED_SPAM
3. OpenAI Moderation API → CONTENT_BLOCKED_MODERATION

[항상 실행]
4. 60초 내 5회 이상 포스팅 감지 → RATE_LIMIT_EXCEEDED
```

**Response 201**
```json
{
  "success": true,
  "data": {
    "post_id": "post_uuid",
    "created_at": "2026-06-10T21:30:00+09:00"
  },
  "error": null
}
```

**Response 400 / 429 (차단 예시)**
```json
{
  "success": false,
  "data": null,
  "error": {
    "code": "RATE_LIMIT_EXCEEDED",
    "message": "잠시 후 다시 시도해주세요."
  }
}
```

---

### 2-2. 피드 목록 조회
최신순으로 포스팅 목록을 조회한다. 커서 기반 페이지네이션 적용.
댓글은 별도 API로 조회하며 피드 응답에 포함하지 않는다.

```
GET /posts
```

**Request Header**
```
X-Device-ID: {device_id}
```

**Query Parameters**

| 파라미터 | 타입 | 필수 | 설명 |
|---|---|:---:|---|
| `cursor` | string | ⬜ | 이전 응답의 `next_cursor` 값. 없으면 최신부터 조회 |
| `size` | integer | ⬜ | 한 번에 가져올 개수 (기본값: 20, 최대: 50) |

**Response 200**
```json
{
  "success": true,
  "data": {
    "posts": [
      {
        "post_id": "post_uuid",
        "nickname": "화난 호랑이#4827",
        "rage_level": 3,
        "category": "driving",
        "text": "옆 차선 차가 갑자기 끼어들었는데 사과도 없이 가버림.",
        "like_count": 12,
        "comment_count": 3,
        "is_liked": false,
        "is_mine": false,
        "created_at": "2026-06-10T21:30:00+09:00"
      }
    ],
    "next_cursor": "cursor_string_or_null",
    "has_more": true
  },
  "error": null
}
```

| 필드 | 설명 |
|---|---|
| `is_liked` | 현재 기기가 공감했는지 여부 |
| `is_mine` | 현재 기기가 작성한 포스팅인지 여부 |
| `comment_count` | soft delete된 댓글은 카운트에서 제외 |
| `next_cursor` | 다음 페이지 요청 시 사용. 마지막 페이지면 `null` |
| `has_more` | 다음 페이지 존재 여부 |

---

### 2-3. 포스팅 삭제
본인이 작성한 포스팅을 삭제한다.
포스팅 및 하위 댓글 전체를 soft delete 처리한다.

```
DELETE /posts/{post_id}
```

**Request Header**
```
X-Device-ID: {device_id}
```

**Soft Delete 처리 범위**
```
posts.deleted_at = NOW()          ← 포스팅 soft delete
comments.deleted_at = NOW()       ← 하위 댓글 전체 soft delete (cascade)
```

> soft delete된 포스팅은 피드 목록 조회에서 제외된다.
> soft delete된 댓글은 댓글 목록 조회에서 제외된다.

**Response 200**
```json
{
  "success": true,
  "data": {
    "deleted": true
  },
  "error": null
}
```

**에러 케이스**
- `POST_NOT_FOUND` (404): 존재하지 않거나 이미 삭제된 포스팅
- `FORBIDDEN` (403): 본인 포스팅이 아님

---

### 2-4. 공감 토글
포스팅에 공감을 추가하거나 취소한다.

```
POST /posts/{post_id}/like
```

**Request Header**
```
X-Device-ID: {device_id}
```

**Response 200**
```json
{
  "success": true,
  "data": {
    "is_liked": true,
    "like_count": 13
  },
  "error": null
}
```

> 이미 공감한 상태에서 호출 시 공감 취소 (토글)
> `is_liked: true` → 공감 추가됨 / `is_liked: false` → 공감 취소됨

---

### 2-5. 댓글 작성
포스팅에 댓글을 작성한다. 작성 완료 후 포스팅 작성자에게 FCM 푸시 발송.

```
POST /posts/{post_id}/comments
```

**Request Header**
```
X-Device-ID: {device_id}
```

**Request Body**
```json
{
  "text": "저도 그런 경험 있어요 ㅠㅠ"
}
```

| 필드 | 타입 | 필수 | 설명 |
|---|---|:---:|---|
| `text` | string | ✅ | 댓글 내용 (최대 200자) |

**Response 201**
```json
{
  "success": true,
  "data": {
    "comment_id": "comment_uuid",
    "nickname": "뿔난 곰#1234",
    "text": "저도 그런 경험 있어요 ㅠㅠ",
    "is_mine": true,
    "created_at": "2026-06-10T21:35:00+09:00"
  },
  "error": null
}
```

**FCM 푸시 발송 조건**
- 포스팅 작성자 ≠ 댓글 작성자 (자기 글에 자기 댓글 시 푸시 미발송)
- 포스팅 작성자의 `notify_comment = true`
- 포스팅이 soft delete 상태가 아닐 것

**에러 케이스**
- `POST_NOT_FOUND` (404): 존재하지 않거나 삭제된 포스팅

---

### 2-6. 댓글 목록 조회
특정 포스팅의 댓글 목록을 조회한다.
soft delete된 댓글은 결과에서 제외한다.

```
GET /posts/{post_id}/comments
```

**Request Header**
```
X-Device-ID: {device_id}
```

**Query Parameters**

| 파라미터 | 타입 | 필수 | 설명 |
|---|---|:---:|---|
| `cursor` | string | ⬜ | 커서 값. 없으면 처음부터 조회 |
| `size` | integer | ⬜ | 한 번에 가져올 개수 (기본값: 30) |

**Response 200**
```json
{
  "success": true,
  "data": {
    "comments": [
      {
        "comment_id": "comment_uuid",
        "nickname": "뿔난 곰#1234",
        "text": "저도 그런 경험 있어요 ㅠㅠ",
        "is_mine": false,
        "created_at": "2026-06-10T21:35:00+09:00"
      }
    ],
    "next_cursor": "cursor_string_or_null",
    "has_more": false
  },
  "error": null
}
```

**에러 케이스**
- `POST_NOT_FOUND` (404): 존재하지 않거나 삭제된 포스팅

---

### 2-7. 댓글 삭제
본인이 작성한 댓글을 soft delete 처리한다.

```
DELETE /posts/{post_id}/comments/{comment_id}
```

**Request Header**
```
X-Device-ID: {device_id}
```

**Soft Delete 처리**
```
comments.deleted_at = NOW()
```

> soft delete된 댓글은 댓글 목록 조회 및 comment_count에서 제외된다.

**Response 200**
```json
{
  "success": true,
  "data": {
    "deleted": true
  },
  "error": null
}
```

**에러 케이스**
- `COMMENT_NOT_FOUND` (404): 존재하지 않거나 이미 삭제된 댓글
- `FORBIDDEN` (403): 본인 댓글이 아님

---

## 3. Purchase (PRO 결제)

### 3-1. 영수증 검증 및 PRO 활성화
인앱 결제 완료 후 영수증을 서버에 전달하여 검증하고 PRO 상태를 저장한다.

```
POST /purchase/verify
```

**Request Header**
```
X-Device-ID: {device_id}
```

**Request Body**
```json
{
  "platform": "ios",
  "receipt_data": "base64_encoded_receipt_string"
}
```

| 필드 | 타입 | 필수 | 설명 |
|---|---|:---:|---|
| `platform` | string | ✅ | `ios` 또는 `android` |
| `receipt_data` | string | ✅ | iOS: Base64 영수증 / Android: purchaseToken |

**서버 처리 흐름**
```
영수증 수신
      ↓
[iOS]     App Store 서버 검증 API 호출 (httpx)
[Android] Google Play Developer API 호출 (httpx)
      ↓
검증 성공 → pro_purchases 테이블에 저장
      ↓
200 반환
```

**Response 200**
```json
{
  "success": true,
  "data": {
    "pro_activated": true,
    "purchased_at": "2026-06-10T21:00:00+09:00"
  },
  "error": null
}
```

**에러 케이스**
- `PURCHASE_INVALID` (400): 영수증 검증 실패
- `PURCHASE_ALREADY_EXISTS` (409): 이미 PRO 구매 완료

---

### 3-2. PRO 상태 확인
현재 기기의 PRO 구매 여부를 확인한다.
앱 실행 시 또는 구매 복원 시 호출.

```
GET /purchase/status
```

**Request Header**
```
X-Device-ID: {device_id}
```

**Response 200**
```json
{
  "success": true,
  "data": {
    "is_pro": true,
    "purchased_at": "2026-06-10T21:00:00+09:00"
  },
  "error": null
}
```

> PRO 미구매 기기의 경우 `is_pro: false`, `purchased_at: null` 반환

---

## 부록. API 호출 시나리오

### 앱 최초 실행
```
1. POST /device/register   ← device_id + FCM 토큰 등록
2. GET  /purchase/status   ← PRO 여부 확인
```

### 피드 진입
```
1. GET /posts              ← 최신 피드 조회 (cursor 없이)
2. GET /posts?cursor=xxx   ← 스크롤 시 다음 페이지
```

### 포스팅 상세 (댓글 보기)
```
1. GET /posts/{post_id}/comments          ← 댓글 첫 페이지
2. GET /posts/{post_id}/comments?cursor=xxx ← 스크롤 시 다음 페이지
```

### 포스팅 등록
```
1. POST /posts             ← 포스팅 등록 (필터링 자동 수행)
```

### 포스팅 삭제
```
1. DELETE /posts/{post_id}
   → posts soft delete
   → 하위 comments 전체 soft delete (cascade)
```

### 댓글 작성
```
1. POST /posts/{post_id}/comments   ← 댓글 등록
   → 서버에서 FCM 푸시 자동 발송
```

### PRO 구매
```
1. (Flutter) in_app_purchase 결제 UI 호출
2. POST /purchase/verify   ← 영수증 검증 + PRO 활성화
```

### 앱 재설치 / 구매 복원
```
1. POST /device/register   ← FCM 토큰 재등록
2. (Flutter) restorePurchases() / queryPurchases()
3. GET  /purchase/status   ← PRO 상태 재확인
```