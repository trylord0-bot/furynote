import 'package:fury_note/l10n/app_localizations.dart';

import 'api_client.dart';

String localizedApiErrorMessage(AppLocalizations l10n, ApiException exception) {
  return switch (exception.code) {
    'CONTENT_BLOCKED_URL' => l10n.apiErrorContentBlockedUrl,
    'CONTENT_BLOCKED_SPAM' => l10n.apiErrorContentBlockedSpam,
    'CONTENT_BLOCKED_MODERATION' => l10n.apiErrorContentBlockedModeration,
    'RATE_LIMIT_EXCEEDED' => l10n.apiErrorRateLimitExceeded,
    'INTERNAL_ERROR' => l10n.apiErrorInternal,
    'INVALID_REQUEST' => l10n.apiErrorInvalidRequest,
    'FORBIDDEN' => l10n.apiErrorForbidden,
    'POST_NOT_FOUND' => l10n.apiErrorPostNotFound,
    'COMMENT_NOT_FOUND' => l10n.apiErrorCommentNotFound,
    'SIGNATURE_REQUIRED' => l10n.apiErrorSignatureRequired,
    'SIGNATURE_INVALID' => l10n.apiErrorSignatureInvalid,
    'SIGNATURE_EXPIRED' => l10n.apiErrorSignatureExpired,
    'SIGNATURE_REPLAY' => l10n.apiErrorSignatureReplay,
    _ => l10n.apiErrorUnknown,
  };
}
