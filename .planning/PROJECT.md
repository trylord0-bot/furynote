# Fury Note

## What This Is

Fury Note, also named 분노의노트, is an anonymous emotion journaling app for people who want to write down anger, revisit it later, calm down, and optionally share it with others. The mobile app is built with Flutter for iOS and Android, while community, purchase, push, and moderation APIs are served by a Python FastAPI backend backed by MariaDB.

## Core Value

Users can quickly record anger in the moment, then return later to see whether it has cooled down.

## Requirements

### Validated

(None yet — ship to validate)

### Active

- [ ] A user can use the app immediately without signup using a generated anonymous nickname and device identifier.
- [ ] A user can create a rage note through a six-step full-screen flow: intensity, category, text or voice, reminder, save, optional post.
- [ ] A user can set one local reminder per note and later record a calm-down result using five rage states plus calm.
- [ ] A user can access calming tools with guided breathing, timeout, image meditation, and feed-based support.
- [ ] A user can browse anonymous feed posts, like them, comment on them, and delete their own posts or comments.
- [ ] The backend can register devices, sync notification settings, moderate posts, rate-limit abuse, manage likes/comments, and verify PRO purchases.
- [ ] A user can view statistics, challenge progress, and static guide content.
- [ ] A PRO user can export encrypted backup data, and any user can import a valid backup.
- [ ] The app supports Korean and English localization through Flutter l10n ARB files.

### Out of Scope

- Account signup, password login, or social login — the product is intentionally device-based and anonymous.
- Server-side storage of private notes — private rage notes remain local unless posted publicly.
- Server CMS for guide content — guide cards and daily tips are static app data for v1.

## Context

The `ai/` folder contains the source planning material: AI development instructions, API specification, MariaDB schema, and HTML UI mockups for onboarding/recording, bottom navigation, feed, statistics, calming tools, and settings. Local development uses MariaDB in Docker on port 3303, while non-local environments should default to port 3306 via `.env`.

## Constraints

- **Mobile stack**: Flutter must be used for iOS and Android — the mockups describe a native-feeling hybrid app.
- **Backend stack**: Python FastAPI, SQLAlchemy, and MariaDB are required — they are specified in the AI instruction document.
- **Domain identity**: Android/iOS app identifier must use `kr.co.lunlu.furynote`; visible names are `Fury Note` and `분노의노트`.
- **Localization**: User-facing app strings should be routed through Flutter l10n with Korean and English ARB files.
- **Database environment**: local DB port is 3303; other environments use 3306 by default through environment settings.
- **Moderation boundary**: content filtering applies only to public posting, not private note saving.

## Key Decisions

| Decision | Rationale | Outcome |
|----------|-----------|---------|
| Use a vertical MVP roadmap | The user requested both project creation and code, and the product spans mobile and backend. Vertical slices keep each phase testable. | — Pending |
| Keep private notes local-first | The API specification only covers community/server features, while private notes include backup/export behavior. | — Pending |
| Use device ID as API identity | The planning document explicitly excludes signup and requires abuse tracking by device. | — Pending |

## Evolution

This document evolves at phase transitions and milestone boundaries.

**After each phase transition**:
1. Requirements invalidated? Move to Out of Scope with reason.
2. Requirements validated? Move to Validated with phase reference.
3. New requirements emerged? Add to Active.
4. Decisions to log? Add to Key Decisions.
5. "What This Is" still accurate? Update if drifted.

**After each milestone**:
1. Full review of all sections.
2. Core Value check.
3. Audit Out of Scope.
4. Update Context with current implementation state.

---
*Last updated: 2026-06-10 after initialization*
