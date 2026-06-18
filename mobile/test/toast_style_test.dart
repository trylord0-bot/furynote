import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fury_note/main.dart';
import 'package:fury_note/widgets/shared_widgets.dart';

void main() {
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
