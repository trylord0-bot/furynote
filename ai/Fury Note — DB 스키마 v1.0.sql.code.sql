-- =====================================================
-- Fury Note — DB 스키마 v1.0
-- DB: MariaDB
-- 최종 업데이트: 2026-06-10
-- =====================================================

-- -----------------------------------------------------
-- 1. device_tokens
-- 기기 등록 및 FCM 토큰 관리
-- -----------------------------------------------------
CREATE TABLE device_tokens (
  id               BIGINT        NOT NULL AUTO_INCREMENT,
  device_id        VARCHAR(128)  NOT NULL COMMENT '기기 고유 ID',
  fcm_token        VARCHAR(256)  NOT NULL COMMENT 'Firebase FCM 토큰',
  notify_comment   TINYINT(1)    NOT NULL DEFAULT 1 COMMENT '댓글 알림 ON/OFF',
  created_at       DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at       DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

  PRIMARY KEY (id),
  UNIQUE KEY uq_device_id (device_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='기기 등록 및 FCM 토큰';


-- -----------------------------------------------------
-- 2. posts
-- 커뮤니티 피드 포스팅
-- -----------------------------------------------------
CREATE TABLE posts (
  id               BIGINT        NOT NULL AUTO_INCREMENT,
  post_id          VARCHAR(36)   NOT NULL COMMENT 'UUID (공개용 ID)',
  device_id        VARCHAR(128)  NOT NULL COMMENT '작성자 기기 ID',
  nickname         VARCHAR(64)   NOT NULL COMMENT '작성 시점 닉네임 스냅샷',
  rage_level       TINYINT       NOT NULL COMMENT '분노 강도 (1~5)',
  category         VARCHAR(32)   NOT NULL COMMENT 'family/romance/work/people/driving/custom',
  text             TEXT          NULL     COMMENT '포스팅 텍스트 (없으면 NULL)',
  like_count       INT           NOT NULL DEFAULT 0 COMMENT '공감 수 (캐싱)',
  comment_count    INT           NOT NULL DEFAULT 0 COMMENT '댓글 수 (캐싱, soft delete 제외)',
  created_at       DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted_at       DATETIME      NULL     DEFAULT NULL COMMENT 'soft delete 시각',

  PRIMARY KEY (id),
  UNIQUE KEY uq_post_id (post_id),
  KEY idx_device_id (device_id),
  KEY idx_created_at (created_at DESC),
  KEY idx_deleted_at (deleted_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='커뮤니티 피드 포스팅';


-- -----------------------------------------------------
-- 3. post_likes
-- 포스팅 공감 (토글)
-- -----------------------------------------------------
CREATE TABLE post_likes (
  id               BIGINT        NOT NULL AUTO_INCREMENT,
  post_id          VARCHAR(36)   NOT NULL COMMENT '포스팅 UUID',
  device_id        VARCHAR(128)  NOT NULL COMMENT '공감한 기기 ID',
  created_at       DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,

  PRIMARY KEY (id),
  UNIQUE KEY uq_post_like (post_id, device_id),
  KEY idx_post_id (post_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='포스팅 공감';


-- -----------------------------------------------------
-- 4. comments
-- 포스팅 댓글
-- -----------------------------------------------------
CREATE TABLE comments (
  id               BIGINT        NOT NULL AUTO_INCREMENT,
  comment_id       VARCHAR(36)   NOT NULL COMMENT 'UUID (공개용 ID)',
  post_id          VARCHAR(36)   NOT NULL COMMENT '포스팅 UUID',
  device_id        VARCHAR(128)  NOT NULL COMMENT '작성자 기기 ID',
  nickname         VARCHAR(64)   NOT NULL COMMENT '작성 시점 닉네임 스냅샷',
  text             VARCHAR(200)  NOT NULL COMMENT '댓글 내용 (최대 200자)',
  created_at       DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted_at       DATETIME      NULL     DEFAULT NULL COMMENT 'soft delete 시각',

  PRIMARY KEY (id),
  UNIQUE KEY uq_comment_id (comment_id),
  KEY idx_post_id (post_id),
  KEY idx_device_id (device_id),
  KEY idx_deleted_at (deleted_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='포스팅 댓글';


-- -----------------------------------------------------
-- 5. pro_purchases
-- PRO 플랜 구매 내역
-- -----------------------------------------------------
CREATE TABLE pro_purchases (
  id               BIGINT        NOT NULL AUTO_INCREMENT,
  device_id        VARCHAR(128)  NOT NULL COMMENT '구매한 기기 ID',
  platform         ENUM('ios','android') NOT NULL COMMENT '결제 플랫폼',
  receipt_data     TEXT          NOT NULL COMMENT '영수증 원본 (검증용)',
  purchased_at     DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,

  PRIMARY KEY (id),
  UNIQUE KEY uq_device_id (device_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='PRO 플랜 구매 내역';


-- =====================================================
-- 인덱스 설계 노트
-- =====================================================
--
-- [posts]
--   idx_created_at  : 피드 최신순 조회 (커서 기반 페이지네이션)
--   idx_device_id   : 내 포스팅 조회 / 어뷰징 감지
--   idx_deleted_at  : soft delete 필터링
--
-- [post_likes]
--   uq_post_like    : 중복 공감 방지 + 공감 여부 조회
--   idx_post_id     : 포스팅별 공감 수 집계
--
-- [comments]
--   idx_post_id     : 포스팅별 댓글 목록 조회
--   idx_device_id   : 내 댓글 조회
--   idx_deleted_at  : soft delete 필터링
--
-- =====================================================


-- =====================================================
-- 주요 쿼리 예시
-- =====================================================

-- [피드 목록 조회 - 커서 기반, soft delete 제외]
-- SELECT post_id, nickname, rage_level, category, text,
--        like_count, comment_count, created_at
-- FROM   posts
-- WHERE  deleted_at IS NULL
--   AND  created_at < {cursor}   -- 커서: 이전 마지막 created_at
-- ORDER  BY created_at DESC
-- LIMIT  20;

-- [공감 여부 확인]
-- SELECT COUNT(*) FROM post_likes
-- WHERE  post_id = {post_id} AND device_id = {device_id};

-- [공감 토글 - 추가]
-- INSERT INTO post_likes (post_id, device_id) VALUES ({post_id}, {device_id});
-- UPDATE posts SET like_count = like_count + 1 WHERE post_id = {post_id};

-- [공감 토글 - 취소]
-- DELETE FROM post_likes WHERE post_id = {post_id} AND device_id = {device_id};
-- UPDATE posts SET like_count = like_count - 1 WHERE post_id = {post_id};

-- [댓글 목록 조회 - 커서 기반, soft delete 제외]
-- SELECT comment_id, nickname, text, device_id, created_at
-- FROM   comments
-- WHERE  post_id = {post_id}
--   AND  deleted_at IS NULL
--   AND  created_at > {cursor}   -- 커서: 이전 마지막 created_at
-- ORDER  BY created_at ASC
-- LIMIT  30;

-- [포스팅 soft delete - 댓글 cascade]
-- UPDATE posts    SET deleted_at = NOW() WHERE post_id = {post_id};
-- UPDATE comments SET deleted_at = NOW() WHERE post_id = {post_id};

-- [어뷰징 감지 - 60초 내 포스팅 횟수]
-- SELECT COUNT(*) FROM posts
-- WHERE  device_id = {device_id}
--   AND  created_at >= NOW() - INTERVAL 60 SECOND
--   AND  deleted_at IS NULL;

-- [PRO 상태 확인]
-- SELECT purchased_at FROM pro_purchases WHERE device_id = {device_id};