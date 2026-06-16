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
  final number = rng.nextInt(10000);
  return '$adj $animal#${number.toString().padLeft(4, '0')}';
}

class AppProfileController extends ChangeNotifier {
  AppProfileController._();

  static final AppProfileController instance = AppProfileController._();
  static const int maxAvatarBytes = 5 * 1024 * 1024;
  static const String _avatarKey = 'profile.avatar.base64';
  static const String _displayNameKey = 'profile.display_name';

  String? _avatarBase64;
  String? _displayName;
  bool _loaded = false;

  bool get loaded => _loaded;
  String? get savedDisplayName => _displayName;
  String? get avatarBase64 => _avatarBase64;

  String displayName({required String fallback}) {
    final saved = _displayName?.trim();
    return saved == null || saved.isEmpty ? fallback : saved;
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
    _displayName = preferences.getString(_displayNameKey);
    if (_displayName == null || _displayName!.trim().isEmpty) {
      _displayName = _generateNickname();
      await preferences.setString(_displayNameKey, _displayName!);
    }
    _loaded = true;
    notifyListeners();
  }

  Future<void> updateDisplayName(String displayName) async {
    final trimmed = displayName.trim();
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
    return {
      'display_name': displayName(fallback: fallbackDisplayName),
      'avatar_base64': _avatarBase64,
    };
  }

  @visibleForTesting
  void resetForTesting() {
    _avatarBase64 = null;
    _displayName = null;
    _loaded = false;
    notifyListeners();
  }
}

class ProfileAvatarTooLargeException implements Exception {
  const ProfileAvatarTooLargeException();
}
