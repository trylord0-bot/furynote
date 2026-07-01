#!/bin/bash
# FuryNote Backend 서비스 중지
set -e

SERVICE_NAME="furynote-backend"

if [[ $EUID -ne 0 ]]; then
    echo "이 스크립트는 sudo 권한이 필요합니다."
    echo "사용법: sudo bash $0"
    exit 1
fi

if ! systemctl list-unit-files | grep -q "^${SERVICE_NAME}.service"; then
    echo "[오류] ${SERVICE_NAME} 서비스가 등록되어 있지 않습니다."
    exit 1
fi

if ! systemctl is-active --quiet "$SERVICE_NAME"; then
    echo "[정보] ${SERVICE_NAME} 서비스가 이미 중지되어 있습니다."
    exit 0
fi

systemctl stop "$SERVICE_NAME"

echo "[완료] ${SERVICE_NAME} 서비스가 중지되었습니다."
