-- Fury Note MariaDB schema
-- Local development uses DB_PORT=3303. Non-local environments default to 3306.

CREATE TABLE device_tokens (
  id               BIGINT        NOT NULL AUTO_INCREMENT,
  device_id        VARCHAR(128)  NOT NULL COMMENT 'Device identifier',
  fcm_token        VARCHAR(256)  NOT NULL COMMENT 'Firebase FCM token',
  notify_comment   TINYINT(1)    NOT NULL DEFAULT 1 COMMENT 'Comment notification enabled',
  created_at       DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at       DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

  PRIMARY KEY (id),
  UNIQUE KEY uq_device_id (device_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Device tokens';

CREATE TABLE posts (
  id               BIGINT        NOT NULL AUTO_INCREMENT,
  post_id          VARCHAR(36)   NOT NULL COMMENT 'Public UUID',
  device_id        VARCHAR(128)  NOT NULL COMMENT 'Author device ID',
  nickname         VARCHAR(64)   NOT NULL COMMENT 'Nickname snapshot',
  rage_level       TINYINT       NOT NULL COMMENT 'Rage level, 1 to 5',
  category         VARCHAR(32)   NOT NULL COMMENT 'family/romance/work/people/driving/custom',
  text             TEXT          NULL     COMMENT 'Post text',
  like_count       INT           NOT NULL DEFAULT 0 COMMENT 'Cached like count',
  comment_count    INT           NOT NULL DEFAULT 0 COMMENT 'Cached visible comment count',
  created_at       DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted_at       DATETIME      NULL     DEFAULT NULL COMMENT 'Soft delete timestamp',

  PRIMARY KEY (id),
  UNIQUE KEY uq_post_id (post_id),
  KEY idx_device_id (device_id),
  KEY idx_created_at (created_at DESC),
  KEY idx_deleted_at (deleted_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Community posts';

CREATE TABLE post_likes (
  id               BIGINT        NOT NULL AUTO_INCREMENT,
  post_id          VARCHAR(36)   NOT NULL COMMENT 'Post UUID',
  device_id        VARCHAR(128)  NOT NULL COMMENT 'Liking device ID',
  created_at       DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,

  PRIMARY KEY (id),
  UNIQUE KEY uq_post_like (post_id, device_id),
  KEY idx_post_id (post_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Post likes';

CREATE TABLE comments (
  id               BIGINT        NOT NULL AUTO_INCREMENT,
  comment_id       VARCHAR(36)   NOT NULL COMMENT 'Public UUID',
  post_id          VARCHAR(36)   NOT NULL COMMENT 'Post UUID',
  device_id        VARCHAR(128)  NOT NULL COMMENT 'Author device ID',
  nickname         VARCHAR(64)   NOT NULL COMMENT 'Nickname snapshot',
  text             VARCHAR(200)  NOT NULL COMMENT 'Comment text',
  created_at       DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted_at       DATETIME      NULL     DEFAULT NULL COMMENT 'Soft delete timestamp',

  PRIMARY KEY (id),
  UNIQUE KEY uq_comment_id (comment_id),
  KEY idx_post_id (post_id),
  KEY idx_device_id (device_id),
  KEY idx_deleted_at (deleted_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Post comments';

CREATE TABLE pro_purchases (
  id               BIGINT        NOT NULL AUTO_INCREMENT,
  device_id        VARCHAR(128)  NOT NULL COMMENT 'Purchasing device ID',
  platform         ENUM('ios','android') NOT NULL COMMENT 'Purchase platform',
  receipt_data     TEXT          NOT NULL COMMENT 'Receipt payload',
  purchased_at     DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,

  PRIMARY KEY (id),
  UNIQUE KEY uq_device_id (device_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='PRO purchase records';
