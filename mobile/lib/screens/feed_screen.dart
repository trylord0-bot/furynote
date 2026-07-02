import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fury_note/l10n/app_localizations.dart';
import 'package:fury_note/l10n/l10n_extensions.dart';
import 'package:fury_note/src/analytics/app_analytics.dart';
import 'package:fury_note/src/api/api_client.dart';
import 'package:fury_note/src/api/api_error_messages.dart';
import 'package:fury_note/src/api/feed_service.dart';
import '../main.dart';
import '../widgets/comment_sheet.dart';
import '../widgets/shared_widgets.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({
    this.feedService,
    this.pendingCommentPostId,
    this.pendingCommentOpenToken = 0,
    this.analytics = const NoopAppAnalytics(),
    super.key,
  });

  final FeedService? feedService;
  final String? pendingCommentPostId;
  final int pendingCommentOpenToken;
  final AppAnalytics analytics;

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void didUpdateWidget(covariant FeedScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.pendingCommentOpenToken != oldWidget.pendingCommentOpenToken &&
        widget.pendingCommentPostId != null) {
      _tabController.index = 0;
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Column(
      children: [
        Container(
          color: FuryColors.chrome,
          child: TabBar(
            controller: _tabController,
            indicatorColor: FuryColors.red,
            indicatorWeight: 2,
            labelColor: FuryColors.text,
            unselectedLabelColor: FuryColors.muted,
            dividerColor: FuryColors.border,
            labelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            tabs: [
              Tab(text: l10n.feedAllTab),
              Tab(text: l10n.feedMineTab),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _FeedTabView(
                mineOnly: false,
                feedService: widget.feedService,
                pendingCommentPostId: widget.pendingCommentPostId,
                pendingCommentOpenToken: widget.pendingCommentOpenToken,
                analytics: widget.analytics,
              ),
              _FeedTabView(
                mineOnly: true,
                feedService: widget.feedService,
                analytics: widget.analytics,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FeedTabView extends StatefulWidget {
  const _FeedTabView({
    required this.mineOnly,
    this.feedService,
    this.pendingCommentPostId,
    this.pendingCommentOpenToken = 0,
    this.analytics = const NoopAppAnalytics(),
  });

  final bool mineOnly;
  final FeedService? feedService;
  final String? pendingCommentPostId;
  final int pendingCommentOpenToken;
  final AppAnalytics analytics;

  @override
  State<_FeedTabView> createState() => _FeedTabViewState();
}

class _FeedTabViewState extends State<_FeedTabView>
    with AutomaticKeepAliveClientMixin {
  final _scrollController = ScrollController();
  List<FeedPost> _posts = [];
  String? _nextCursor;
  bool _hasMore = true;
  bool _loading = true;
  bool _loadingMore = false;
  String? _error;
  int _handledCommentOpenToken = 0;
  bool _openingPendingComments = false;

  FeedService get _feedService => widget.feedService ?? FeedService.instance;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _loadInitial();
    _scrollController.addListener(_onScroll);
  }

  @override
  void didUpdateWidget(covariant _FeedTabView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.pendingCommentOpenToken != oldWidget.pendingCommentOpenToken ||
        widget.pendingCommentPostId != oldWidget.pendingCommentPostId) {
      _schedulePendingCommentOpen();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      _loadMore();
    }
  }

  Future<void> _loadInitial() async {
    setState(() {
      _loading = true;
      _error = null;
      _posts = [];
      _nextCursor = null;
      _hasMore = true;
    });
    try {
      final page = await _feedService.listPosts(
        size: 10,
        mineOnly: widget.mineOnly,
      );
      if (mounted) {
        setState(() {
          _posts = page.posts;
          _nextCursor = page.nextCursor;
          _hasMore = page.hasMore;
          _loading = false;
        });
        _schedulePendingCommentOpen();
      }
    } on ApiException catch (e) {
      if (mounted) {
        setState(() {
          _loading = false;
          _error = localizedApiErrorMessage(AppLocalizations.of(context), e);
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _loading = false;
          _error = e.toString();
        });
      }
    }
  }

  Future<void> _loadMore() async {
    if (_loadingMore || !_hasMore || _nextCursor == null) return;
    setState(() => _loadingMore = true);
    try {
      final page = await _feedService.listPosts(
        cursor: _nextCursor,
        size: 10,
        mineOnly: widget.mineOnly,
      );
      if (mounted) {
        setState(() {
          _posts.addAll(page.posts);
          _nextCursor = page.nextCursor;
          _hasMore = page.hasMore;
          _loadingMore = false;
        });
      }
    } catch (_) {
      if (mounted) setState(() => _loadingMore = false);
    }
  }

  Future<void> _deletePost(String postId) async {
    try {
      await _feedService.deletePost(postId);
      if (!mounted) return;
      setState(() => _posts.removeWhere((p) => p.postId == postId));
      unawaited(
        widget.analytics.logEvent(
          'feed_post_deleted',
          parameters: {'post_id': postId},
        ),
      );
    } catch (_) {}
  }

  Future<void> _toggleLike(String postId) async {
    try {
      final result = await _feedService.toggleLike(postId);
      if (!mounted) return;
      setState(() {
        final idx = _posts.indexWhere((p) => p.postId == postId);
        if (idx >= 0) {
          _posts[idx] = _posts[idx].copyWith(
            isLiked: result.isLiked,
            likeCount: result.likeCount,
          );
        }
      });
      unawaited(
        widget.analytics.logEvent(
          'feed_like_toggled',
          parameters: {
            'post_id': postId,
            'is_liked': result.isLiked,
            'like_count': result.likeCount,
          },
        ),
      );
    } catch (_) {}
  }

  Future<void> _openComments(FeedPost post) async {
    await _openCommentsForPost(
      postId: post.postId,
      commentCount: post.commentCount,
      post: post,
    );
  }

  Future<void> _openCommentsForPost({
    required String postId,
    required int commentCount,
    FeedPost? post,
  }) async {
    unawaited(
      widget.analytics.logEvent(
        'comments_opened',
        parameters: {
          'post_id': postId,
          'initial_comment_count': commentCount,
          'source': post == null ? 'push_or_deep_link' : 'feed',
        },
      ),
    );
    await showCommentSheet(
      context,
      postId: postId,
      commentCount: commentCount,
      postNickname: post?.nickname,
      postProfileCode: post?.profileCode,
      postAvatarBytes: post?.avatarBytes,
      postText: post?.text,
      postRageLevel: post?.rageLevel,
      postCategory: post?.category,
      feedService: _feedService,
      analytics: widget.analytics,
      onCountChanged: (count) {
        if (!mounted) return;
        setState(() {
          final idx = _posts.indexWhere((p) => p.postId == postId);
          if (idx >= 0) {
            _posts[idx] = _posts[idx].copyWith(commentCount: count);
          }
        });
      },
    );
  }

  void _schedulePendingCommentOpen() {
    final postId = widget.pendingCommentPostId;
    final token = widget.pendingCommentOpenToken;
    if (widget.mineOnly ||
        postId == null ||
        token == 0 ||
        token == _handledCommentOpenToken ||
        _openingPendingComments) {
      return;
    }

    _handledCommentOpenToken = token;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        unawaited(_openPendingComments(postId));
      }
    });
  }

  Future<void> _openPendingComments(String postId) async {
    if (_openingPendingComments || !mounted) {
      return;
    }

    _openingPendingComments = true;
    try {
      var post = _findPost(postId);
      if (post == null) {
        await _loadInitial();
        if (!mounted) return;
        post = _findPost(postId);
      }
      await _openCommentsForPost(
        postId: postId,
        commentCount: post?.commentCount ?? 0,
        post: post,
      );
    } finally {
      _openingPendingComments = false;
    }
  }

  FeedPost? _findPost(String postId) {
    for (final post in _posts) {
      if (post.postId == postId) {
        return post;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final l10n = AppLocalizations.of(context);

    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.wifi_off, color: FuryColors.muted, size: 40),
            const SizedBox(height: 12),
            Text(
              l10n.feedLoadFailed,
              style: const TextStyle(color: FuryColors.muted),
            ),
            const SizedBox(height: 12),
            OutlinedButton(onPressed: _loadInitial, child: Text(l10n.retry)),
          ],
        ),
      );
    }

    if (_posts.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('📮', style: TextStyle(fontSize: 40)),
            const SizedBox(height: 12),
            Text(
              widget.mineOnly ? l10n.feedEmptyMine : l10n.feedEmptyAll,
              textAlign: TextAlign.center,
              style: const TextStyle(color: FuryColors.muted, height: 1.6),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _loadInitial,
      color: FuryColors.red,
      backgroundColor: FuryColors.panel,
      child: ListView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.all(20),
        itemCount: _posts.length + (_hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == _posts.length) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            );
          }
          final post = _posts[index];
          return _FeedPostItem(
            key: ValueKey(post.postId),
            post: post,
            likeLabel: l10n.like,
            commentLabel: l10n.comment,
            onToggleLike: () => _toggleLike(post.postId),
            onComment: () => _openComments(post),
            onDelete: post.isMine ? () => _deletePost(post.postId) : null,
          );
        },
      ),
    );
  }
}

class _FeedPostItem extends StatelessWidget {
  const _FeedPostItem({
    required this.post,
    required this.likeLabel,
    required this.commentLabel,
    required this.onToggleLike,
    required this.onComment,
    this.onDelete,
    super.key,
  });

  final FeedPost post;
  final String likeLabel;
  final String commentLabel;
  final VoidCallback onToggleLike;
  final VoidCallback onComment;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FuryPostCard(
          emoji: rageEmoji(post.rageLevel),
          nickname: post.nickname,
          profileCode: post.profileCode,
          category: l10n.categoryDisplay(post.category),
          text: post.text ?? '',
          avatarBytes: post.avatarBytes,
          createdTimeLabel: relativeTime(context, post.createdAt),
          isMine: post.isMine,
          onDelete: onDelete,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 18),
          child: Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              FuryPostAction(
                icon: Icons.chat_bubble_outline,
                label: '$commentLabel ${post.commentCount}',
                onPressed: onComment,
              ),
              if (!post.isMine)
                FuryPostAction(
                  icon: post.isLiked ? Icons.favorite : Icons.favorite_border,
                  label: '$likeLabel ${post.likeCount}',
                  isActive: post.isLiked,
                  onPressed: onToggleLike,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
