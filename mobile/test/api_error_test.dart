import 'package:flutter_test/flutter_test.dart';
import 'package:fury_note/l10n/app_localizations_en.dart';
import 'package:fury_note/l10n/app_localizations_ko.dart';
import 'package:fury_note/src/api/api_client.dart';
import 'package:fury_note/src/api/api_error_messages.dart';

void main() {
  test('parses FastAPI wrapped error codes from HTTPException detail', () {
    final exception = parseApiException({
      'detail': {
        'success': false,
        'data': null,
        'error': {
          'code': 'CONTENT_BLOCKED_URL',
          'message': 'URL이 포함된 포스팅은 등록할 수 없어요.',
        },
      },
    }, 400);

    expect(exception.code, 'CONTENT_BLOCKED_URL');
    expect(exception.message, 'URL이 포함된 포스팅은 등록할 수 없어요.');
    expect(exception.statusCode, 400);
  });

  test('localizes server error codes instead of using server message text', () {
    const exception = ApiException(
      'CONTENT_BLOCKED_URL',
      'URL이 포함된 포스팅은 등록할 수 없어요.',
      400,
    );

    expect(
      localizedApiErrorMessage(AppLocalizationsKo(), exception),
      '링크가 포함된 글은 등록할 수 없어요.',
    );
    expect(
      localizedApiErrorMessage(AppLocalizationsEn(), exception),
      'Posts with links cannot be submitted.',
    );
  });
}
