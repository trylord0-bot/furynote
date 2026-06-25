import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../api/device_id_service.dart';
import '../notes/rage_note.dart';
import '../notes/rage_note_repository.dart';
import '../profile/app_profile.dart';
import 'backup_service.dart';

typedef ImportDirectoryProvider = Future<Directory> Function();

class DataImportResult {
  const DataImportResult({required this.importedNoteCount});

  final int importedNoteCount;
}

class DataImportService {
  DataImportService({
    RageNoteRepository? noteRepository,
    FuryBackupService? backupService,
    ImportDirectoryProvider? directoryProvider,
  }) : noteRepository = noteRepository ?? RageNoteRepository.instance,
       backupService =
           backupService ?? FuryBackupService(cipher: PlainTextBackupCipher()),
       directoryProvider =
           directoryProvider ?? getApplicationDocumentsDirectory;

  final RageNoteRepository noteRepository;
  final FuryBackupService backupService;
  final ImportDirectoryProvider directoryProvider;

  Future<DataImportResult> importBackupFile(File file) async {
    final data = backupService.importBackup(await file.readAsBytes());
    final deviceId = data.deviceId;
    if (deviceId != null && deviceId.isNotEmpty) {
      await DeviceIdService.instance.restore(deviceId);
    }
    await AppProfileController.instance.importFromJson(data.profile);
    await _clearExistingAudioFiles();

    final restoredNotes = <RageNote>[];
    for (final rawNote in data.notes) {
      restoredNotes.add(await _restoreNote(rawNote));
    }

    final importedNoteCount = await noteRepository.replaceAll(restoredNotes);
    return DataImportResult(importedNoteCount: importedNoteCount);
  }

  Future<RageNote> _restoreNote(Map<String, Object?> rawNote) async {
    final noteJson = Map<String, Object?>.from(rawNote);
    final audioBase64 = noteJson.remove('audio_base64') as String?;
    final audioFileName = noteJson.remove('audio_file_name') as String?;

    if (audioBase64 != null && audioBase64.isNotEmpty) {
      noteJson['audio_path'] = await _restoreAudioFile(
        base64Text: audioBase64,
        fileName: audioFileName,
      );
    }

    return RageNote.fromMap(noteJson);
  }

  Future<String> _restoreAudioFile({
    required String base64Text,
    required String? fileName,
  }) async {
    final root = await directoryProvider();
    final recordingDirectory = Directory(p.join(root.path, 'voice_recordings'));
    await recordingDirectory.create(recursive: true);
    final safeName = _safeFileName(fileName);
    final target = File(
      p.join(
        recordingDirectory.path,
        'imported_${DateTime.now().microsecondsSinceEpoch}_$safeName',
      ),
    );
    await target.writeAsBytes(base64Decode(base64Text), flush: true);
    return target.path;
  }

  String _safeFileName(String? fileName) {
    final fallback = 'rage.m4a';
    final basename = p.basename(fileName ?? fallback);
    return basename.trim().isEmpty ? fallback : basename;
  }

  Future<void> _clearExistingAudioFiles() async {
    final root = await directoryProvider();
    final recordingDirectory = Directory(p.join(root.path, 'voice_recordings'));
    if (recordingDirectory.existsSync()) {
      await recordingDirectory.delete(recursive: true);
    }
  }
}
