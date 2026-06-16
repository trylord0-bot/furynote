import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;

class EnvConfig {
  static final EnvConfig instance = EnvConfig._();
  EnvConfig._();

  Map<String, String> _values = {};

  Future<void> load() async {
    final envFile = _resolveEnvFile();
    final json = await rootBundle.loadString(envFile);
    final map = jsonDecode(json) as Map<String, dynamic>;
    _values = map.map((k, v) => MapEntry(k.toString(), v.toString()));
  }

  String _resolveEnvFile() {
    if (kReleaseMode) return 'env/prod.json';
    if (Platform.isIOS) return 'env/local.ios.json';
    return 'env/local.json';
  }

  String get apiBaseUrl => _values['API_BASE_URL'] ?? '';
  String get hmacSecret => _values['HMAC_SECRET'] ?? '';
}
