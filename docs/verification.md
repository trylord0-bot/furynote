# Fury Note Verification

Last run: 2026-06-10

## Backend

Command:

```powershell
cd backend
python -m pytest
```

Result:

```text
15 passed
```

Covered:

- Local environment defaults to MariaDB port 3303.
- Non-local environment defaults to MariaDB port 3306.
- `.env` can override database port.
- URL, spam keyword, and 60-second post rate-limit policy checks.
- Device registration upsert and notification setting sync.
- Post create/list/delete, like toggle, comments, and PRO purchase status flow.
- Ownership and deleted-post error handling for post/comment actions.
- MariaDB schema asset includes required tables, UTF-8 charset, and soft-delete columns.

## Flutter

Commands:

```powershell
cd mobile
flutter pub get
flutter analyze
flutter test
```

Results:

```text
flutter pub get: success
flutter analyze: No issues found
flutter test: 8 tests passed
```

Covered:

- Flutter project resolves localization dependencies.
- Dart analyzer accepts app code and generated l10n files.
- Widget smoke test renders the Fury Note record flow.
- Widget tests cover bottom tab navigation and Korean locale rendering.
- Widget tests cover the full record flow summary and custom category entry.
- Backup service tests cover PRO export permission, `.fnbackup` package creation, and checksum rejection.

## Identity and Environment Checks

- Android namespace/application ID: `kr.co.lunlu.furynote`
- iOS bundle identifier: `kr.co.lunlu.furynote`
- Android label: `Fury Note`
- iOS display name: `Fury Note`
- Local MariaDB port: `3303`
- Non-local MariaDB default port: `3306`
