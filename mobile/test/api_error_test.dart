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

  test('localizes URL, spam, and profanity filter errors', () {
    const cases = [
      (
        code: 'CONTENT_BLOCKED_URL',
        ko: '링크가 포함된 글은 등록할 수 없어요.',
        en: 'Posts with links cannot be submitted.',
      ),
      (
        code: 'CONTENT_BLOCKED_SPAM',
        ko: '광고성 문구가 포함되어 있어요.',
        en: 'Promotional text cannot be submitted.',
      ),
      (
        code: 'CONTENT_BLOCKED_PROFANITY',
        ko: '비속어가 포함되어 있어 등록할 수 없어요.',
        en: 'Content containing profanity cannot be submitted.',
      ),
    ];

    for (final testCase in cases) {
      final exception = ApiException(testCase.code, 'server message', 400);
      expect(
        localizedApiErrorMessage(AppLocalizationsKo(), exception),
        testCase.ko,
      );
      expect(
        localizedApiErrorMessage(AppLocalizationsEn(), exception),
        testCase.en,
      );
    }
  });
}
