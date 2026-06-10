import 'dart:convert';
import 'dart:typed_data';

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
    required this.profile,
    required this.settings,
    required this.notes,
    required this.reminders,
    required this.challenges,
  });

  final Map<String, Object?> profile;
  final Map<String, Object?> settings;
  final List<Map<String, Object?>> notes;
  final List<Map<String, Object?>> reminders;
  final List<Map<String, Object?>> challenges;

  Map<String, Object?> toJson() {
    return {
      'profile': profile,
      'settings': settings,
      'notes': notes,
      'reminders': reminders,
      'challenges': challenges,
    };
  }

  static BackupData fromJson(Map<String, Object?> json) {
    return BackupData(
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
    DateTime? createdAt,
  }) {
    if (!isPro) {
      throw const BackupPermissionException(
        'PRO purchase is required to export backups.',
      );
    }

    final timestamp = createdAt ?? DateTime.now();
    final dataJson = data.toJson();
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

    return BackupData.fromJson(data);
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
