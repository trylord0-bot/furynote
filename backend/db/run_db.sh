#!/usr/bin/env bash
set -euo pipefail

DB_ROOT_PASSWORD="${DB_ROOT_PASSWORD:-furynote}"
DB_NAME="${DB_NAME:-furynote}"
DB_USER="${DB_USER:-furynote}"
DB_PASSWORD="${DB_PASSWORD:-furynote}"
DB_HOST_PORT="${DB_HOST_PORT:-3307}"
TZ="${TZ:-Asia/Seoul}"
DATA_DIR="${DATA_DIR:-./data}"

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "==================================================="
echo "       Fury Note MariaDB Docker 자동 실행 스크립트"
echo "==================================================="

if ! command -v docker >/dev/null 2>&1; then
  echo "[오류] docker 명령을 찾을 수 없습니다. Docker Engine을 설치하고 다시 실행하세요."
  exit 1
fi

if docker compose version >/dev/null 2>&1; then
  COMPOSE=(docker compose)
elif command -v docker-compose >/dev/null 2>&1; then
  COMPOSE=(docker-compose)
else
  echo "[오류] Docker Compose를 찾을 수 없습니다. docker compose 플러그인 또는 docker-compose를 설치하세요."
  exit 1
fi

if [[ ! -f "schema.sql" ]]; then
  echo "[오류] schema.sql 파일을 찾을 수 없습니다. backend/db에서 실행되는지 확인하세요."
  exit 1
fi

export DB_ROOT_PASSWORD DB_NAME DB_USER DB_PASSWORD DB_HOST_PORT TZ DATA_DIR

mkdir -p "$DATA_DIR"

if [[ -n "$(ls -A "$DATA_DIR" 2>/dev/null)" ]]; then
  echo "[알림] 기존 데이터 디렉토리 '$DATA_DIR'을 발견했습니다. 초기화를 건너뜁니다."
else
  echo "[알림] 데이터 디렉토리 '$DATA_DIR'이 비어 있습니다. 첫 실행으로 보고 DB를 초기화합니다."
  echo "[진행] MariaDB 컨테이너가 처음 뜰 때 schema.sql이 자동 적용됩니다."
fi

echo "---------------------------------------------------"
echo "[설정] DB=${DB_NAME}, USER=${DB_USER}, PORT=${DB_HOST_PORT}->3306"
echo "[실행] MariaDB 서버를 백그라운드로 시작합니다..."
echo "---------------------------------------------------"

"${COMPOSE[@]}" -f docker-compose.yml up -d mariadb

echo "[완료] MariaDB가 백그라운드에서 실행 중입니다."
echo "[확인] 로그 보기: docker compose -f $(pwd)/docker-compose.yml logs -f mariadb"
echo "[종료] 중지하려면: $(pwd)/stop_db.sh"
