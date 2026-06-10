import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:fury_note/src/backup/backup_service.dart';

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
    expect(decoded['data']['notes'], hasLength(1));
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
}
