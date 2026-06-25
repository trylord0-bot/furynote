# 📘 Windows 환경을 위한 MariaDB Portable (독립 실행) 구축 매뉴얼

본 매뉴얼은 Docker, WSL2, Hyper-V 등의 가상화 기술 없이 순수 Windows 환경(Windows Server 2012 포함)에서 **기존 데이터베이스와 충돌 없이 완벽히 격리된 MariaDB 인스턴스**를 구축하고 실행하는 방법을 안내합니다.

---

## 1. 사전 준비 (다운로드)

1. [MariaDB 공식 다운로드 페이지](https://mariadb.org/download/)에 접속합니다.
2. OS를 **Windows**로 선택하고, 패키지 타입을 **ZIP 파일**로 선택하여 다운로드합니다. (MSI 설치 파일 아님)
   - *예: `mariadb-10.11.x-winx64.zip`*

---

## 2. 디렉터리 구성

1. 다운로드한 ZIP 파일의 압축을 원하는 위치에 풉니다.
   - *예시 경로: `C:\mariadb_portable`*
2. 압축을 푼 폴더 안에 실제 데이터가 저장될 빈 폴더를 생성합니다.
   - *예시 경로: `C:\mariadb_portable\data`*

---

## 3. 전용 환경 설정 파일 (`my.ini`) 작성

기존에 설치된 MariaDB/MySQL과 포트 및 소켓이 충돌하지 않도록 전용 설정 파일을 만듭니다.
`C:\mariadb_portable` 폴더 안에 `my.ini` 파일을 생성하고 아래 내용을 입력합니다.

```ini
[mysqld]
# 1. 디렉터리 설정 (본인의 경로에 맞게 수정, 슬래시(/) 사용 권장)
basedir=C:/mariadb_portable
datadir=C:/mariadb_portable/data

# 2. 포트 설정 (기존 3306과 겹치지 않도록 설정)
port=3307

# 3. 충돌 방지를 위한 소켓 및 메모리 이름 변경
socket=mariadb_portable.sock
shared-memory-base-name=mariadb_portable

# 4. (선택) 외부 접속 허용 시
bind-address=0.0.0.0
```

---

## 4. 데이터베이스 초기화 (최초 1회만 실행)

데이터베이스 시스템 테이블을 생성하기 위해 초기화 작업을 진행합니다.
**명령 프롬프트(CMD)**를 관리자 권한으로 열고 아래 명령어를 실행합니다.

```cmd
cd C:\mariadb_portable\bin
mysql_install_db.exe --datadir=C:\mariadb_portable\data
```
> **성공 확인:** `data` 폴더 안에 `mysql`, `performance_schema` 등의 폴더와 파일들이 생성되었는지 확인합니다.

---

## 5. MariaDB 서버 실행

초기화가 완료되면, 작성한 `my.ini` 파일을 참조하여 서버를 실행합니다.

```cmd
cd C:\mariadb_portable\bin
mariadbd.exe --defaults-file=C:\mariadb_portable\my.ini --console
```
> **참고:** `--console` 옵션을 주면 로그가 화면에 바로 출력됩니다. 이 CMD 창을 닫으면 DB 서버도 종료됩니다.

---

## 6. 접속 테스트

서버가 실행 중인 상태에서 **새로운 명령 프롬프트(CMD)** 창을 열고 접속을 테스트합니다.

```cmd
cd C:\mariadb_portable\bin
mysql.exe -u root -P 3307 -p
```
- 초기 `root` 비밀번호는 비어있으므로, `Enter password:` 프롬프트가 나오면 그냥 **Enter** 키를 누릅니다.

---

## 💡 편의를 위한 배치 파일(.bat) 만들기

매번 명령어를 치기 번거로우므로, 클릭 한 번으로 실행할 수 있는 배치 파일을 `C:\mariadb_portable` 폴더에 만들어 두면 편리합니다.

**`start_db.bat` (서버 실행용)**
```bat
@echo off
echo Starting Portable MariaDB on port 3307...
cd /d "%~dp0bin"
mariadbd.exe --defaults-file="..\my.ini" --console
pause
```

**`connect_db.bat` (클라이언트 접속용)**
```bat
@echo off
cd /d "%~dp0bin"
mysql.exe -u root -P 3307 -p
```