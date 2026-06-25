import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../l10n/app_localizations_ko.dart';

String _generateNickname() {
  final l10n = AppLocalizationsKo();
  final adjectives = l10n.nicknameAdjectives.split(',');
  final animals = l10n.nicknameAnimals.split(',');
  final rng = math.Random();
  final adj = adjectives[rng.nextInt(adjectives.length)];
  final animal = animals[rng.nextInt(animals.length)];
  return '$adj $animal';
}

String _generateProfileCode() {
  final number = math.Random().nextInt(10000);
  return '#${number.toString().padLeft(4, '0')}';
}

String profileDisplayName({
  required String nickname,
  required String? profileCode,
  required String fallback,
}) {
  final resolvedNickname = _nicknameOnly(nickname).trim();
  final resolvedCode = _normalizedProfileCode(profileCode);
  final name = resolvedNickname.isEmpty ? fallback.trim() : resolvedNickname;
  if (resolvedCode == null || resolvedCode.isEmpty) {
    return name;
  }
  return '$name$resolvedCode';
}

String _nicknameOnly(String value) {
  return value.replaceFirst(RegExp(r'\s*#\d{4}$'), '').trim();
}

String? _profileCodeFrom(String value) {
  final match = RegExp(r'#\d{4}$').firstMatch(value.trim());
  return match?.group(0);
}

String? _normalizedProfileCode(String? value) {
  final trimmed = value?.trim();
  if (trimmed == null || trimmed.isEmpty) {
    return null;
  }
  final match = RegExp(r'^#?\d{4}$').firstMatch(trimmed);
  if (match == null) {
    return null;
  }
  return trimmed.startsWith('#') ? trimmed : '#$trimmed';
}

class AppProfileController extends ChangeNotifier {
  AppProfileController._();

  static final AppProfileController instance = AppProfileController._();
  static const int maxAvatarBytes = 5 * 1024 * 1024;
  static const String defaultProfileCode = '#4827';
  static const String _avatarKey = 'profile.avatar.base64';
  static const String _displayNameKey = 'profile.display_name';
  static const String _profileCodeKey = 'profile.profile_code';

  String? _avatarBase64;
  String? _displayName;
  String? _profileCode;
  bool _loaded = false;

  bool get loaded => _loaded;
  String? get savedDisplayName => _displayName;
  String get profileCode => _profileCode ?? defaultProfileCode;
  String? get avatarBase64 => _avatarBase64;

  String displayName({required String fallback}) {
    final saved = _displayName?.trim();
    return saved == null || saved.isEmpty ? fallback : saved;
  }

  String displayNameWithCode({required String fallback}) {
    return profileDisplayName(
      nickname: displayName(fallback: fallback),
      profileCode: profileCode,
      fallback: fallback,
    );
  }

  Uint8List? get avatarBytes {
    final source = _avatarBase64;
    if (source == null || source.isEmpty) {
      return null;
    }
    try {
      return base64Decode(source);
    } on FormatException {
      return null;
    }
  }

  Future<void> load() async {
    if (_loaded) {
      return;
    }
    final preferences = await SharedPreferences.getInstance();
    _avatarBase64 = preferences.getString(_avatarKey);
    final savedDisplayName = preferences.getString(_displayNameKey)?.trim();
    final savedProfileCode = preferences.getString(_profileCodeKey)?.trim();
    final migratedCode = _profileCodeFrom(savedDisplayName ?? '');

    _displayName = _nicknameOnly(savedDisplayName ?? '');
    if (_displayName == null || _displayName!.trim().isEmpty) {
      _displayName = _generateNickname();
    }
    _profileCode =
        _normalizedProfileCode(savedProfileCode) ??
        migratedCode ??
        _generateProfileCode();

    if (_displayName != savedDisplayName) {
      await preferences.setString(_displayNameKey, _displayName!);
    }
    await preferences.setString(_profileCodeKey, _profileCode!);
    _loaded = true;
    notifyListeners();
  }

  Future<void> updateDisplayName(String displayName) async {
    final trimmed = _nicknameOnly(displayName);
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(_displayNameKey, trimmed);
    _displayName = trimmed;
    _loaded = true;
    notifyListeners();
  }

  Future<void> updateAvatar(Uint8List bytes) async {
    if (bytes.length > maxAvatarBytes) {
      throw const ProfileAvatarTooLargeException();
    }
    final encoded = base64Encode(bytes);
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(_avatarKey, encoded);
    _avatarBase64 = encoded;
    _loaded = true;
    notifyListeners();
  }

  Future<void> clearAvatar() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove(_avatarKey);
    _avatarBase64 = null;
    _loaded = true;
    notifyListeners();
  }

  Map<String, Object?> toExportJson({required String fallbackDisplayName}) {
    final exportedDisplayName = displayName(fallback: fallbackDisplayName);
    final exportedProfileCode = profileCode;
    return {
      'display_name': exportedDisplayName,
      'profile_code': exportedProfileCode,
      'profile_number': exportedProfileCode,
      'avatar_base64': _avatarBase64,
    };
  }

  Future<void> importFromJson(Map<String, Object?> json) async {
    final preferences = await SharedPreferences.getInstance();
    final displayName = (json['display_name'] as String?)?.trim();
    final profileCode =
        (json['profile_code'] as String?)?.trim() ??
        (json['profile_number'] as String?)?.trim() ??
        _profileCodeFrom(displayName ?? '');
    final avatarBase64 = json['avatar_base64'] as String?;

    if (displayName != null && displayName.isNotEmpty) {
      final nickname = _nicknameOnly(displayName);
      await preferences.setString(_displayNameKey, nickname);
      _displayName = nickname;
    }

    final normalizedProfileCode = _normalizedProfileCode(profileCode);
    if (normalizedProfileCode != null) {
      await preferences.setString(_profileCodeKey, normalizedProfileCode);
      _profileCode = normalizedProfileCode;
    }

    if (avatarBase64 != null && avatarBase64.isNotEmpty) {
      await preferences.setString(_avatarKey, avatarBase64);
      _avatarBase64 = avatarBase64;
    } else if (json.containsKey('avatar_base64')) {
      await preferences.remove(_avatarKey);
      _avatarBase64 = null;
    }

    _loaded = true;
    notifyListeners();
  }

  @visibleForTesting
  void resetForTesting() {
    _avatarBase64 = null;
    _displayName = null;
    _profileCode = null;
    _loaded = false;
    notifyListeners();
  }
}

class ProfileAvatarTooLargeException implements Exception {
  const ProfileAvatarTooLargeException();
}
