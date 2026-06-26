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

  String get apiBaseUrl => applyApiPort(_values['API_BASE_URL'] ?? '', apiPort);
  String get apiPort => _values['API_PORT'] ?? '';
  String get hmacSecret => _values['HMAC_SECRET'] ?? '';

  @visibleForTesting
  static String applyApiPort(String baseUrl, String apiPort) {
    if (baseUrl.isEmpty || apiPort.isEmpty) return baseUrl;

    final uri = Uri.tryParse(baseUrl);
    final port = int.tryParse(apiPort);
    if (uri == null || !uri.hasAuthority || port == null) return baseUrl;

    return uri.replace(port: port).toString();
  }
}
