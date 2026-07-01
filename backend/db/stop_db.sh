#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "==================================================="
echo "       Fury Note MariaDB Docker 종료 스크립트"
echo "==================================================="

if ! command -v docker >/dev/null 2>&1; then
  echo "[오류] docker 명령을 찾을 수 없습니다."
  exit 1
fi

if docker compose version >/dev/null 2>&1; then
  COMPOSE=(docker compose)
elif command -v docker-compose >/dev/null 2>&1; then
  COMPOSE=(docker-compose)
else
  echo "[오류] Docker Compose를 찾을 수 없습니다."
  exit 1
fi

echo "[실행] MariaDB 컨테이너를 종료합니다..."

"${COMPOSE[@]}" -f docker-compose.yml stop mariadb

echo "[완료] MariaDB가 종료되었습니다."
