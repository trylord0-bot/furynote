#!/bin/bash
# FuryNote Backend 서비스 시작
set -e

SERVICE_NAME="furynote-backend"

if [[ $EUID -ne 0 ]]; then
    echo "이 스크립트는 sudo 권한이 필요합니다."
    echo "사용법: sudo bash $0"
    exit 1
fi

if ! systemctl list-unit-files | grep -q "^${SERVICE_NAME}.service"; then
    echo "[오류] ${SERVICE_NAME} 서비스가 등록되어 있지 않습니다."
    echo "       먼저 install-service.sh를 실행하세요."
    exit 1
fi

systemctl start "$SERVICE_NAME"
sleep 1
systemctl status "$SERVICE_NAME" --no-pager

echo ""
echo "[완료] ${SERVICE_NAME} 서비스가 시작되었습니다."
echo "로그 확인: sudo journalctl -u $SERVICE_NAME -f"
