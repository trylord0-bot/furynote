import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fury_note/l10n/app_localizations.dart';
import 'package:fury_note/l10n/l10n_extensions.dart';

void main() {
  test('supported locales include requested languages and region variants', () {
    const requestedLocales = [
      Locale('en'),
      Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
      Locale('es'),
      Locale('hi'),
      Locale('ar'),
      Locale('pt', 'BR'),
      Locale('ru'),
      Locale('ja'),
      Locale('de'),
      Locale('ko'),
      Locale('fr'),
      Locale('id'),
      Locale('tr'),
      Locale('it'),
      Locale('th'),
      Locale('vi'),
      Locale('pl'),
      Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
    ];

    for (final locale in requestedLocales) {
      expect(AppLocalizations.supportedLocales, contains(locale));
      expect(AppLocalizations.delegate.isSupported(locale), isTrue);
    }
  });

  test('number and date helpers use the resolved locale name', () {
    final de = lookupAppLocalizations(const Locale('de'));
    final ptBr = lookupAppLocalizations(const Locale('pt', 'BR'));
    final zhHant = lookupAppLocalizations(
      const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
    );

    expect(de.localeName, 'de');
    expect(ptBr.localeName, 'pt_BR');
    expect(zhHant.localeName, 'zh_Hant');
    expect(de.formatDecimal(1234.5), '1.234,5');
    expect(ptBr.formatDecimal(1234.5), '1.234,5');
    expect(zhHant.formatInteger(1234567), '1,234,567');
  });
}
