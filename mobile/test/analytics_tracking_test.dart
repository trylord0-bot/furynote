import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fury_note/main.dart';
import 'package:fury_note/src/analytics/app_analytics.dart';
import 'package:fury_note/src/api/feed_service.dart';
import 'package:fury_note/src/notes/rage_note.dart';
import 'package:fury_note/src/notes/rage_note_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('tracks shell screens as the bottom tabs change', (tester) async {
    final analytics = _RecordingAnalytics();

    await tester.pumpWidget(
      FuryNoteApp(
        initialLocale: const Locale('ko'),
        analytics: analytics,
        feedService: _FakeFeedService(posts: const []),
        noteRepository: _FakeRageNoteRepository(),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('기록'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('통계'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('진정'));
    await tester.pumpAndSettle();

    expect(analytics.screenNames, ['feed', 'record', 'stats', 'calm']);
  });

  testWidgets('tracks the record funnel through saving and posting', (
    tester,
  ) async {
    final analytics = _RecordingAnalytics();

    await tester.pumpWidget(
      FuryNoteApp(
        initialLocale: const Locale('ko'),
        analytics: analytics,
        feedService: _FakeFeedService(posts: const []),
        noteRepository: _FakeRageNoteRepository(),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('기록'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('매우 화남'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('직장'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byKey(const ValueKey('text-step-skip')));
    await tester.tap(find.byKey(const ValueKey('text-step-skip')));
    await tester.pumpAndSettle();
    await tester.ensureVisible(
      find.byKey(const ValueKey('reminder-step-skip')),
    );
    await tester.tap(find.byKey(const ValueKey('reminder-step-skip')));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('기록하기'));
    await tester.tap(find.text('기록하기'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('포스팅하기'));
    await tester.pumpAndSettle();

    expect(
      analytics.events
          .where((event) => event.name == 'record_funnel_step')
          .map((event) => event.parameters['step']),
      containsAllInOrder([
        'intensity',
        'category',
        'content',
        'reminder',
        'save',
        'post',
      ]),
    );
    expect(
      analytics.events.where((event) => event.name == 'record_saved'),
      isNotEmpty,
    );
    expect(
      analytics.events.where((event) => event.name == 'feed_post_created'),
      isNotEmpty,
    );
  });

  testWidgets('tracks feed comment and like actions', (tester) async {
    final analytics = _RecordingAnalytics();
    final feedService = _FakeFeedService(
      posts: [
        FeedPost(
          postId: 'post-1',
          nickname: '테스터',
          rageLevel: 4,
          category: 'work',
          text: '분석할 피드',
          likeCount: 2,
          commentCount: 0,
          isLiked: false,
          isMine: false,
          createdAt: DateTime.now(),
        ),
      ],
    );

    await tester.pumpWidget(
      FuryNoteApp(
        initialLocale: const Locale('ko'),
        analytics: analytics,
        feedService: feedService,
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('공감 2'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('댓글 0'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), '좋은 댓글');
    await tester.tap(find.byKey(const ValueKey('comment-send-button')));
    await tester.pumpAndSettle();

    expect(
      analytics.events.map((event) => event.name),
      containsAll(['feed_like_toggled', 'comments_opened', 'comment_created']),
    );
  });
}

class _RecordingAnalytics implements AppAnalytics {
  final List<String> screenNames = [];
  final List<_RecordedEvent> events = [];

  @override
  Future<void> logEvent(String name, {Map<String, Object>? parameters}) async {
    events.add(_RecordedEvent(name, parameters ?? const {}));
  }

  @override
  Future<void> logScreenView(
    String screenName, {
    String? screenClass,
    Map<String, Object>? parameters,
  }) async {
    screenNames.add(screenName);
  }
}

class _RecordedEvent {
  const _RecordedEvent(this.name, this.parameters);

  final String name;
  final Map<String, Object> parameters;
}

class _FakeRageNoteRepository extends RageNoteRepository {
  final List<RageNote> _notes = [];
  int _nextId = 1;

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
    if (index != -1) {
      _notes[index] = _notes[index].copyWith(posted: true);
    }
  }

  @override
  Future<void> close() async {}
}

class _FakeFeedService implements FeedService {
  _FakeFeedService({required List<FeedPost> posts})
    : _posts = List<FeedPost>.of(posts);

  final List<FeedPost> _posts;
  final Map<String, List<FeedComment>> _comments = {};

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
  Future<void> deletePost(String postId) async {}

  @override
  Future<({bool isLiked, int likeCount})> toggleLike(String postId) async {
    return (isLiked: true, likeCount: 3);
  }

  @override
  Future<List<FeedComment>> listComments(String postId) async {
    return List<FeedComment>.of(_comments[postId] ?? const []);
  }

  @override
  Future<FeedComment> createComment({
    required String postId,
    required String nickname,
    String? profileCode,
    required String text,
  }) async {
    final comment = FeedComment(
      commentId: 'comment-1',
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
  }) async {}
}
