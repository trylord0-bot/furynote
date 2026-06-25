@echo off
:: ===================================================
:: [MariaDB Portable 필수 폴더 안내]
:: 1. bin\         : DB 실행 파일 및 필수 DLL (필수)
:: 2. share\       : 에러 메시지 및 문자셋 정보 (필수)
:: 3. lib\plugin\  : 인증 및 스토리지 엔진 플러그인 (필수)
:: ===================================================

:: 아래 3가지를 환경에 맞게 수정하세요
set DB_USER=furynote
set DB_PASS=furynote
set DB_NAME=furynote

:: 1. 배치 파일 위치로 작업 폴더 이동
cd /d "%~dp0"

echo ===================================================
echo        MariaDB Portable 자동 실행 스크립트
echo ===================================================

IF NOT EXIST "data" (
    echo [알림] 'data' 폴더가 없습니다. 새로 생성하고 DB를 초기화합니다...
    mkdir data

    :: 2. DB 초기화
    bin\mysql_install_db.exe --datadir="%~dp0data"

    IF ERRORLEVEL 1 (
        echo [오류] 데이터베이스 초기화에 실패했습니다.
        rmdir /s /q data
        pause
        exit /b 1
    )
    echo [완료] 데이터베이스 초기화 완료.
    echo ---------------------------------------------------

    :: 3. schema.sql 적용을 위해 서버 임시 백그라운드 실행
    echo [진행] 임시 서버를 시작합니다...
    start /b bin\mariadbd.exe --defaults-file=my.ini --console
    timeout /t 5 /nobreak > nul

    :: 4. 상위 폴더의 schema.sql 실행
    IF EXIST "..\schema.sql" (
        echo [진행] schema.sql을 실행합니다... (경로: ..\schema.sql)
        bin\mysql.exe -u root -P 3307 --protocol=TCP < ..\schema.sql
        IF ERRORLEVEL 1 (
            echo [오류] schema.sql 실행 실패. 내용을 확인하세요.
        ) ELSE (
            echo [완료] schema.sql 적용 완료.
        )
    ) ELSE (
        echo [경고] ..\schema.sql 파일이 없습니다. 스킵합니다.
    )

    :: 5. furynote 유저 생성 및 권한 부여
    echo [진행] DB 유저 '%DB_USER%' 를 생성하고 권한을 부여합니다...
    (
        echo CREATE DATABASE IF NOT EXISTS `%DB_NAME%` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
        echo CREATE USER IF NOT EXISTS '%DB_USER%'@'localhost' IDENTIFIED BY '%DB_PASS%';
        echo CREATE USER IF NOT EXISTS '%DB_USER%'@'%%' IDENTIFIED BY '%DB_PASS%';
        echo GRANT ALL PRIVILEGES ON `%DB_NAME%`.* TO '%DB_USER%'@'localhost';
        echo GRANT ALL PRIVILEGES ON `%DB_NAME%`.* TO '%DB_USER%'@'%%';
        echo FLUSH PRIVILEGES;
    ) | bin\mysql.exe -u root -P 3307 --protocol=TCP

    IF ERRORLEVEL 1 (
        echo [오류] 유저 생성에 실패했습니다.
    ) ELSE (
        echo [완료] 유저 '%DB_USER%' 생성 및 권한 부여 완료.
    )

    :: 6. 임시 서버 종료
    echo [진행] 임시 서버를 종료합니다...
    bin\mysqladmin.exe -u root -P 3307 --protocol=TCP shutdown
    timeout /t 3 /nobreak > nul

    echo ---------------------------------------------------
    echo [완료] 초기 설정 완료. 서버를 정식 시작합니다.
    echo ---------------------------------------------------
) ELSE (
    echo [알림] 기존 'data' 폴더를 발견했습니다. 초기화를 건너뜁니다.
    echo ---------------------------------------------------
)

:: 7. MariaDB 서버 정식 실행
echo [실행] MariaDB 서버를 시작합니다... (종료하려면 이 창을 닫거나 Ctrl+C를 누르세요)
bin\mariadbd.exe --defaults-file=my.ini --console

pause
