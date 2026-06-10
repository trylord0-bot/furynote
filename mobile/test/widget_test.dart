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

  testWidgets('record flow builds a localized save summary', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const FuryNoteApp(initialLocale: Locale('ko')));
    await tester.pumpAndSettle();

    await tester.tap(find.textContaining('Lv.4'));
    await tester.pumpAndSettle();
    expect(find.text('무엇 때문인가요?'), findsOneWidget);

    await tester.tap(find.text('직장'));
    await tester.pumpAndSettle();
    expect(find.text('무슨 일이 있었나요?'), findsOneWidget);

    await tester.enterText(find.byType(TextField), '회의가 퇴근 직전에 잡혔다');
    await tester.tap(find.text('다음'));
    await tester.pumpAndSettle();
    expect(find.text('나중에 다시 볼까요?'), findsOneWidget);

    await tester.tap(find.text('1시간 후'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('다음'));
    await tester.pumpAndSettle();

    expect(find.text('기록을 저장할까요?'), findsOneWidget);
    expect(find.textContaining('😡 Lv.4'), findsOneWidget);
    expect(find.text('💼 직장'), findsOneWidget);
    expect(find.text('회의가 퇴근 직전에 잡혔다'), findsOneWidget);
    expect(find.text('1시간 후'), findsOneWidget);
  });

  testWidgets('custom category can be typed and appears in summary', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const FuryNoteApp(initialLocale: Locale('ko')));
    await tester.pumpAndSettle();

    await tester.tap(find.textContaining('Lv.2'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('직접 입력'));
    await tester.pumpAndSettle();

    expect(find.text('카테고리를 입력하세요'), findsOneWidget);

    await tester.enterText(
      find.byKey(const ValueKey('custom-category-field')),
      '육아',
    );
    await tester.ensureVisible(
      find.byKey(const ValueKey('custom-category-next')),
    );
    await tester.tap(find.byKey(const ValueKey('custom-category-next')));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byKey(const ValueKey('text-step-skip')));
    await tester.tap(find.byKey(const ValueKey('text-step-skip')));
    await tester.pumpAndSettle();
    await tester.ensureVisible(
      find.byKey(const ValueKey('reminder-step-skip')),
    );
    await tester.tap(find.byKey(const ValueKey('reminder-step-skip')));
    await tester.pumpAndSettle();

    expect(find.text('➕ 육아'), findsOneWidget);
  });
}
