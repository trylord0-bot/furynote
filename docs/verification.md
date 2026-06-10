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
11 passed
```

Covered:

- Local environment defaults to MariaDB port 3303.
- Non-local environment defaults to MariaDB port 3306.
- `.env` can override database port.
- URL, spam keyword, and 60-second post rate-limit policy checks.
- Device registration upsert and notification setting sync.
- Post create/list/delete, like toggle, comments, and PRO purchase status flow.

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
flutter test: 3 tests passed
```

Covered:

- Flutter project resolves localization dependencies.
- Dart analyzer accepts app code and generated l10n files.
- Widget smoke test renders the Fury Note record flow.
- Widget tests cover bottom tab navigation and Korean locale rendering.

## Identity and Environment Checks

- Android namespace/application ID: `kr.co.lunlu.furynote`
- iOS bundle identifier: `kr.co.lunlu.furynote`
- Android label: `Fury Note`
- iOS display name: `Fury Note`
- Local MariaDB port: `3303`
- Non-local MariaDB default port: `3306`
