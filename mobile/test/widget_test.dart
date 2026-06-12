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

    expect(find.bySemanticsLabel('Fury Note'), findsOneWidget);
    expect(find.text('Rage Record'), findsOneWidget);
    expect(find.text('How angry are you now?'), findsOneWidget);
  });

  testWidgets('uses dark Fury Note mockup theme colors', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const FuryNoteApp());
    await tester.pumpAndSettle();

    final root = tester.widget<DecoratedBox>(
      find.byKey(const ValueKey('fury-app-shell')),
    );
    final decoration = root.decoration as BoxDecoration;
    expect(decoration.color, const Color(0xFF1A1A1A));
    expect(
      Theme.of(tester.element(find.byType(FuryShell))).brightness,
      Brightness.dark,
    );
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

    await tester.tap(find.text('매우 화남'));
    await tester.pumpAndSettle();
    expect(find.text('무엇 때문인가요?'), findsOneWidget);

    await tester.tap(find.text('직장'));
    await tester.pumpAndSettle();
    expect(find.text('무슨 일이 있었나요?'), findsOneWidget);

    await tester.enterText(find.byType(TextField), '회의가 퇴근 직전에 잡혔다');
    await tester.pump();
    await tester.ensureVisible(find.text('다음'));
    await tester.tap(find.text('다음'));
    await tester.pumpAndSettle();
    expect(find.text('나중에 다시 볼까요?'), findsOneWidget);

    await tester.tap(find.text('1시간 후'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('다음'));
    await tester.tap(find.text('다음'));
    await tester.pumpAndSettle();

    expect(find.text('기록을 저장할까요?'), findsOneWidget);
    expect(find.textContaining('😡 매우 화남'), findsOneWidget);
    expect(find.text('💼 직장'), findsOneWidget);
    expect(find.text('회의가 퇴근 직전에 잡혔다'), findsOneWidget);
    expect(find.text('1시간 후'), findsOneWidget);
  });

  testWidgets('text step next button waits for text or voice input', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const FuryNoteApp(initialLocale: Locale('ko')));
    await tester.pumpAndSettle();

    await tester.tap(find.text('매우 화남'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('직장'));
    await tester.pumpAndSettle();

    expect(find.text('무슨 일이 있었나요?'), findsOneWidget);

    final nextButtonFinder = find.widgetWithText(FilledButton, '다음');
    expect(tester.widget<FilledButton>(nextButtonFinder).onPressed, isNull);

    await tester.tap(find.text('음성 입력'));
    await tester.pumpAndSettle();
    expect(tester.widget<FilledButton>(nextButtonFinder).onPressed, isNotNull);

    await tester.tap(find.text('다음'));
    await tester.pumpAndSettle();
    expect(find.text('나중에 다시 볼까요?'), findsOneWidget);
  });

  testWidgets('reminder step next button waits for reminder selection', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const FuryNoteApp(initialLocale: Locale('ko')));
    await tester.pumpAndSettle();

    await tester.tap(find.text('매우 화남'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('직장'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('음성 입력'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('다음'));
    await tester.pumpAndSettle();

    expect(find.text('나중에 다시 볼까요?'), findsOneWidget);

    final nextButtonFinder = find.widgetWithText(FilledButton, '다음');
    expect(tester.widget<FilledButton>(nextButtonFinder).onPressed, isNull);

    await tester.tap(find.text('1시간 후'));
    await tester.pumpAndSettle();
    expect(tester.widget<FilledButton>(nextButtonFinder).onPressed, isNotNull);
  });

  testWidgets(
    'custom reminder stays inline and opens non-draggable time picker',
    (WidgetTester tester) async {
      await tester.pumpWidget(const FuryNoteApp(initialLocale: Locale('ko')));
      await tester.pumpAndSettle();

      await tester.tap(find.text('매우 화남'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('직장'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('음성 입력'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('다음'));
      await tester.pumpAndSettle();

      final tomorrowBox = tester.getRect(find.text('내일'));
      final customBox = tester.getRect(find.text('직접 설정'));
      final customChipFinder = find.byKey(
        const ValueKey('custom-reminder-chip'),
      );
      final reminderWrap = tester.widget<Wrap>(
        find.byKey(const ValueKey('reminder-option-wrap')),
      );
      expect(reminderWrap.alignment, WrapAlignment.center);
      expect(customBox.top, greaterThanOrEqualTo(tomorrowBox.top));
      expect(tester.getSize(customChipFinder).width, lessThan(180));

      await tester.tap(find.text('직접 설정'));
      await tester.pumpAndSettle();

      expect(
        find.byKey(const ValueKey('custom-reminder-calendar')),
        findsOneWidget,
      );
      final calendar = tester.widget<CalendarDatePicker>(
        find.byKey(const ValueKey('custom-reminder-calendar')),
      );
      expect(
        calendar.lastDate.difference(DateTime.now()).inDays,
        greaterThan(3650),
      );
      expect(
        find.byKey(const ValueKey('custom-reminder-hour-picker')),
        findsOneWidget,
      );
      expect(
        find.byKey(const ValueKey('custom-reminder-minute-picker')),
        findsOneWidget,
      );
      expect(find.text('취소'), findsOneWidget);
      expect(find.text('저장'), findsOneWidget);
      expect(
        find.byWidgetPredicate(
          (widget) => widget.runtimeType.toString().contains('DragHandle'),
        ),
        findsNothing,
      );

      await tester.drag(
        find.byKey(const ValueKey('custom-reminder-hour-picker')),
        const Offset(0, -80),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('저장'));
      await tester.pumpAndSettle();

      final customChip = tester.widget<FilterChip>(customChipFinder);
      final customChipLabel = customChip.label as Text;

      expect(customChip.selected, isTrue);
      expect(customChipLabel.data, '직접 설정');
      expect(find.textContaining('직접 설정 ->'), findsNothing);
      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is Text &&
              RegExp(
                r'\d{4}\.\d{1,2}\.\d{1,2} \d{2}:\d{2}',
              ).hasMatch(widget.data ?? ''),
        ),
        findsOneWidget,
      );
      expect(
        tester
            .widget<FilledButton>(find.widgetWithText(FilledButton, '다음'))
            .onPressed,
        isNotNull,
      );
    },
  );

  test('dotted reminder date follows locale order', () {
    final value = DateTime(2027, 3, 14, 9, 5);

    expect(
      formatDottedLocaleDateTime(const Locale('ko'), value),
      '2027.3.14 09:05',
    );
    expect(
      formatDottedLocaleDateTime(const Locale('en', 'US'), value),
      '3.14.2027 09:05',
    );
    expect(
      formatDottedLocaleDateTime(const Locale('en', 'GB'), value),
      '14.3.2027 09:05',
    );
  });

  testWidgets('custom category can be typed and appears in summary', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const FuryNoteApp(initialLocale: Locale('ko')));
    await tester.pumpAndSettle();

    await tester.tap(find.text('화가 남'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('직접 입력'));
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
