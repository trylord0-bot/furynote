import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'device_id_service.dart';

// env/local.json · env/prod.json → --dart-define-from-file 로 빌드 시 주입됩니다.
// 환경 파일 없이 실행할 경우 플랫폼별 개발 기본값을 사용합니다.
const String _kApiBaseUrl = String.fromEnvironment('API_BASE_URL');

String get apiBaseUrl {
  if (_kApiBaseUrl.isNotEmpty) return _kApiBaseUrl;
  if (kIsWeb) return 'http://localhost:8000';
  if (Platform.isAndroid) return 'http://10.0.2.2:8000';
  return 'http://127.0.0.1:8000';
}

class ApiException implements Exception {
  const ApiException(this.code, this.message, this.statusCode);

  final String code;
  final String message;
  final int statusCode;

  @override
  String toString() => 'ApiException($statusCode/$code): $message';
}

class ApiClient {
  static final ApiClient instance = ApiClient._();
  ApiClient._();

  Future<Map<String, String>> _authHeaders() async {
    final deviceId = await DeviceIdService.instance.getOrCreate();
    return {
      'Content-Type': 'application/json; charset=utf-8',
      'X-Device-ID': deviceId,
    };
  }

  Map<String, String> get _jsonHeaders => {
        'Content-Type': 'application/json; charset=utf-8',
      };

  Future<dynamic> get(String path, {Map<String, String>? query}) async {
    final headers = await _authHeaders();
    var uri = Uri.parse('$apiBaseUrl$path');
    if (query != null) uri = uri.replace(queryParameters: query);
    final response = await http.get(uri, headers: headers);
    return _parse(response);
  }

  Future<dynamic> post(String path, [Map<String, dynamic>? body]) async {
    final headers = await _authHeaders();
    final response = await http.post(
      Uri.parse('$apiBaseUrl$path'),
      headers: headers,
      body: body != null ? utf8.encode(jsonEncode(body)) : null,
    );
    return _parse(response);
  }

  Future<dynamic> postAnonymous(String path, Map<String, dynamic> body) async {
    final response = await http.post(
      Uri.parse('$apiBaseUrl$path'),
      headers: _jsonHeaders,
      body: utf8.encode(jsonEncode(body)),
    );
    return _parse(response);
  }

  Future<dynamic> patch(String path, Map<String, dynamic> body) async {
    final headers = await _authHeaders();
    final response = await http.patch(
      Uri.parse('$apiBaseUrl$path'),
      headers: headers,
      body: utf8.encode(jsonEncode(body)),
    );
    return _parse(response);
  }

  dynamic _parse(http.Response response) {
    final json = jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json['data'];
    }
    final err = json['error'] as Map<String, dynamic>?;
    throw ApiException(
      err?['code'] as String? ?? 'UNKNOWN',
      err?['message'] as String? ?? '알 수 없는 오류가 발생했어요.',
      response.statusCode,
    );
  }
}
