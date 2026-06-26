import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

import 'device_id_service.dart';
import 'env_config.dart';

String get apiBaseUrl {
  final envUrl = EnvConfig.instance.apiBaseUrl;
  if (envUrl.isNotEmpty) return envUrl;
  final apiPort = EnvConfig.instance.apiPort;
  final port = apiPort.isNotEmpty ? apiPort : '8000';
  if (kIsWeb) return 'http://localhost:$port';
  if (Platform.isAndroid) return 'http://10.0.2.2:$port';
  return 'http://127.0.0.1:$port';
}

class ApiException implements Exception {
  const ApiException(this.code, this.message, this.statusCode);

  final String code;
  final String message;
  final int statusCode;

  @override
  String toString() => 'ApiException($statusCode/$code): $message';
}

ApiException parseApiException(Map<String, dynamic> json, int statusCode) {
  final error = _extractError(json);
  return ApiException(
    error?['code'] as String? ?? 'UNKNOWN',
    error?['message'] as String? ?? '알 수 없는 오류가 발생했어요.',
    statusCode,
  );
}

Map<String, dynamic>? _extractError(Map<String, dynamic> json) {
  final topLevelError = json['error'];
  if (topLevelError is Map<String, dynamic>) {
    return topLevelError;
  }

  final detail = json['detail'];
  if (detail is Map<String, dynamic>) {
    final detailError = detail['error'];
    if (detailError is Map<String, dynamic>) {
      return detailError;
    }
  }

  return null;
}

class ApiClient {
  static final ApiClient instance = ApiClient._();
  ApiClient._();

  static const _uuid = Uuid();

  /// 백엔드와 동일한 방식(HMAC-SHA256 over method/path/timestamp/nonce/body)으로
  /// 요청 서명을 만든다. 비밀키가 없는 임의의 클라이언트(Postman 등)가 API를
  /// 직접 호출하는 것을 막기 위한 용도.
  Map<String, String> _signatureHeaders(
    String method,
    String path,
    String body,
  ) {
    final secret = EnvConfig.instance.hmacSecret;
    final timestamp = (DateTime.now().millisecondsSinceEpoch ~/ 1000)
        .toString();
    final nonce = _uuid.v4();
    final message = '${method.toUpperCase()}\n$path\n$timestamp\n$nonce\n$body';
    final signature = Hmac(
      sha256,
      utf8.encode(secret),
    ).convert(utf8.encode(message)).toString();
    return {
      'X-Timestamp': timestamp,
      'X-Nonce': nonce,
      'X-Signature': signature,
    };
  }

  Future<Map<String, String>> _authHeaders(
    String method,
    String path,
    String body,
  ) async {
    final deviceId = await DeviceIdService.instance.getOrCreate();
    return {
      'Content-Type': 'application/json; charset=utf-8',
      'X-Device-ID': deviceId,
      ..._signatureHeaders(method, path, body),
    };
  }

  Future<dynamic> get(String path, {Map<String, String>? query}) async {
    final headers = await _authHeaders('GET', path, '');
    var uri = Uri.parse('$apiBaseUrl$path');
    if (query != null) uri = uri.replace(queryParameters: query);
    final response = await http.get(uri, headers: headers);
    return _parse(response);
  }

  Future<dynamic> post(String path, [Map<String, dynamic>? body]) async {
    final encodedBody = body != null ? jsonEncode(body) : '';
    final headers = await _authHeaders('POST', path, encodedBody);
    final response = await http.post(
      Uri.parse('$apiBaseUrl$path'),
      headers: headers,
      body: body != null ? utf8.encode(encodedBody) : null,
    );
    return _parse(response);
  }

  Future<dynamic> postAnonymous(String path, Map<String, dynamic> body) async {
    final encodedBody = jsonEncode(body);
    final headers = {
      'Content-Type': 'application/json; charset=utf-8',
      ..._signatureHeaders('POST', path, encodedBody),
    };
    final response = await http.post(
      Uri.parse('$apiBaseUrl$path'),
      headers: headers,
      body: utf8.encode(encodedBody),
    );
    return _parse(response);
  }

  Future<dynamic> patch(String path, Map<String, dynamic> body) async {
    final encodedBody = jsonEncode(body);
    final headers = await _authHeaders('PATCH', path, encodedBody);
    final response = await http.patch(
      Uri.parse('$apiBaseUrl$path'),
      headers: headers,
      body: utf8.encode(encodedBody),
    );
    return _parse(response);
  }

  Future<dynamic> delete(String path) async {
    final headers = await _authHeaders('DELETE', path, '');
    final response = await http.delete(
      Uri.parse('$apiBaseUrl$path'),
      headers: headers,
    );
    return _parse(response);
  }

  dynamic _parse(http.Response response) {
    final json =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json['data'];
    }
    throw parseApiException(json, response.statusCode);
  }
}
