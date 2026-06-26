import 'dart:async';
import 'dart:convert';

// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'package:fury_note/main.dart';
import 'package:fury_note/src/audio/voice_recorder.dart';
import 'package:fury_note/src/api/api_client.dart';
import 'package:fury_note/src/api/feed_service.dart';
import 'package:fury_note/src/notes/rage_note.dart';
import 'package:fury_note/src/notes/rage_note_repository.dart';
import 'package:fury_note/src/notifications/reminder_notification_service.dart';
import 'package:fury_note/src/notifications/push_notification_service.dart';
import 'package:fury_note/src/profile/app_profile.dart';
import 'package:fury_note/widgets/comment_sheet.dart';
import 'package:fury_note/widgets/shared_widgets.dart';

void main() {
  setUpAll(() {
    sqfliteFfiInit();
    sqflite.databaseFactory = databaseFactoryFfi;
  });

  testWidgets('Fury Note renders feed by default', (WidgetTester tester) async {
    await tester.pumpWidget(const FuryNoteApp());
    await tester.pumpAndSettle();

    expect(find.bySemanticsLabel('Fury Note'), findsWidgets);
    expect(find.text('Feed'), findsWidgets);
    expect(find.text('Anonymous Feed'), findsNothing);
    expect(find.text('Rage Record'), findsNothing);
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

    expect(find.text('Feed'), findsWidgets);

    await tester.tap(find.text('Record'));
    await tester.pumpAndSettle();
    expect(find.text('Rage Record'), findsOneWidget);

    await tester.tap(find.text('Stats'));
    await tester.pumpAndSettle();
    expect(find.text('Rage Stats'), findsWidgets);

    await tester.tap(find.text('Calm'));
    await tester.pumpAndSettle();
    expect(find.text('Calming Tools'), findsWidgets);
  });

  testWidgets('tapping a reminder notification opens the calm screen', (
    WidgetTester tester,
  ) async {
    final tapSource = _FakeReminderNotificationTapSource();

    try {
      await tester.pumpWidget(
        FuryNoteApp(
          initialLocale: const Locale('ko'),
          reminderNotificationTapSource: tapSource,
        ),
      );
      await tester.pump();

      expect(find.text('피드'), findsWidgets);
      expect(find.text('리마인드 노트'), findsNothing);

      tapSource.emit(const ReminderNotificationTap(noteId: 1));
      await tester.pump();

      expect(_headerTitle('진정'), findsOneWidget);
      expect(find.text('리마인드 노트'), findsOneWidget);
    } finally {
      await tapSource.dispose();
    }
  });

  testWidgets('tapping a comment push opens the matching post comments', (
    WidgetTester tester,
  ) async {
    final pushTapSource = _FakeCommentPushTapSource();
    final feedService = _FakeFeedService(
      posts: [
        FeedPost(
          postId: 'post-1',
          nickname: '테스터',
          rageLevel: 3,
          category: 'work',
          text: '댓글을 확인할 글',
          likeCount: 0,
          commentCount: 1,
          isLiked: false,
          isMine: true,
          createdAt: DateTime.now(),
        ),
      ],
      comments: {
        'post-1': [
          FeedComment(
            commentId: 'comment-1',
            nickname: '친구',
            text: '푸시로 들어온 댓글',
            isMine: false,
            createdAt: DateTime.now(),
          ),
        ],
      },
    );

    try {
      await tester.pumpWidget(
        FuryNoteApp(
          initialLocale: const Locale('ko'),
          feedService: feedService,
          commentPushTapSource: pushTapSource,
        ),
      );
      await tester.pump();
      await tester.pump();

      expect(find.text('댓글을 확인할 글'), findsOneWidget);
      expect(find.text('푸시로 들어온 댓글'), findsNothing);

      pushTapSource.emit(const CommentPushTap(postId: 'post-1'));
      await tester.pump();
      await tester.pump();
      await tester.pump();
      await tester.pump();

      expect(_headerTitle('피드'), findsOneWidget);
      expect(find.byType(CommentSheet), findsOneWidget);
      expect(find.text('댓글 1개'), findsOneWidget);
      expect(find.text('푸시로 들어온 댓글'), findsOneWidget);
    } finally {
      await pushTapSource.dispose();
    }
  });

  testWidgets('comment sheet shows the source post above scrollable comments', (
    WidgetTester tester,
  ) async {
    final feedService = _FakeFeedService(
      posts: const [],
      comments: {
        'post-1': [
          FeedComment(
            commentId: 'comment-1',
            nickname: '친구',
            text: '댓글 목록 첫 줄',
            isMine: false,
            createdAt: DateTime.now(),
          ),
        ],
      },
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CommentSheet(
            postId: 'post-1',
            initialCommentCount: 1,
            postNickname: '원글 작성자',
            postText: '댓글 팝업 원글',
            postRageLevel: 5,
            postCategory: 'work',
            feedService: feedService,
            onCountChanged: (_) {},
          ),
        ),
      ),
    );
    await tester.pump();
    await tester.pump();

    expect(find.text('댓글 1개'), findsOneWidget);
    expect(find.text('원글 작성자'), findsOneWidget);
    expect(find.byType(FuryProfileAvatar), findsWidgets);
    expect(find.text('댓글 팝업 원글'), findsOneWidget);
    expect(find.text('🤬'), findsOneWidget);
    expect(find.text('💼 직장'), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
    expect(
      tester.getTopLeft(find.text('댓글 팝업 원글')).dy,
      lessThan(tester.getTopLeft(find.text('댓글 목록 첫 줄')).dy),
    );
  });

  testWidgets('feed post shows relative time at the card bottom right', (
    WidgetTester tester,
  ) async {
    final now = DateTime.now();
    final feedService = _FakeFeedService(
      posts: [
        FeedPost(
          postId: 'post-minutes',
          nickname: '시간 기록자',
          rageLevel: 4,
          category: 'work',
          text: '방금 전 피드',
          likeCount: 0,
          commentCount: 0,
          isLiked: false,
          isMine: false,
          createdAt: now.subtract(const Duration(minutes: 5)),
        ),
        FeedPost(
          postId: 'post-days',
          nickname: '오래된 기록자',
          rageLevel: 3,
          category: 'family',
          text: '며칠 전 피드',
          likeCount: 0,
          commentCount: 0,
          isLiked: false,
          isMine: false,
          createdAt: now.subtract(const Duration(days: 2, minutes: 5)),
        ),
      ],
    );

    await tester.pumpWidget(
      FuryNoteApp(initialLocale: const Locale('ko'), feedService: feedService),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    final card = find.ancestor(
      of: find.text('방금 전 피드'),
      matching: find.byType(FuryPostCard),
    );
    expect(card, findsOneWidget);
    expect(
      find.descendant(of: card, matching: find.byIcon(Icons.access_time)),
      findsNothing,
    );
    _expectTextAtCardBottomRight(tester, card, '5분 전');

    final oldCard = find.ancestor(
      of: find.text('며칠 전 피드'),
      matching: find.byType(FuryPostCard),
    );
    expect(oldCard, findsOneWidget);
    _expectTextAtCardBottomRight(tester, oldCard, '2일 전');
  });

  testWidgets('comment sheet renders comment author avatar images', (
    WidgetTester tester,
  ) async {
    const avatarBase64 =
        'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/x8AAwMCAO+/p9sAAAAASUVORK5CYII=';
    final feedService = _FakeFeedService(
      posts: const [],
      comments: {
        'post-1': [
          FeedComment.fromJson({
            'comment_id': 'comment-1',
            'nickname': '친구',
            'text': '아바타가 있는 댓글',
            'is_mine': false,
            'created_at': DateTime.now().toIso8601String(),
            'avatar_base64': avatarBase64,
          }),
        ],
      },
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CommentSheet(
            postId: 'post-1',
            initialCommentCount: 1,
            feedService: feedService,
            onCountChanged: (_) {},
          ),
        ),
      ),
    );
    await tester.pump();
    await tester.pump();

    expect(find.text('아바타가 있는 댓글'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
  });

  testWidgets('comment sheet input shows saved profile avatar centered', (
    WidgetTester tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    AppProfileController.instance.resetForTesting();
    addTearDown(AppProfileController.instance.resetForTesting);
    await AppProfileController.instance.updateAvatar(
      base64Decode(
        'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/x8AAwMCAO+/p9sAAAAASUVORK5CYII=',
      ),
    );

    final feedService = _FakeFeedService(posts: const []);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CommentSheet(
            postId: 'post-1',
            initialCommentCount: 0,
            feedService: feedService,
            onCountChanged: (_) {},
          ),
        ),
      ),
    );
    await tester.pump();
    await tester.pump();

    final avatarFinder = find.byKey(const ValueKey('comment-input-avatar'));
    final sendButtonFinder = find.byKey(const ValueKey('comment-send-button'));
    final fieldFinder = find.byType(TextField);

    expect(avatarFinder, findsOneWidget);
    expect(
      find.descendant(of: avatarFinder, matching: find.byType(Image)),
      findsOneWidget,
    );
    expect(
      tester.getCenter(avatarFinder).dy,
      moreOrLessEquals(tester.getCenter(fieldFinder).dy, epsilon: 0.5),
    );
    expect(
      tester.getCenter(avatarFinder).dy,
      moreOrLessEquals(tester.getCenter(sendButtonFinder).dy, epsilon: 0.5),
    );
  });

  testWidgets('feed post without avatar does not fall back to profile avatar', (
    WidgetTester tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    AppProfileController.instance.resetForTesting();
    addTearDown(AppProfileController.instance.resetForTesting);
    await AppProfileController.instance.updateAvatar(
      base64Decode(
        'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/x8AAwMCAO+/p9sAAAAASUVORK5CYII=',
      ),
    );

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: FuryPostCard(
            emoji: '😡',
            nickname: '다른 설치',
            category: '💼 직장',
            text: '아바타 없는 글',
          ),
        ),
      ),
    );
    await tester.pump();

    expect(find.text('다른 설치'), findsOneWidget);
    expect(find.byType(Image), findsNothing);
  });

  testWidgets('rejected profanity comment shows localized error toast', (
    WidgetTester tester,
  ) async {
    final pushTapSource = _FakeCommentPushTapSource();
    final feedService = _FakeFeedService(
      posts: const [],
      createCommentError: const ApiException(
        'CONTENT_BLOCKED_PROFANITY',
        '부적절한 내용이 포함되어 있어요.',
        400,
      ),
    );

    try {
      await tester.pumpWidget(
        FuryNoteApp(
          initialLocale: const Locale('ko'),
          feedService: feedService,
          commentPushTapSource: pushTapSource,
        ),
      );
      await tester.pump();

      pushTapSource.emit(const CommentPushTap(postId: 'post-1'));
      await tester.pump();
      await tester.pump();
      await tester.pump();

      await tester.enterText(find.byType(TextField), '시발');
      final sendButton = tester.widget<GestureDetector>(
        find.ancestor(
          of: find.byIcon(Icons.send_rounded),
          matching: find.byType(GestureDetector),
        ),
      );
      sendButton.onTap!();
      await tester.pump();

      expect(find.text('비속어가 포함되어 있어 등록할 수 없어요.'), findsOneWidget);
    } finally {
      await pushTapSource.dispose();
    }
  });

  testWidgets('successful comment submit shows localized success toast', (
    WidgetTester tester,
  ) async {
    final pushTapSource = _FakeCommentPushTapSource();
    final feedService = _FakeFeedService(posts: const []);

    try {
      await tester.pumpWidget(
        FuryNoteApp(
          initialLocale: const Locale('ko'),
          feedService: feedService,
          commentPushTapSource: pushTapSource,
        ),
      );
      await tester.pump();

      pushTapSource.emit(const CommentPushTap(postId: 'post-1'));
      await tester.pump();
      await tester.pump();
      await tester.pump();

      await tester.enterText(find.byType(TextField), '반가워요');
      final sendButton = tester.widget<GestureDetector>(
        find.ancestor(
          of: find.byIcon(Icons.send_rounded),
          matching: find.byType(GestureDetector),
        ),
      );
      sendButton.onTap!();
      await tester.pump();

      expect(find.text('반가워요'), findsOneWidget);
      expect(find.text('댓글이 등록되었어요'), findsOneWidget);
    } finally {
      await pushTapSource.dispose();
    }
  });

  testWidgets(
    'comment push opens comments even when post is not in feed page',
    (WidgetTester tester) async {
      final pushTapSource = _FakeCommentPushTapSource();
      final feedService = _FakeFeedService(
        posts: [
          FeedPost(
            postId: 'post-1',
            nickname: '테스터',
            rageLevel: 3,
            category: 'work',
            text: '첫 페이지의 다른 글',
            likeCount: 0,
            commentCount: 0,
            isLiked: false,
            isMine: true,
            createdAt: DateTime.now(),
          ),
        ],
        comments: {
          'post-99': [
            FeedComment(
              commentId: 'comment-99',
              nickname: '친구',
              text: '목록 밖 글의 댓글',
              isMine: false,
              createdAt: DateTime.now(),
            ),
          ],
        },
      );

      try {
        await tester.pumpWidget(
          FuryNoteApp(
            initialLocale: const Locale('ko'),
            feedService: feedService,
            commentPushTapSource: pushTapSource,
          ),
        );
        await tester.pump();
        await tester.pump();

        expect(find.text('첫 페이지의 다른 글'), findsOneWidget);
        expect(find.text('목록 밖 글의 댓글'), findsNothing);

        pushTapSource.emit(const CommentPushTap(postId: 'post-99'));
        await tester.pump();
        await tester.pump();
        await tester.pump();
        await tester.pump();

        expect(_headerTitle('피드'), findsOneWidget);
        expect(find.byType(CommentSheet), findsOneWidget);
        expect(find.text('목록 밖 글의 댓글'), findsOneWidget);
      } finally {
        await pushTapSource.dispose();
      }
    },
  );

  testWidgets('top header title follows the selected screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const FuryNoteApp());
    await tester.pumpAndSettle();

    expect(_headerTitle('Feed'), findsOneWidget);
    expect(_headerTitle('Fury Note'), findsNothing);

    await tester.tap(find.text('Record'));
    await tester.pumpAndSettle();
    expect(_headerTitle('Rage Record'), findsOneWidget);

    await tester.tap(find.text('Stats'));
    await tester.pumpAndSettle();
    expect(_headerTitle('Rage Stats'), findsOneWidget);

    await tester.tap(find.text('Calm'));
    await tester.pumpAndSettle();
    expect(_headerTitle('Calming Tools'), findsOneWidget);
  });

  testWidgets('menu opens from the right and shows avatar before nickname', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const FuryNoteApp(initialLocale: Locale('ko')));
    await tester.pumpAndSettle();

    final scaffold = tester.widget<Scaffold>(find.byType(Scaffold));
    expect(scaffold.drawer, isNull);
    expect(scaffold.endDrawer, isA<Drawer>());

    await tester.tap(find.byTooltip('menu'));
    await tester.pumpAndSettle();

    expect(find.byType(FuryDrawer), findsOneWidget);
    expect(find.byKey(const ValueKey('drawer-profile-avatar')), findsOneWidget);
    expect(
      tester.getCenter(find.byKey(const ValueKey('drawer-profile-avatar'))).dx,
      lessThan(
        tester.getCenter(find.byKey(const ValueKey('drawer-profile-name'))).dx,
      ),
    );
  });

  testWidgets('settings notification switches load disabled preferences', (
    WidgetTester tester,
  ) async {
    SharedPreferences.setMockInitialValues({
      'notification.remind_enabled': false,
      'notification.comment_enabled': false,
    });

    await tester.pumpWidget(const FuryNoteApp(initialLocale: Locale('ko')));
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('설정'));
    await tester.pumpAndSettle();

    final switches = tester.widgetList<Switch>(find.byType(Switch)).toList();
    expect(switches, hasLength(2));
    expect(switches[0].value, isFalse);
    expect(switches[1].value, isFalse);
  });

  testWidgets('settings notification switches persist changes', (
    WidgetTester tester,
  ) async {
    SharedPreferences.setMockInitialValues({});

    await tester.pumpWidget(const FuryNoteApp(initialLocale: Locale('ko')));
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('설정'));
    await tester.pumpAndSettle();

    await tester.tap(find.byType(Switch).first);
    await tester.pumpAndSettle();
    await tester.tap(find.byType(Switch).last);
    await tester.pumpAndSettle();

    final preferences = await SharedPreferences.getInstance();
    expect(preferences.getBool('notification.remind_enabled'), isFalse);
    expect(preferences.getBool('notification.comment_enabled'), isFalse);
  });

  testWidgets('drawer shows the actual saved rage note count', (
    WidgetTester tester,
  ) async {
    final repository = _FakeRageNoteRepository(
      seedNotes: [
        RageNote(
          id: 1,
          createdAt: DateTime.now(),
          rageLevel: 3,
          rageEmoji: '😠',
          rageLabel: '꽤 화남',
          categoryKey: 'work',
          categoryEmoji: '💼',
          categoryLabel: '직장',
          body: '첫 기록',
        ),
        RageNote(
          id: 2,
          createdAt: DateTime.now().subtract(const Duration(days: 1)),
          rageLevel: 2,
          rageEmoji: '😤',
          rageLabel: '화남',
          categoryKey: 'family',
          categoryEmoji: '👨‍👩‍👧',
          categoryLabel: '가족',
          body: '둘째 기록',
        ),
      ],
    );

    await tester.pumpWidget(
      FuryNoteApp(
        initialLocale: const Locale('ko'),
        noteRepository: repository,
        feedService: _FakeFeedService(posts: const []),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    await tester.tap(find.byTooltip('menu'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.text('🔥 분노 기록 2회'), findsOneWidget);
    expect(find.text('🔥 분노 기록 47회'), findsNothing);
  });

  testWidgets('Korean locale renders Korean record copy', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const FuryNoteApp(initialLocale: Locale('ko')));
    await tester.pumpAndSettle();

    expect(find.text('피드'), findsWidgets);
    expect(find.text('익명 피드'), findsNothing);

    await tester.tap(find.text('기록'));
    await tester.pumpAndSettle();

    expect(find.text('분노 기록'), findsOneWidget);
    expect(find.text('지금 얼마나 화났나요?'), findsOneWidget);
  });

  testWidgets('record flow builds a localized save summary', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const FuryNoteApp(initialLocale: Locale('ko')));
    await tester.pumpAndSettle();
    await _openRecordTab(tester, label: '기록');

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

  testWidgets('text step next button waits for text before continuing', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const FuryNoteApp(initialLocale: Locale('ko')));
    await tester.pumpAndSettle();
    await _openRecordTab(tester, label: '기록');

    await tester.tap(find.text('매우 화남'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('직장'));
    await tester.pumpAndSettle();

    expect(find.text('무슨 일이 있었나요?'), findsOneWidget);

    final nextButtonFinder = find.widgetWithText(FilledButton, '다음');
    expect(tester.widget<FilledButton>(nextButtonFinder).onPressed, isNull);

    await tester.enterText(find.byType(TextField), '텍스트로 기록');
    await tester.pump();
    expect(tester.widget<FilledButton>(nextButtonFinder).onPressed, isNotNull);

    await tester.tap(find.text('다음'));
    await tester.pumpAndSettle();
    expect(find.text('나중에 다시 볼까요?'), findsOneWidget);
  });

  testWidgets('tapping outside a focused text field clears focus', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const FuryNoteApp(initialLocale: Locale('ko')));
    await tester.pump();
    await tester.pump();

    await tester.tap(find.text('기록'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 350));
    await tester.tap(find.text('매우 화남'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 350));
    await tester.tap(find.text('직장'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 350));

    final textField = find.byType(TextField);
    await tester.showKeyboard(textField);
    await tester.pump();

    expect(tester.testTextInput.isVisible, isTrue);

    await tester.tap(find.text('무슨 일이 있었나요?'));
    await tester.pump();

    expect(tester.testTextInput.isVisible, isFalse);
  });

  testWidgets('reminder step next button waits for reminder selection', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const FuryNoteApp(initialLocale: Locale('ko')));
    await tester.pumpAndSettle();
    await _openRecordTab(tester, label: '기록');

    await tester.tap(find.text('매우 화남'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('직장'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byKey(const ValueKey('text-step-skip')));
    await tester.tap(find.byKey(const ValueKey('text-step-skip')));
    await tester.pumpAndSettle();

    expect(find.text('나중에 다시 볼까요?'), findsOneWidget);

    final nextButtonFinder = find.widgetWithText(FilledButton, '다음');
    expect(tester.widget<FilledButton>(nextButtonFinder).onPressed, isNull);

    await tester.tap(find.text('1시간 후'));
    await tester.pumpAndSettle();
    expect(tester.widget<FilledButton>(nextButtonFinder).onPressed, isNotNull);
  });

  testWidgets('voice recording button records, stops, and starts over', (
    WidgetTester tester,
  ) async {
    final recorder = _FakeVoiceRecorder();

    await tester.pumpWidget(
      FuryNoteApp(
        initialLocale: const Locale('ko'),
        noteRepository: _FakeRageNoteRepository(),
        voiceRecorder: recorder,
      ),
    );
    await tester.pumpAndSettle();
    await _openRecordTab(tester, label: '기록');

    await tester.tap(find.text('매우 화남'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('직장'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('음성 녹음'));
    await tester.pumpAndSettle();
    expect(recorder.startCount, 1);
    expect(find.text('녹음 중지'), findsOneWidget);

    await tester.tap(find.text('녹음 중지'));
    await tester.pumpAndSettle();
    expect(recorder.stopCount, 1);
    expect(find.text('음성 녹음이 저장됐어요.'), findsOneWidget);
    expect(find.text('다시 녹음'), findsOneWidget);

    await tester.tap(find.text('다시 녹음'));
    await tester.pumpAndSettle();
    expect(recorder.startCount, 2);
    expect(find.text('녹음 중지'), findsOneWidget);
  });

  testWidgets('saving a note with reminder schedules local notification', (
    WidgetTester tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    final repository = _FakeRageNoteRepository();
    final scheduler = _FakeReminderScheduler();

    await tester.pumpWidget(
      FuryNoteApp(
        initialLocale: const Locale('ko'),
        noteRepository: repository,
        reminderScheduler: scheduler,
      ),
    );
    await tester.pumpAndSettle();
    await _openRecordTab(tester, label: '기록');

    await tester.tap(find.text('매우 화남'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('직장'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byKey(const ValueKey('text-step-skip')));
    await tester.tap(find.byKey(const ValueKey('text-step-skip')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('1시간 후'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('다음'));
    await tester.tap(find.text('다음'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('기록하기'));
    await tester.tap(find.text('기록하기'));
    await tester.pumpAndSettle();

    expect(repository.savedNotes, hasLength(1));
    expect(scheduler.calls, hasLength(1));
    expect(scheduler.calls.single.id, 1);
    expect(scheduler.calls.single.scheduledAt.isAfter(DateTime.now()), isTrue);
  });

  testWidgets('disabled reminder notifications skip local scheduling', (
    WidgetTester tester,
  ) async {
    SharedPreferences.setMockInitialValues({
      'notification.remind_enabled': false,
    });
    final repository = _FakeRageNoteRepository();
    final scheduler = _FakeReminderScheduler();

    await tester.pumpWidget(
      FuryNoteApp(
        initialLocale: const Locale('ko'),
        noteRepository: repository,
        reminderScheduler: scheduler,
      ),
    );
    await tester.pumpAndSettle();
    await _openRecordTab(tester, label: '기록');

    await tester.tap(find.text('매우 화남'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('직장'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byKey(const ValueKey('text-step-skip')));
    await tester.tap(find.byKey(const ValueKey('text-step-skip')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('1시간 후'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('다음'));
    await tester.tap(find.text('다음'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('기록하기'));
    await tester.tap(find.text('기록하기'));
    await tester.pumpAndSettle();

    expect(repository.savedNotes, hasLength(1));
    expect(scheduler.calls, isEmpty);
  });

  testWidgets(
    'custom reminder stays inline and opens non-draggable time picker',
    (WidgetTester tester) async {
      await tester.pumpWidget(const FuryNoteApp(initialLocale: Locale('ko')));
      await tester.pumpAndSettle();
      await _openRecordTab(tester, label: '기록');

      await tester.tap(find.text('매우 화남'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('직장'));
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.byKey(const ValueKey('text-step-skip')));
      await tester.tap(find.byKey(const ValueKey('text-step-skip')));
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
    await _openRecordTab(tester, label: '기록');

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

  testWidgets(
    'record post actions return to feed and show toast below title bar',
    (WidgetTester tester) async {
      final repository = _FakeRageNoteRepository();

      await tester.pumpWidget(
        FuryNoteApp(
          initialLocale: const Locale('ko'),
          noteRepository: repository,
          feedService: _FakeFeedService(posts: const []),
        ),
      );
      await tester.pumpAndSettle();

      await _openRecordTab(tester, label: '기록');
      await _advanceRecordToPostStep(tester);
      await tester.tap(find.text('그냥 저장만 할게요'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 120));

      expect(find.text('피드'), findsWidgets);
      expect(find.text('기록됐어요'), findsOneWidget);
      expect(repository.savedNotes.single.posted, isFalse);
      _expectToastBelowTitleBar(tester, '기록됐어요');

      await tester.tap(find.text('기록'));
      await tester.pumpAndSettle();
      await _advanceRecordToPostStep(tester);
      await tester.tap(find.text('포스팅하기'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 120));

      expect(find.text('피드'), findsWidgets);
      expect(find.text('포스팅했어요'), findsOneWidget);
      expect(repository.savedNotes.last.posted, isTrue);
      _expectToastBelowTitleBar(tester, '포스팅했어요');
    },
  );

  testWidgets('record action toast stays in the global overlay above drawer', (
    WidgetTester tester,
  ) async {
    final repository = _FakeRageNoteRepository();

    await tester.pumpWidget(
      FuryNoteApp(
        initialLocale: const Locale('ko'),
        noteRepository: repository,
      ),
    );
    await tester.pump();
    await tester.pump();

    await _openRecordTab(tester, label: '기록');
    await _advanceRecordToPostStep(tester);
    await tester.tap(find.text('그냥 저장만 할게요'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 120));

    await tester.tap(find.byTooltip('menu'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    final toastFinder = find.byKey(const ValueKey('bottom-action-toast'));
    expect(find.byType(FuryDrawer), findsOneWidget);
    expect(toastFinder, findsOneWidget);
    expect(
      find.descendant(
        of: find.byKey(const ValueKey('fury-toast-overlay')),
        matching: toastFinder,
      ),
      findsOneWidget,
    );
  });

  testWidgets('stats calendar and selected list render saved notes', (
    WidgetTester tester,
  ) async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day, 9, 30);
    final oldDay = today.subtract(const Duration(days: 40));
    final repository = _FakeRageNoteRepository(
      seedNotes: [
        RageNote(
          id: 1,
          createdAt: today,
          rageLevel: 4,
          rageEmoji: '😡',
          rageLabel: '매우 화남',
          categoryKey: 'work',
          categoryEmoji: '💼',
          categoryLabel: '직장',
          body: '오늘 저장된 기록',
        ),
        RageNote(
          id: 2,
          createdAt: today.subtract(const Duration(days: 1)),
          rageLevel: 2,
          rageEmoji: '😤',
          rageLabel: '화남',
          categoryKey: 'family',
          categoryEmoji: '👨‍👩‍👧',
          categoryLabel: '가족',
          body: '어제 기록',
        ),
        RageNote(
          id: 3,
          createdAt: oldDay,
          rageLevel: 5,
          rageEmoji: '🤬',
          rageLabel: '극대노',
          categoryKey: 'work',
          categoryEmoji: '💼',
          categoryLabel: '직장',
          body: '오래된 기록',
        ),
      ],
    );

    await tester.pumpWidget(
      FuryNoteApp(
        initialLocale: const Locale('ko'),
        noteRepository: repository,
        feedService: _FakeFeedService(posts: const []),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    await tester.tap(find.text('통계'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    expect(
      find.byKey(const ValueKey('stats-intensity-line-chart')),
      findsOneWidget,
    );
    expect(
      find.byKey(const ValueKey('stats-category-pie-chart')),
      findsOneWidget,
    );
    expect(find.text('💼 직장 50%'), findsOneWidget);
    expect(find.text('2'), findsWidgets);

    await tester.tap(find.text('전체'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.text('💼 직장 67%'), findsOneWidget);
    expect(find.text('${oldDay.month}/${oldDay.day}'), findsOneWidget);
    expect(find.text('오늘 저장된 기록'), findsNothing);

    await tester.scrollUntilVisible(
      find.text('달력으로 기록 보기'),
      500,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.tap(find.text('달력으로 기록 보기'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    expect(_headerTitle('Rage Stats'), findsNothing);
    expect(find.text('달력으로 기록 보기'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('오늘 저장된 기록'),
      500,
      scrollable: find.byType(Scrollable).last,
    );
    expect(find.text('오늘 저장된 기록'), findsOneWidget);
    expect(find.text('💼 직장'), findsOneWidget);
    expect(
      find.descendant(
        of: find.byType(FuryPostCard),
        matching: find.text('오늘 저장된 기록'),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: find.byType(FuryPostCard),
        matching: find.text('💼 직장'),
      ),
      findsOneWidget,
    );
    final selectedRecordCard = find.ancestor(
      of: find.text('오늘 저장된 기록'),
      matching: find.byType(FuryPostCard),
    );
    expect(
      find.descendant(
        of: selectedRecordCard,
        matching: find.byType(FuryProfileAvatar),
      ),
      findsNothing,
    );
    expect(
      find.descendant(of: selectedRecordCard, matching: find.text('화난 호랑이')),
      findsNothing,
    );
    expect(
      find.descendant(
        of: selectedRecordCard,
        matching: find.byIcon(Icons.access_time),
      ),
      findsNothing,
    );
    _expectTextAtCardBottomRight(tester, selectedRecordCard, '09:30');
    expect(
      find.ancestor(of: selectedRecordCard, matching: find.byType(Dismissible)),
      findsNothing,
    );

    final deleteIcon = find.descendant(
      of: selectedRecordCard,
      matching: find.byIcon(Icons.delete_outline),
    );
    expect(deleteIcon, findsOneWidget);

    await tester.tap(deleteIcon);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));

    expect(find.text('삭제할까요?'), findsOneWidget);
    await tester.tap(find.text('취소'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));
    expect(find.text('오늘 저장된 기록'), findsOneWidget);

    await tester.tap(deleteIcon);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));
    await tester.tap(find.text('삭제'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.text('오늘 저장된 기록'), findsNothing);
    expect(repository.savedNotes.map((note) => note.id), isNot(contains(1)));
  });

  testWidgets(
    'stats distribution pins default categories and groups extra custom ones',
    (WidgetTester tester) async {
      final now = DateTime.now();
      var id = 1;
      RageNote note({
        required String key,
        required String emoji,
        required String label,
      }) {
        return RageNote(
          id: id++,
          createdAt: now.subtract(Duration(minutes: id)),
          rageLevel: 3,
          rageEmoji: '😠',
          rageLabel: '꽤 화남',
          categoryKey: key,
          categoryEmoji: emoji,
          categoryLabel: label,
          body: '$label 기록',
        );
      }

      final repository = _FakeRageNoteRepository(
        seedNotes: [
          note(key: 'work', emoji: '💼', label: '직장'),
          for (var i = 0; i < 5; i++)
            note(key: 'custom', emoji: '➕', label: '육아'),
          for (var i = 0; i < 4; i++)
            note(key: 'custom', emoji: '➕', label: '주차'),
          for (var i = 0; i < 3; i++)
            note(key: 'custom', emoji: '➕', label: '쇼핑'),
          for (var i = 0; i < 2; i++)
            note(key: 'custom', emoji: '➕', label: '소음'),
          note(key: 'custom', emoji: '➕', label: '날씨'),
          note(key: 'custom', emoji: '➕', label: '게임'),
        ],
      );

      await tester.pumpWidget(
        FuryNoteApp(
          initialLocale: const Locale('ko'),
          noteRepository: repository,
          feedService: _FakeFeedService(posts: const []),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      await tester.tap(find.text('통계'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      for (final label in [
        '💼 직장 6%',
        '➕ 육아 29%',
        '➕ 주차 24%',
        '➕ 쇼핑 18%',
        '➕ 소음 12%',
        '기타 12%',
      ]) {
        expect(find.text(label), findsOneWidget);
      }

      for (final label in [
        '👨‍👩‍👧 가족 0%',
        '💕 연애 0%',
        '🧑 사람 0%',
        '🚗 운전 0%',
      ]) {
        expect(find.text(label), findsNothing);
      }

      expect(find.textContaining('날씨'), findsNothing);
      expect(find.textContaining('게임'), findsNothing);
    },
  );

  testWidgets(
    'stats summary shows every written category with actual metrics',
    (WidgetTester tester) async {
      final now = DateTime.now();
      final repository = _FakeRageNoteRepository(
        seedNotes: [
          RageNote(
            id: 1,
            createdAt: now,
            rageLevel: 4,
            rageEmoji: '😡',
            rageLabel: '매우 화남',
            categoryKey: 'family',
            categoryEmoji: '👨‍👩‍👧',
            categoryLabel: '가족',
            body: '가족 모임에서 서운했다',
            posted: true,
            reminderAt: DateTime.now().add(const Duration(hours: 1)),
          ),
          RageNote(
            id: 2,
            createdAt: now.subtract(const Duration(days: 1)),
            rageLevel: 3,
            rageEmoji: '😠',
            rageLabel: '꽤 화남',
            categoryKey: 'family',
            categoryEmoji: '👨‍👩‍👧',
            categoryLabel: '가족',
            body: '말이 통하지 않았다',
          ),
          RageNote(
            id: 3,
            createdAt: now.subtract(const Duration(days: 2)),
            rageLevel: 5,
            rageEmoji: '🤬',
            rageLabel: '폭발',
            categoryKey: 'work',
            categoryEmoji: '💼',
            categoryLabel: '직장',
            body: '야근이 생겼다',
            posted: true,
          ),
          RageNote(
            id: 4,
            createdAt: now.subtract(const Duration(days: 45)),
            rageLevel: 2,
            rageEmoji: '😤',
            rageLabel: '화남',
            categoryKey: 'custom',
            categoryEmoji: '➕',
            categoryLabel: '육아',
            body: '아침 준비가 힘들었다',
          ),
          RageNote(
            id: 5,
            createdAt: now.subtract(const Duration(days: 46)),
            rageLevel: 1,
            rageEmoji: '😒',
            rageLabel: '살짝 화남',
            categoryKey: 'custom',
            categoryEmoji: '➕',
            categoryLabel: '주차',
            body: '주차 공간이 없었다',
          ),
        ],
      );

      await tester.pumpWidget(
        FuryNoteApp(
          initialLocale: const Locale('ko'),
          noteRepository: repository,
          feedService: _FakeFeedService(posts: const []),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      await tester.tap(find.text('통계'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      await tester.scrollUntilVisible(
        find.text('달력으로 기록 보기'),
        500,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.scrollUntilVisible(
        find.text('분노 보고서 보기'),
        500,
        scrollable: find.byType(Scrollable).first,
      );

      expect(
        tester.getTopLeft(find.text('분노 보고서 보기')).dy,
        greaterThan(tester.getTopLeft(find.text('달력으로 기록 보기')).dy),
      );

      await tester.tap(find.text('분노 보고서 보기'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('분노 보고서'), findsOneWidget);
      expect(find.text('분노 통계'), findsNothing);
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
      expect(find.byIcon(Icons.keyboard_arrow_up), findsOneWidget);
      expect(find.byIcon(Icons.keyboard_arrow_down), findsOneWidget);
      expect(
        find.byKey(const ValueKey('stats-summary-page-view')),
        findsOneWidget,
      );
      expect(find.text('나를 가장 화나게 하는 건 "가족"이었네요'), findsOneWidget);
      expect(find.text('💛'), findsOneWidget);
      expect(find.text('🫶'), findsNothing);
      expect(find.text('괜찮아요. 그럴 수도 있어요.'), findsOneWidget);
      expect(find.text('횟수'), findsOneWidget);
      expect(find.text('카테고리'), findsOneWidget);
      expect(find.text('피드 공유'), findsOneWidget);
      expect(find.text('진정 시도'), findsOneWidget);
      expect(find.text('😡'), findsOneWidget);
      expect(find.text('😡 매우 화남'), findsNothing);
      expect(find.text('결론'), findsOneWidget);
      expect(find.text('2회'), findsOneWidget);
      expect(find.text('40%'), findsOneWidget);

      final nextButtons = find.widgetWithText(FilledButton, '다음');
      expect(nextButtons, findsWidgets);
      await tester.tap(nextButtons.last);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.textContaining('직장'), findsWidgets);
      expect(find.widgetWithText(FilledButton, '이전'), findsWidgets);

      for (final label in ['육아', '주차']) {
        await tester.tap(nextButtons.last);
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 500));

        expect(find.textContaining(label), findsWidgets);
      }
    },
  );
}

Finder _headerTitle(String text) {
  return find.descendant(
    of: find.byType(FuryHeader),
    matching: find.text(text),
  );
}

Future<void> _openRecordTab(
  WidgetTester tester, {
  required String label,
}) async {
  await tester.tap(find.text(label));
  await tester.pumpAndSettle();
}

Future<void> _advanceRecordToPostStep(WidgetTester tester) async {
  await tester.tap(find.text('매우 화남'));
  await tester.pumpAndSettle();
  await tester.tap(find.text('직장'));
  await tester.pumpAndSettle();
  await tester.ensureVisible(find.byKey(const ValueKey('text-step-skip')));
  await tester.tap(find.byKey(const ValueKey('text-step-skip')));
  await tester.pumpAndSettle();
  await tester.ensureVisible(find.byKey(const ValueKey('reminder-step-skip')));
  await tester.tap(find.byKey(const ValueKey('reminder-step-skip')));
  await tester.pumpAndSettle();
  await tester.ensureVisible(find.text('기록하기'));
  await tester.tap(find.text('기록하기'));
  await tester.pumpAndSettle();

  expect(find.text('포스팅하기'), findsOneWidget);
}

void _expectToastBelowTitleBar(WidgetTester tester, String message) {
  expect(find.text(message), findsOneWidget);

  final toastFinder = find.byKey(const ValueKey('bottom-action-toast'));
  final textFinder = find.descendant(
    of: toastFinder,
    matching: find.text(message),
  );
  final toastTop = tester.getTopLeft(toastFinder).dy;
  final headerBottom = tester.getBottomLeft(find.byType(FuryHeader)).dy;
  final toastText = tester.widget<Text>(textFinder);

  expect(toastFinder, findsOneWidget);
  expect(toastText.style?.color, FuryColors.toastText);
  expect(toastTop, headerBottom + 12);
}

void _expectTextAtCardBottomRight(
  WidgetTester tester,
  Finder cardFinder,
  String text,
) {
  final timeFinder = find.descendant(of: cardFinder, matching: find.text(text));
  expect(timeFinder, findsOneWidget);

  final cardRect = tester.getRect(cardFinder);
  final timeRect = tester.getRect(timeFinder);
  expect(timeRect.right, greaterThan(cardRect.right - 72));
  expect(timeRect.bottom, greaterThan(cardRect.bottom - 32));
}

class _FakeRageNoteRepository extends RageNoteRepository {
  _FakeRageNoteRepository({List<RageNote> seedNotes = const []})
    : _notes = List<RageNote>.of(seedNotes),
      _nextId =
          seedNotes
              .map((note) => note.id ?? 0)
              .fold<int>(0, (max, id) => id > max ? id : max) +
          1;

  final List<RageNote> _notes;
  int _nextId;

  List<RageNote> get savedNotes => List<RageNote>.unmodifiable(_notes);

  @override
  Future<int> insert(RageNote note) async {
    final id = _nextId++;
    _notes.add(note.copyWith(id: id));
    return id;
  }

  @override
  Future<List<RageNote>> getAll() async => List<RageNote>.of(_notes.reversed);

  @override
  Future<void> markPosted(int id) async {
    final index = _notes.indexWhere((note) => note.id == id);
    if (index == -1) {
      return;
    }
    _notes[index] = _notes[index].copyWith(posted: true);
  }

  @override
  Future<void> deleteById(int id) async {
    _notes.removeWhere((note) => note.id == id);
  }

  @override
  Future<void> close() async {}
}

class _FakeVoiceRecorder implements FuryVoiceRecorder {
  int startCount = 0;
  int stopCount = 0;

  @override
  Future<bool> hasPermission() async => true;

  @override
  Future<void> startNew() async {
    startCount += 1;
  }

  @override
  Future<String?> stop() async {
    stopCount += 1;
    return 'voice/fake_$stopCount.m4a';
  }

  @override
  Future<void> dispose() async {}
}

class _FakeReminderScheduler implements ReminderScheduler {
  final List<({int id, DateTime scheduledAt, String body})> calls = [];

  @override
  Future<void> initialize() async {}

  @override
  Future<void> scheduleRageReminder({
    required int id,
    required DateTime scheduledAt,
    required String body,
  }) async {
    calls.add((id: id, scheduledAt: scheduledAt, body: body));
  }
}

class _FakeReminderNotificationTapSource
    implements ReminderNotificationTapSource {
  final StreamController<ReminderNotificationTap> _controller =
      StreamController<ReminderNotificationTap>.broadcast();
  ReminderNotificationTap? initialTap;

  @override
  Stream<ReminderNotificationTap> get reminderNotificationTaps =>
      _controller.stream;

  @override
  ReminderNotificationTap? takeInitialReminderNotificationTap() {
    final tap = initialTap;
    initialTap = null;
    return tap;
  }

  void emit(ReminderNotificationTap tap) {
    _controller.add(tap);
  }

  Future<void> dispose() => _controller.close();
}

class _FakeCommentPushTapSource implements CommentPushTapSource {
  final StreamController<CommentPushTap> _controller =
      StreamController<CommentPushTap>.broadcast();
  CommentPushTap? initialTap;

  @override
  Stream<CommentPushTap> get commentPushTaps => _controller.stream;

  @override
  CommentPushTap? takeInitialCommentPushTap() {
    final tap = initialTap;
    initialTap = null;
    return tap;
  }

  void emit(CommentPushTap tap) {
    _controller.add(tap);
  }

  Future<void> dispose() => _controller.close();
}

class _FakeFeedService implements FeedService {
  _FakeFeedService({
    required List<FeedPost> posts,
    Map<String, List<FeedComment>> comments = const {},
    this.createCommentError,
  }) : _posts = List<FeedPost>.of(posts),
       _comments = comments.map(
         (postId, comments) => MapEntry(postId, List<FeedComment>.of(comments)),
       );

  final List<FeedPost> _posts;
  final Map<String, List<FeedComment>> _comments;
  final ApiException? createCommentError;

  @override
  Future<({bool hasMore, String? nextCursor, List<FeedPost> posts})> listPosts({
    String? cursor,
    int size = 10,
    bool mineOnly = false,
  }) async {
    return (
      posts: _posts.where((post) => !mineOnly || post.isMine).toList(),
      nextCursor: null,
      hasMore: false,
    );
  }

  @override
  Future<List<FeedComment>> listComments(String postId) async {
    return List<FeedComment>.of(_comments[postId] ?? const []);
  }

  @override
  Future<String> createPost({
    required String nickname,
    String? profileCode,
    required int rageLevel,
    required String category,
    String? text,
  }) async {
    return 'new-post';
  }

  @override
  Future<FeedComment> createComment({
    required String postId,
    required String nickname,
    String? profileCode,
    required String text,
  }) async {
    if (createCommentError case final error?) throw error;
    final comment = FeedComment(
      commentId: 'new-comment',
      nickname: nickname,
      profileCode: profileCode,
      text: text,
      isMine: true,
      createdAt: DateTime.now(),
    );
    _comments.putIfAbsent(postId, () => []).add(comment);
    return comment;
  }

  @override
  Future<void> deleteComment({
    required String postId,
    required String commentId,
  }) async {
    _comments[postId]?.removeWhere((comment) => comment.commentId == commentId);
  }

  @override
  Future<void> deletePost(String postId) async {
    _posts.removeWhere((post) => post.postId == postId);
  }

  @override
  Future<({bool isLiked, int likeCount})> toggleLike(String postId) async {
    return (isLiked: true, likeCount: 1);
  }
}
