# Fury Note Roadmap

### Phase 1: Project Planning Baseline
**Goal:** Capture project context, requirements, and a buildable implementation plan.
**Mode:** mvp
**Requirements:** planning foundation
**Success Criteria**:
1. `.planning/` includes project, requirements, roadmap, state, and config.
2. Implementation plan exists under `docs/superpowers/plans/`.
3. Phase is committed independently.

### Phase 2: Backend API Scaffold
**Goal:** Build a FastAPI backend that matches the supplied API and MariaDB schema.
**Mode:** mvp
**Requirements:** API-01, API-02, API-03, API-04, API-05, API-06, PRO-01, PRO-02
**Success Criteria**:
1. Backend loads local `.env` with MariaDB port 3303 and defaults other environments to 3306.
2. SQLAlchemy models mirror the provided MariaDB schema.
3. Device, post, comment, like, and purchase routes exist with consistent response envelopes.
4. Backend tests cover configuration and content policy behavior.

### Phase 3: Flutter App Scaffold and Localization
**Goal:** Create the Flutter app with app identity, l10n, navigation, and mockup-based screens.
**Mode:** mvp
**Requirements:** ID-01, ID-02, REC-01, REC-02, REC-03, REC-04, REC-05, REC-06, UI-01, UI-02
**Success Criteria**:
1. Flutter project lives under `mobile/` with package/domain identity `kr.co.lunlu.furynote`.
2. Korean and English ARB files exist and are wired through Flutter localization.
3. Main tabs and drawer match the provided Fury Note screen structure.
4. Record flow includes six steps and localized labels.

### Phase 4: Calming, Stats, and Static Content
**Goal:** Fill out local calming, statistics, challenge, and guide experiences.
**Mode:** mvp
**Requirements:** CALM-01, CALM-02, CALM-03, CALM-04
**Success Criteria**:
1. Calming tab displays reminders and calming tools.
2. Stats tab displays period filters, summary metrics, charts placeholders, and challenges.
3. Static guide content is represented in app data.

### Phase 5: Backup, Environment, and Verification Hardening
**Goal:** Add environment examples, ignore rules, backup service interfaces, and verification notes.
**Mode:** mvp
**Requirements:** BACKUP-01, BACKUP-02
**Success Criteria**:
1. Root, backend, and mobile ignore rules protect generated and secret files.
2. `.env.example` documents local and non-local database behavior.
3. Verification commands are run or clearly documented if unavailable.
