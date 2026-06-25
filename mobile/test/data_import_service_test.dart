import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:fury_note/src/backup/backup_service.dart';
import 'package:fury_note/src/backup/data_import_service.dart';
import 'package:fury_note/src/api/device_id_service.dart';
import 'package:fury_note/src/notes/rage_note.dart';
import 'package:fury_note/src/notes/rage_note_repository.dart';
import 'package:fury_note/src/profile/app_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  late RageNoteRepository repository;
  late Directory tempDirectory;

  setUpAll(sqfliteFfiInit);

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    AppProfileController.instance.resetForTesting();
    tempDirectory = await Directory.systemTemp.createTemp(
      'fury_note_import_test_',
    );
    repository = RageNoteRepository(
      databaseFactory: databaseFactoryFfi,
      databasePathProvider: () async => inMemoryDatabasePath,
    );
  });

  tearDown(() async {
    await repository.close();
    await tempDirectory.delete(recursive: true);
    AppProfileController.instance.resetForTesting();
  });

  test(
    'replaces existing data with profile, notes, reminders, and audio from backup',
    () async {
      await repository.insert(
        RageNote(
          createdAt: DateTime(2026, 6, 24, 9),
          rageLevel: 2,
          rageEmoji: '😤',
          rageLabel: '화남',
          categoryKey: 'family',
          categoryEmoji: '👨‍👩‍👧',
          categoryLabel: '가족',
          body: '삭제되어야 할 기존 기록',
        ),
      );
      final service = DataImportService(
        noteRepository: repository,
        backupService: FuryBackupService(cipher: PlainTextBackupCipher()),
        directoryProvider: () async => tempDirectory,
      );
      final backupFile = File('${tempDirectory.path}/fixture.fnbackup');
      final package = _backupPackage(
        BackupData(
          profile: {
            'display_name': '복원 닉네임',
            'profile_number': '#4827',
            'avatar_base64': base64Encode([7, 8, 9]),
          },
          settings: const {'scope': 'all_local_app_data'},
          notes: [
            {
              'created_at': '2026-06-25T09:00:00.000',
              'rage_level': 4,
              'rage_emoji': '😡',
              'rage_label': '매우 화남',
              'category_key': 'work',
              'category_emoji': '💼',
              'category_label': '직장',
              'body': '복원할 기록',
              'audio_file_name': 'rage.m4a',
              'audio_base64': base64Encode([1, 2, 3, 4]),
              'reminder_at': '2026-06-25T18:00:00.000',
              'posted': 1,
            },
          ],
          reminders: const [],
          challenges: const [],
        ),
      );
      await backupFile.writeAsBytes(package.encryptedBytes);

      final result = await service.importBackupFile(backupFile);
      final notes = await repository.getAll();
      final audioFile = File(notes.single.audioPath!);

      expect(result.importedNoteCount, 1);
      expect(notes, hasLength(1));
      expect(notes.single.body, '복원할 기록');
      expect(notes.single.reminderAt, DateTime(2026, 6, 25, 18));
      expect(notes.single.posted, isTrue);
      expect(audioFile.existsSync(), isTrue);
      expect(audioFile.readAsBytesSync(), Uint8List.fromList([1, 2, 3, 4]));
      expect(
        AppProfileController.instance.displayName(fallback: '화난 호랑이'),
        '복원 닉네임',
      );
      expect(AppProfileController.instance.profileCode, '#4827');
      expect(
        AppProfileController.instance.avatarBytes,
        Uint8List.fromList([7, 8, 9]),
      );
      expect(await DeviceIdService.instance.getOrCreate(), 'device-1');
    },
  );
}

BackupPackage _backupPackage(BackupData data) {
  final service = FuryBackupService(cipher: PlainTextBackupCipher());
  return service.exportBackup(
    data: data,
    deviceId: 'device-1',
    appVersion: '1.0.0',
    isPro: true,
    createdAt: DateTime(2026, 6, 25, 10),
  );
}
