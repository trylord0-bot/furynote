# Fury Note Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Create a Flutter and FastAPI Fury Note starter project from the provided AI instructions, API spec, DB schema, and HTML mockups.

**Architecture:** The repository is split into `backend/` for FastAPI and `mobile/` for Flutter. Backend exposes the public community/purchase API and loads MariaDB settings from environment variables. Flutter holds local-first note UX, l10n ARB files, mockup-based screens, and API client boundaries.

**Tech Stack:** Flutter, Dart l10n ARB, Python FastAPI, SQLAlchemy, MariaDB, pytest.

---

### Task 1: Planning Baseline

**Files:**
- Create: `.planning/config.json`
- Create: `.planning/PROJECT.md`
- Create: `.planning/REQUIREMENTS.md`
- Create: `.planning/ROADMAP.md`
- Create: `.planning/STATE.md`
- Create: `docs/superpowers/plans/2026-06-10-fury-note-implementation.md`

- [x] **Step 1: Extract requirements from `ai/` documents**

Read the Korean AI development instruction, API spec, DB schema, and HTML mockups. Convert the source material into requirements grouped by identity, recording, calming, community API, purchase/backup, and UI localization.

- [x] **Step 2: Write planning artifacts**

Create `.planning` files that capture the project identity, constraints, v1 requirements, roadmap, and current state.

- [ ] **Step 3: Commit planning artifacts**

Run:

```powershell
git add .planning docs/superpowers/plans
git commit -m "docs: initialize Fury Note planning"
```

Expected: commit succeeds with only planning artifacts included.

### Task 2: Backend API Scaffold

**Files:**
- Create: `backend/.gitignore`
- Create: `backend/.env.example`
- Create: `backend/pyproject.toml`
- Create: `backend/app/main.py`
- Create: `backend/app/core/config.py`
- Create: `backend/app/db/base.py`
- Create: `backend/app/models/*.py`
- Create: `backend/app/schemas/*.py`
- Create: `backend/app/api/v1/*.py`
- Create: `backend/tests/test_config.py`
- Create: `backend/tests/test_content_policy.py`

- [ ] **Step 1: Add backend project metadata and environment settings**

Create a Python package with FastAPI dependencies and settings that resolve `DB_PORT=3303` for local `.env`, while `.env.example` documents `3306` for non-local environments.

- [ ] **Step 2: Add SQLAlchemy models**

Create models for `device_tokens`, `posts`, `post_likes`, `comments`, and `pro_purchases` matching the provided MariaDB schema.

- [ ] **Step 3: Add route modules**

Create device, posts, comments, and purchase routes with response envelopes and policy checks.

- [ ] **Step 4: Add focused tests**

Run:

```powershell
cd backend
python -m pytest
```

Expected: config and content policy tests pass when dependencies are installed.

- [ ] **Step 5: Commit backend scaffold**

Run:

```powershell
git add backend
git commit -m "chore: scaffold FastAPI backend"
```

### Task 3: Flutter App Scaffold

**Files:**
- Create/Modify: `mobile/pubspec.yaml`
- Create/Modify: `mobile/l10n.yaml`
- Create/Modify: `mobile/lib/l10n/app_ko.arb`
- Create/Modify: `mobile/lib/l10n/app_en.arb`
- Create/Modify: `mobile/lib/main.dart`
- Create/Modify: `mobile/lib/src/**/*.dart`
- Modify: Android/iOS app identifiers where generated.

- [ ] **Step 1: Create Flutter project**

Run Flutter create under `mobile/` with organization `kr.co.lunlu` and project name `fury_note`.

- [ ] **Step 2: Wire localization**

Add `flutter_localizations`, `intl`, ARB files for Korean and English, and generated localization settings.

- [ ] **Step 3: Add mockup-based screens**

Implement bottom navigation, drawer, record flow, feed, stats, calming, and settings screens using localized text.

- [ ] **Step 4: Verify Flutter**

Run:

```powershell
cd mobile
flutter pub get
flutter analyze
flutter test
```

- [ ] **Step 5: Commit Flutter scaffold**

Run:

```powershell
git add mobile
git commit -m "chore: scaffold Flutter app with localization"
```

### Task 4: Environment and Verification

**Files:**
- Create/Modify: `.gitignore`
- Create: `.env.example`
- Create: `docs/verification.md`

- [ ] **Step 1: Add ignore and environment docs**

Protect Python caches, virtualenvs, Flutter generated outputs, local `.env`, and IDE files. Document DB behavior and app identifiers.

- [ ] **Step 2: Run available verification**

Run backend tests and Flutter analyzer/tests when tools/dependencies are available. Record any unavailable command and the reason.

- [ ] **Step 3: Commit final project hygiene**

Run:

```powershell
git add .gitignore .env.example docs/verification.md
git commit -m "chore: add project environment and verification docs"
```

### Self-Review

- Spec coverage: The plan covers planning docs, backend API, Flutter localization/UI, environment, ignore rules, and verification.
- Placeholder scan: No TBD/TODO placeholders are used.
- Type consistency: Paths and phase names match `.planning/ROADMAP.md`.
