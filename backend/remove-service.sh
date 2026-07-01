#!/bin/bash
# FuryNote Backend 서비스 중지 및 완전 삭제
set -e

SERVICE_NAME="furynote-backend"
SERVICE_FILE="/etc/systemd/system/${SERVICE_NAME}.service"

if [[ $EUID -ne 0 ]]; then
    echo "이 스크립트는 sudo 권한이 필요합니다."
    echo "사용법: sudo bash $0"
    exit 1
fi

if ! systemctl list-unit-files | grep -q "^${SERVICE_NAME}.service"; then
    echo "[정보] ${SERVICE_NAME} 서비스가 등록되어 있지 않습니다. 할 일이 없습니다."
    exit 0
fi

# 실행 중이면 중지
if systemctl is-active --quiet "$SERVICE_NAME"; then
    echo "서비스를 중지합니다..."
    systemctl stop "$SERVICE_NAME"
fi

# 부팅 자동 시작 해제
systemctl disable "$SERVICE_NAME" 2>/dev/null || true

# 유닛 파일 삭제
if [[ -f "$SERVICE_FILE" ]]; then
    rm -f "$SERVICE_FILE"
    echo "유닛 파일 삭제: $SERVICE_FILE"
fi

systemctl daemon-reload
systemctl reset-failed 2>/dev/null || true

echo ""
echo "[완료] ${SERVICE_NAME} 서비스가 완전히 삭제되었습니다."
