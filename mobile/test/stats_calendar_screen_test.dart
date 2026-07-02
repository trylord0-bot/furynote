import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fury_note/l10n/app_localizations.dart';
import 'package:fury_note/screens/stats_calendar_screen.dart';
import 'package:fury_note/src/notes/rage_note.dart';
import 'package:fury_note/src/notes/rage_note_repository.dart';
import 'package:fury_note/widgets/shared_widgets.dart';

void main() {
  test('uses stop icon while audio is playing', () {
    expect(statsCalendarPlaybackIcon(isPlaying: true), Icons.stop);
    expect(statsCalendarPlaybackIcon(isPlaying: false), Icons.play_arrow);
  });

  testWidgets('shows playback button before reminder in selected records', (
    WidgetTester tester,
  ) async {
    final today = DateTime.now();
    final repository = _FakeRageNoteRepository(
      notes: [
        RageNote(
          id: 1,
          createdAt: DateTime(today.year, today.month, today.day, 9, 30),
          rageLevel: 4,
          rageEmoji: '😡',
          rageLabel: '매우 화남',
          categoryKey: 'work',
          categoryEmoji: '💼',
          categoryLabel: '직장',
          body: '오늘 저장된 기록',
          audioPath: 'voice/today.m4a',
          reminderAt: today.add(const Duration(hours: 1)),
        ),
      ],
    );

    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('ko'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: StatsCalendarScreen(noteRepository: repository),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    await tester.scrollUntilVisible(
      find.text('오늘 저장된 기록'),
      500,
      scrollable: find.byType(Scrollable).first,
    );

    expect(find.widgetWithText(FilledButton, '재생'), findsOneWidget);
    expect(
      tester.getTopLeft(find.text('재생')).dx,
      lessThan(tester.getTopLeft(find.text('리마인더')).dx),
    );
    expect(
      AppLocalizations.of(tester.element(find.byType(Scaffold))).stop,
      '중지',
    );

    final playbackButton = tester.widget<FilledButton>(
      find.widgetWithText(FilledButton, '재생'),
    );
    expect(
      playbackButton.style?.padding?.resolve(const {}),
      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    );
    expect(
      playbackButton.style?.minimumSize?.resolve(const {}),
      const Size(0, 32),
    );

    final recordCard = find.ancestor(
      of: find.text('오늘 저장된 기록'),
      matching: find.byType(FuryPostCard),
    );
    final buttonRect = tester.getRect(find.widgetWithText(FilledButton, '재생'));
    final cardRect = tester.getRect(recordCard);
    expect(buttonRect.left, greaterThanOrEqualTo(cardRect.left + 4));
    expect(buttonRect.top, greaterThanOrEqualTo(cardRect.bottom + 6));
  });
}

class _FakeRageNoteRepository extends RageNoteRepository {
  _FakeRageNoteRepository({required List<RageNote> notes}) : _notes = notes;

  final List<RageNote> _notes;

  @override
  Future<List<RageNote>> getAll() async => List<RageNote>.of(_notes);
}
