import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fury_note/main.dart';
import 'package:fury_note/widgets/shared_widgets.dart';

void main() {
  testWidgets('FurySnackBar.show renders through the global toast overlay', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const FuryNoteApp(initialLocale: Locale('ko')));
    await tester.pump();
    await tester.pump();

    FurySnackBar.show(tester.element(find.byType(FuryShell)), '전역 토스트');
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 120));

    final toastFinder = find.byKey(const ValueKey('bottom-action-toast'));
    final toastText = tester.widget<Text>(
      find.descendant(of: toastFinder, matching: find.text('전역 토스트')),
    );
    expect(find.text('전역 토스트'), findsOneWidget);
    expect(toastText.style?.decoration, TextDecoration.none);
    expect(
      find.descendant(
        of: find.byKey(const ValueKey('fury-toast-overlay')),
        matching: toastFinder,
      ),
      findsOneWidget,
    );
  });

  testWidgets('FurySnackBar uses a readable unified success style', (
    WidgetTester tester,
  ) async {
    final snackBar = FurySnackBar.success('Saved');
    final content = snackBar.content as Text;
    final shape = snackBar.shape as RoundedRectangleBorder;

    expect(snackBar.behavior, SnackBarBehavior.floating);
    expect(snackBar.backgroundColor, const Color(0xFFB3262F));
    expect(snackBar.duration, const Duration(seconds: 2));
    expect(content.style?.color, FuryColors.toastText);
    expect(content.style?.fontWeight, FontWeight.w800);
    expect(shape.borderRadius, BorderRadius.circular(8));
  });

  testWidgets('FurySnackBar uses the same readable shape for errors', (
    WidgetTester tester,
  ) async {
    final snackBar = FurySnackBar.error('Failed');
    final content = snackBar.content as Text;
    final shape = snackBar.shape as RoundedRectangleBorder;

    expect(snackBar.behavior, SnackBarBehavior.floating);
    expect(snackBar.backgroundColor, FuryColors.toastError);
    expect(content.style?.color, FuryColors.toastText);
    expect(content.style?.fontWeight, FontWeight.w800);
    expect(shape.borderRadius, BorderRadius.circular(8));
  });
}
