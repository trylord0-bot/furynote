import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../api/device_id_service.dart';
import '../notes/rage_note_repository.dart';
import '../profile/app_profile.dart';
import 'backup_service.dart';

typedef ExportDirectoryProvider = Future<Directory> Function();
typedef ExportDeviceIdProvider = Future<String> Function();

class DataExportService {
  DataExportService({
    RageNoteRepository? noteRepository,
    FuryBackupService? backupService,
    BackupHistoryStore? historyStore,
    ExportDirectoryProvider? directoryProvider,
    ExportDeviceIdProvider? deviceIdProvider,
    this.appVersion = '1.0.0',
  }) : noteRepository = noteRepository ?? RageNoteRepository.instance,
       backupService =
           backupService ?? FuryBackupService(cipher: PlainTextBackupCipher()),
       historyStore = historyStore ?? BackupHistoryStore(),
       directoryProvider =
           directoryProvider ?? getApplicationDocumentsDirectory,
       deviceIdProvider =
           deviceIdProvider ?? DeviceIdService.instance.getOrCreate;

  final RageNoteRepository noteRepository;
  final FuryBackupService backupService;
  final BackupHistoryStore historyStore;
  final ExportDirectoryProvider directoryProvider;
  final ExportDeviceIdProvider deviceIdProvider;
  final String appVersion;

  Future<BackupHistoryEntry> createBackupExport({
    required String fallbackDisplayName,
    required bool isPro,
    required bool isDebugMode,
    DateTime? createdAt,
  }) async {
    final notes = await noteRepository.getAll();
    final noteMaps = [
      for (final note in notes) await _noteToExportMap(note.toMap()),
    ];
    final timestamp = createdAt ?? DateTime.now();
    final package = backupService.exportBackup(
      data: BackupData(
        profile: AppProfileController.instance.toExportJson(
          fallbackDisplayName: fallbackDisplayName,
        ),
        settings: {
          'export_schema': '1.0',
          'scope': 'all_local_app_data',
          'exported_at': timestamp.toIso8601String(),
        },
        notes: noteMaps,
        reminders: [
          for (final note in noteMaps)
            if (note['reminder_at'] != null) note,
        ],
        challenges: const [],
      ),
      deviceId: await deviceIdProvider(),
      appVersion: appVersion,
      isPro: isPro,
      isDebugMode: isDebugMode,
      createdAt: timestamp,
    );

    final root = await directoryProvider();
    final exportDirectory = Directory(p.join(root.path, 'exports'));
    if (!exportDirectory.existsSync()) {
      await exportDirectory.create(recursive: true);
    }
    final file = File(p.join(exportDirectory.path, package.fileName));
    await file.writeAsBytes(package.encryptedBytes, flush: true);

    final entry = BackupHistoryEntry(
      fileName: package.fileName,
      filePath: file.path,
      createdAt: timestamp,
      byteCount: package.encryptedBytes.length,
    );
    await historyStore.add(entry);
    return entry;
  }

  Future<Map<String, Object?>> _noteToExportMap(
    Map<String, Object?> note,
  ) async {
    final export = Map<String, Object?>.from(note);
    final audioPath = export['audio_path'] as String?;
    if (audioPath == null || audioPath.isEmpty) return export;

    final audioFile = File(audioPath);
    if (!audioFile.existsSync()) return export;

    export['audio_file_name'] = p.basename(audioPath);
    export['audio_base64'] = base64Encode(await audioFile.readAsBytes());
    return export;
  }
}
