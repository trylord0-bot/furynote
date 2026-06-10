// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fury_note/main.dart';

void main() {
  testWidgets('Fury Note renders record flow', (WidgetTester tester) async {
    await tester.pumpWidget(const FuryNoteApp());
    await tester.pumpAndSettle();

    expect(find.text('Fury Note'), findsOneWidget);
    expect(find.text('Rage Record'), findsOneWidget);
    expect(find.text('How angry are you now?'), findsOneWidget);
  });

  testWidgets('bottom tabs navigate to feed stats and calm screens', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const FuryNoteApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Feed'));
    await tester.pumpAndSettle();
    expect(find.text('Anonymous Feed'), findsOneWidget);

    await tester.tap(find.text('Stats'));
    await tester.pumpAndSettle();
    expect(find.text('Rage Stats'), findsOneWidget);

    await tester.tap(find.text('Calm'));
    await tester.pumpAndSettle();
    expect(find.text('Calming Tools'), findsOneWidget);
  });

  testWidgets('Korean locale renders Korean record copy', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const FuryNoteApp(initialLocale: Locale('ko')));
    await tester.pumpAndSettle();

    expect(find.text('분노 기록'), findsOneWidget);
    expect(find.text('지금 얼마나 화났나요?'), findsOneWidget);
  });
}
