import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:fury_note/src/backup/backup_service.dart';
import 'package:fury_note/src/backup/data_export_service.dart';
import 'package:fury_note/src/notes/rage_note.dart';
import 'package:fury_note/src/notes/rage_note_repository.dart';
import 'package:fury_note/src/profile/app_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  test('creates a backup file and records it in history', () async {
    SharedPreferences.setMockInitialValues({});
    AppProfileController.instance.resetForTesting();
    final tempDirectory = await Directory.systemTemp.createTemp(
      'fury_note_export_test_',
    );
    addTearDown(() async {
      AppProfileController.instance.resetForTesting();
      await tempDirectory.delete(recursive: true);
    });

    final historyStore = BackupHistoryStore();
    final audioFile = File('${tempDirectory.path}/rage.m4a');
    await audioFile.writeAsBytes([1, 2, 3, 4]);
    final service = DataExportService(
      noteRepository: _FakeRageNoteRepository([
        RageNote(
          createdAt: DateTime(2026, 6, 25, 9),
          rageLevel: 4,
          rageEmoji: '😡',
          rageLabel: '매우 화남',
          categoryKey: 'work',
          categoryEmoji: '💼',
          categoryLabel: '직장',
          body: '내보낼 기록',
          audioPath: audioFile.path,
          reminderAt: DateTime(2026, 6, 25, 18),
        ),
      ]),
      backupService: FuryBackupService(cipher: PlainTextBackupCipher()),
      historyStore: historyStore,
      directoryProvider: () async => tempDirectory,
      deviceIdProvider: () async => 'device-1',
      appVersion: '1.0.0',
    );

    final entry = await service.createBackupExport(
      fallbackDisplayName: '화난 호랑이',
      isPro: false,
      isDebugMode: true,
      createdAt: DateTime(2026, 6, 25, 10, 30),
    );

    final file = File(entry.filePath);
    final decoded =
        jsonDecode(await file.readAsString()) as Map<String, dynamic>;
    final history = await historyStore.load();

    expect(file.existsSync(), isTrue);
    expect(entry.fileName, 'furynote_backup_20260625_103000.fnbackup');
    expect(decoded['data']['notes'], hasLength(1));
    expect(decoded['data']['notes'].single['body'], '내보낼 기록');
    expect(decoded['data']['notes'].single['audio_file_name'], 'rage.m4a');
    expect(
      decoded['data']['notes'].single['audio_base64'],
      base64Encode([1, 2, 3, 4]),
    );
    expect(decoded['data']['reminders'], hasLength(1));
    expect(history.single.filePath, entry.filePath);
  });
}

class _FakeRageNoteRepository extends RageNoteRepository {
  _FakeRageNoteRepository(this.notes);

  final List<RageNote> notes;

  @override
  Future<List<RageNote>> getAll() async => notes;
}
