import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('user-visible Korean strings are provided through l10n', () {
    final dartFiles = Directory('lib')
        .listSync(recursive: true)
        .whereType<File>()
        .where((file) => file.path.endsWith('.dart'))
        .where(
          (file) => !file.path.contains(
            '${Platform.pathSeparator}l10n${Platform.pathSeparator}',
          ),
        )
        .where((file) => !file.path.endsWith('firebase_options.dart'));

    final koreanStringLiterals = <String>[];
    final stringLiteralPattern = RegExp(
      r"""(?:r)?(?:"""
      "'''[\\s\\S]*?'''"
      r'''|"""[\s\S]*?"""|'(?:\\.|[^'\\])*'|"(?:\\.|[^"\\])*")''',
      multiLine: true,
    );
    final koreanPattern = RegExp('[가-힣]');

    for (final file in dartFiles) {
      final source = file.readAsStringSync();
      for (final match in stringLiteralPattern.allMatches(source)) {
        final literal = match.group(0)!;
        if (!koreanPattern.hasMatch(literal)) {
          continue;
        }

        final line =
            '\n'.allMatches(source.substring(0, match.start)).length + 1;
        koreanStringLiterals.add('${file.path}:$line: $literal');
      }
    }

    expect(koreanStringLiterals, isEmpty);
  });
}
