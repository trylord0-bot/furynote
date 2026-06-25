import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:fury_note/src/backup/backup_service.dart';
import 'package:fury_note/src/profile/app_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  test('export requires PRO entitlement', () {
    final service = FuryBackupService(cipher: PlainTextBackupCipher());
    final data = BackupData(
      profile: {'display_name': '화난 호랑이#4827'},
      settings: {'notify_remind': true},
      notes: const [],
      reminders: const [],
      challenges: const [],
    );

    expect(
      () => service.exportBackup(
        data: data,
        deviceId: 'device-1',
        appVersion: '1.0.0',
        isPro: false,
      ),
      throwsA(isA<BackupPermissionException>()),
    );
  });

  test('export creates fnbackup package with manifest and data', () {
    final service = FuryBackupService(cipher: PlainTextBackupCipher());
    final data = BackupData(
      profile: {'display_name': '화난 호랑이#4827'},
      settings: {'notify_remind': true, 'notify_comment': true},
      notes: [
        {'note_id': 'note-1', 'rage_level': 4, 'category': 'work'},
      ],
      reminders: const [],
      challenges: const [],
    );

    final package = service.exportBackup(
      data: data,
      deviceId: 'device-1',
      appVersion: '1.0.0',
      isPro: true,
    );
    final decoded =
        jsonDecode(utf8.decode(package.encryptedBytes)) as Map<String, dynamic>;

    expect(package.fileName.endsWith('.fnbackup'), isTrue);
    expect(decoded['manifest']['version'], '1.0');
    expect(decoded['manifest']['app_version'], '1.0.0');
    expect(decoded['manifest']['device_id'], 'device-1');
    expect(decoded['data']['device_id'], 'device-1');
    expect(decoded['data']['notes'], hasLength(1));

    final imported = service.importBackup(package.encryptedBytes);
    expect(imported.deviceId, 'device-1');
  });

  test('import rejects package with mismatched checksum', () {
    final service = FuryBackupService(cipher: PlainTextBackupCipher());
    final corrupted = utf8.encode(
      jsonEncode({
        'manifest': {
          'version': '1.0',
          'app_version': '1.0.0',
          'created_at': '2026-06-10T00:00:00.000',
          'device_id': 'device-1',
          'checksum': 'wrong',
        },
        'data': {
          'profile': {'display_name': '화난 호랑이#4827'},
          'settings': {},
          'notes': [],
          'reminders': [],
          'challenges': [],
        },
      }),
    );

    expect(
      () => service.importBackup(corrupted),
      throwsA(isA<BackupIntegrityException>()),
    );
  });

  test('profile export includes saved nickname and avatar', () async {
    SharedPreferences.setMockInitialValues({'profile.profile_code': '#4827'});
    AppProfileController.instance.resetForTesting();
    await AppProfileController.instance.load();
    await AppProfileController.instance.updateDisplayName('불꽃 고양이');
    await AppProfileController.instance.updateAvatar(
      Uint8List.fromList([1, 2, 3]),
    );

    final profile = AppProfileController.instance.toExportJson(
      fallbackDisplayName: '화난 호랑이',
    );
    final service = FuryBackupService(cipher: PlainTextBackupCipher());
    final package = service.exportBackup(
      data: BackupData(
        profile: profile,
        settings: const {},
        notes: const [],
        reminders: const [],
        challenges: const [],
      ),
      deviceId: 'device-1',
      appVersion: '1.0.0',
      isPro: true,
    );
    final decoded =
        jsonDecode(utf8.decode(package.encryptedBytes)) as Map<String, dynamic>;
    final exportedProfile = decoded['data']['profile'] as Map<String, dynamic>;

    expect(exportedProfile['display_name'], '불꽃 고양이');
    expect(exportedProfile['profile_code'], '#4827');
    expect(exportedProfile['profile_number'], '#4827');
    expect(exportedProfile['avatar_base64'], isNotEmpty);

    AppProfileController.instance.resetForTesting();
  });

  test('debug export bypasses PRO entitlement', () {
    final service = FuryBackupService(cipher: PlainTextBackupCipher());

    final package = service.exportBackup(
      data: const BackupData(
        profile: {},
        settings: {},
        notes: [],
        reminders: [],
        challenges: [],
      ),
      deviceId: 'debug-device',
      appVersion: '1.0.0',
      isPro: false,
      isDebugMode: true,
      createdAt: DateTime(2026, 6, 25, 10, 30),
    );

    expect(package.fileName, 'furynote_backup_20260625_103000.fnbackup');
  });

  test('backup history stores newest exports first', () async {
    SharedPreferences.setMockInitialValues({});
    final store = BackupHistoryStore();

    await store.add(
      BackupHistoryEntry(
        fileName: 'older.fnbackup',
        filePath: '/exports/older.fnbackup',
        createdAt: DateTime(2026, 6, 24, 9),
        byteCount: 12,
      ),
    );
    await store.add(
      BackupHistoryEntry(
        fileName: 'newer.fnbackup',
        filePath: '/exports/newer.fnbackup',
        createdAt: DateTime(2026, 6, 25, 9),
        byteCount: 34,
      ),
    );

    final history = await store.load();

    expect(history.map((entry) => entry.fileName), [
      'newer.fnbackup',
      'older.fnbackup',
    ]);
    expect(history.first.byteCount, 34);
  });
}
