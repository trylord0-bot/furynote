# Fury Note State

## Project Reference

See: `.planning/PROJECT.md` (updated 2026-06-10)

**Core value:** Users can quickly record anger in the moment, then return later to see whether it has cooled down.
**Current focus:** Final verification

## Phase Status

| Phase | Status |
|-------|--------|
| 1. Project Planning Baseline | Complete |
| 2. Backend API Scaffold | Complete |
| 3. Flutter App Scaffold and Localization | Complete |
| 4. Calming, Stats, and Static Content | Included in Phase 3 MVP screens |
| 5. Backup, Environment, and Verification Hardening | Complete |

## Notes

- Source planning assets live in `ai/`.
- Local MariaDB is expected on `localhost:3303`; non-local defaults to `3306`.
- App identifier: `kr.co.lunlu.furynote`.
- Verification evidence is recorded in `docs/verification.md`.
- Backup service boundary is implemented in `mobile/lib/src/backup/backup_service.dart`.
- MariaDB init schema is available at `backend/db/schema.sql`.
