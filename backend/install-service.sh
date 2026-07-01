#!/bin/bash
# FuryNote Backend systemd 서비스 등록 스크립트
set -e

SERVICE_NAME="furynote-backend"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKEND_DIR="$(cd "$SCRIPT_DIR/../backend" && pwd)"
SERVICE_FILE="/etc/systemd/system/${SERVICE_NAME}.service"

# root 권한 확인
if [[ $EUID -ne 0 ]]; then
    echo "이 스크립트는 sudo 권한이 필요합니다."
    echo "사용법: sudo bash $0"
    exit 1
fi

# 이미 등록된 서비스 확인
if systemctl list-unit-files | grep -q "^${SERVICE_NAME}.service"; then
    echo "[경고] ${SERVICE_NAME} 서비스가 이미 등록되어 있습니다."
    echo "       재설치하려면 먼저 remove-service.sh를 실행하세요."
    exit 1
fi

# Python 가상환경 탐지
if [[ -f "$BACKEND_DIR/.venv/bin/python" ]]; then
    PYTHON_BIN="$BACKEND_DIR/.venv/bin/python"
elif [[ -f "$BACKEND_DIR/venv/bin/python" ]]; then
    PYTHON_BIN="$BACKEND_DIR/venv/bin/python"
else
    PYTHON_BIN="$(which python3)"
    echo "[경고] 가상환경을 찾지 못했습니다. 시스템 Python을 사용합니다: $PYTHON_BIN"
fi

# 실행 사용자 (현재 로그인 사용자, root가 아닐 경우)
RUN_USER="${SUDO_USER:-$(logname 2>/dev/null || echo www-data)}"

echo "서비스 설정 정보:"
echo "  서비스 이름  : $SERVICE_NAME"
echo "  백엔드 경로  : $BACKEND_DIR"
echo "  Python 경로  : $PYTHON_BIN"
echo "  실행 사용자  : $RUN_USER"
echo ""

# systemd 유닛 파일 생성
cat > "$SERVICE_FILE" <<EOF
[Unit]
Description=FuryNote Backend API (uvicorn)
After=network.target mariadb.service
Wants=mariadb.service

[Service]
Type=simple
User=${RUN_USER}
WorkingDirectory=${BACKEND_DIR}
ExecStart=${PYTHON_BIN} run.py
Restart=on-failure
RestartSec=5
StandardOutput=journal
StandardError=journal
SyslogIdentifier=${SERVICE_NAME}
EnvironmentFile=-${BACKEND_DIR}/.env

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable "$SERVICE_NAME"

echo ""
echo "[완료] ${SERVICE_NAME} 서비스가 등록되었습니다."
echo ""
echo "다음 명령으로 서비스를 시작하세요:"
echo "  sudo bash start-service.sh"
echo "  또는: sudo systemctl start $SERVICE_NAME"
