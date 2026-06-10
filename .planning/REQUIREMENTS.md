# Fury Note Requirements

## v1 Requirements

### Identity

- [ ] **ID-01**: User can launch the app without signup and receive a stable anonymous profile based on device identity.
- [ ] **ID-02**: User can edit the nickname words while keeping the generated four-digit number unchanged.

### Rage Recording

- [ ] **REC-01**: User can select one of five rage levels with emoji, label, and level color.
- [ ] **REC-02**: User can select one required cause category: family, romance, work, people, driving, or custom.
- [ ] **REC-03**: User can enter optional text or use device speech-to-text when supported.
- [ ] **REC-04**: User can optionally configure one reminder time for the note.
- [ ] **REC-05**: User can review a save summary and save the note locally.
- [ ] **REC-06**: User can optionally create an anonymous feed post from the saved note.

### Reminders and Calming

- [ ] **CALM-01**: User can see reminder notes at the top of the calming tab.
- [ ] **CALM-02**: User can record a later state using five rage levels plus calm.
- [ ] **CALM-03**: User can mark a reminder as calm and remove it from the reminder list.
- [ ] **CALM-04**: User can open calming tools with concrete guide steps.

### Community API

- [ ] **API-01**: Client can register a device and update FCM/comment notification settings.
- [ ] **API-02**: Client can create public posts only after URL, spam, moderation, and rate-limit checks pass.
- [ ] **API-03**: Client can list posts using cursor pagination sorted newest first.
- [ ] **API-04**: Client can toggle likes and receive updated like state and count.
- [ ] **API-05**: Client can create, list, and soft-delete comments.
- [ ] **API-06**: Client can soft-delete own posts and cascade soft-delete child comments.

### Purchase and Backup

- [ ] **PRO-01**: Client can verify a non-consumable PRO purchase receipt through the backend.
- [ ] **PRO-02**: Client can query PRO status by device.
- [ ] **BACKUP-01**: PRO users can export a `.fnbackup` archive from local data.
- [ ] **BACKUP-02**: Free and PRO users can import a compatible `.fnbackup` archive.

### Localization and UI

- [ ] **UI-01**: Flutter app exposes Korean and English localized strings through ARB files.
- [ ] **UI-02**: Flutter UI reflects the provided HTML mockups for record, feed, stats, calming, navigation, drawer, and settings.

## v2 Requirements

- [ ] **V2-01**: Production FCM credential management and real push delivery verification.
- [ ] **V2-02**: Full app-store and play-store purchase verification integrations with platform credentials.
- [ ] **V2-03**: Production-grade encrypted backup implementation with cross-device restore testing.

## Out of Scope

- Login accounts and server-side private note sync.
- Server-managed guide CMS.
- Alternate feed sorting beyond newest first.

## Traceability

| Requirement | Phase |
|-------------|-------|
| ID-01, ID-02, REC-01..REC-06, UI-01, UI-02 | Phase 3 |
| API-01..API-06, PRO-01, PRO-02 | Phase 2 |
| CALM-01..CALM-04 | Phase 4 |
| BACKUP-01, BACKUP-02 | Phase 5 |
