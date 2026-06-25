import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_preferences/shared_preferences.dart';

class BackupPermissionException implements Exception {
  const BackupPermissionException(this.message);

  final String message;

  @override
  String toString() => 'BackupPermissionException: $message';
}

class BackupIntegrityException implements Exception {
  const BackupIntegrityException(this.message);

  final String message;

  @override
  String toString() => 'BackupIntegrityException: $message';
}

abstract interface class BackupCipher {
  Uint8List encrypt(Uint8List plainBytes);

  Uint8List decrypt(Uint8List encryptedBytes);
}

class PlainTextBackupCipher implements BackupCipher {
  @override
  Uint8List decrypt(Uint8List encryptedBytes) => encryptedBytes;

  @override
  Uint8List encrypt(Uint8List plainBytes) => plainBytes;
}

class BackupData {
  const BackupData({
    this.deviceId,
    required this.profile,
    required this.settings,
    required this.notes,
    required this.reminders,
    required this.challenges,
  });

  final String? deviceId;
  final Map<String, Object?> profile;
  final Map<String, Object?> settings;
  final List<Map<String, Object?>> notes;
  final List<Map<String, Object?>> reminders;
  final List<Map<String, Object?>> challenges;

  Map<String, Object?> toJson() {
    return {
      if (deviceId != null && deviceId!.isNotEmpty) 'device_id': deviceId,
      'profile': profile,
      'settings': settings,
      'notes': notes,
      'reminders': reminders,
      'challenges': challenges,
    };
  }

  static BackupData fromJson(Map<String, Object?> json) {
    return BackupData(
      deviceId: (json['device_id'] as String?)?.trim(),
      profile: Map<String, Object?>.from(json['profile'] as Map),
      settings: Map<String, Object?>.from(json['settings'] as Map),
      notes: _mapList(json['notes']),
      reminders: _mapList(json['reminders']),
      challenges: _mapList(json['challenges']),
    );
  }

  static List<Map<String, Object?>> _mapList(Object? value) {
    final list = value as List? ?? const [];
    return [for (final item in list) Map<String, Object?>.from(item as Map)];
  }
}

class BackupPackage {
  const BackupPackage({required this.fileName, required this.encryptedBytes});

  final String fileName;
  final Uint8List encryptedBytes;
}

class FuryBackupService {
  const FuryBackupService({required this.cipher});

  final BackupCipher cipher;

  BackupPackage exportBackup({
    required BackupData data,
    required String deviceId,
    required String appVersion,
    required bool isPro,
    bool isDebugMode = false,
    DateTime? createdAt,
  }) {
    if (!isPro && !isDebugMode) {
      throw const BackupPermissionException(
        'PRO purchase is required to export backups.',
      );
    }

    final timestamp = createdAt ?? DateTime.now();
    final dataJson = data.toJson();
    dataJson['device_id'] = deviceId;
    final dataText = jsonEncode(dataJson);
    final package = {
      'manifest': {
        'version': '1.0',
        'app_version': appVersion,
        'created_at': timestamp.toIso8601String(),
        'device_id': deviceId,
        'checksum': checksum(dataText),
      },
      'data': dataJson,
    };
    final encryptedBytes = cipher.encrypt(
      Uint8List.fromList(utf8.encode(jsonEncode(package))),
    );

    return BackupPackage(
      fileName: 'furynote_backup_${_fileTimestamp(timestamp)}.fnbackup',
      encryptedBytes: encryptedBytes,
    );
  }

  BackupData importBackup(Uint8List encryptedBytes) {
    final plainBytes = cipher.decrypt(encryptedBytes);
    final package = jsonDecode(utf8.decode(plainBytes)) as Map<String, dynamic>;
    final manifest = package['manifest'] as Map<String, dynamic>;
    final data = package['data'] as Map<String, dynamic>;
    final actualChecksum = checksum(jsonEncode(data));

    if (manifest['checksum'] != actualChecksum) {
      throw const BackupIntegrityException(
        'Backup checksum does not match package data.',
      );
    }

    final restoredData = Map<String, Object?>.from(data);
    restoredData['device_id'] ??= manifest['device_id'];
    return BackupData.fromJson(restoredData);
  }

  String checksum(String text) {
    var hash = 0x811c9dc5;
    for (final unit in utf8.encode(text)) {
      hash ^= unit;
      hash = (hash * 0x01000193) & 0xffffffff;
    }
    return hash.toRadixString(16).padLeft(8, '0');
  }

  String _fileTimestamp(DateTime dateTime) {
    String two(int value) => value.toString().padLeft(2, '0');
    return '${dateTime.year}${two(dateTime.month)}${two(dateTime.day)}_'
        '${two(dateTime.hour)}${two(dateTime.minute)}${two(dateTime.second)}';
  }
}

class BackupHistoryEntry {
  const BackupHistoryEntry({
    required this.fileName,
    required this.filePath,
    required this.createdAt,
    required this.byteCount,
  });

  final String fileName;
  final String filePath;
  final DateTime createdAt;
  final int byteCount;

  Map<String, Object?> toJson() {
    return {
      'file_name': fileName,
      'file_path': filePath,
      'created_at': createdAt.toIso8601String(),
      'byte_count': byteCount,
    };
  }

  static BackupHistoryEntry fromJson(Map<String, Object?> json) {
    return BackupHistoryEntry(
      fileName: json['file_name'] as String,
      filePath: json['file_path'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      byteCount: json['byte_count'] as int,
    );
  }
}

class BackupHistoryStore {
  static const _key = 'backup.history.entries';
  static const _maxEntries = 20;

  Future<List<BackupHistoryEntry>> load() async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = prefs.getString(_key);
    if (encoded == null || encoded.isEmpty) return const [];

    final decoded = jsonDecode(encoded) as List<dynamic>;
    final entries = [
      for (final item in decoded)
        BackupHistoryEntry.fromJson(Map<String, Object?>.from(item as Map)),
    ];
    entries.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return entries;
  }

  Future<void> add(BackupHistoryEntry entry) async {
    final entries = [entry, ...await load()];
    final deduped = <String, BackupHistoryEntry>{};
    for (final current in entries) {
      deduped[current.filePath] = current;
    }
    final sorted = deduped.values.toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _key,
      jsonEncode(
        sorted.take(_maxEntries).map((entry) => entry.toJson()).toList(),
      ),
    );
  }
}
