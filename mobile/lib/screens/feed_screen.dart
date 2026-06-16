import 'package:flutter/material.dart';
import 'package:fury_note/l10n/app_localizations.dart';
import 'package:fury_note/src/api/feed_service.dart';
import '../main.dart';
import '../widgets/shared_widgets.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

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
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            tabs: const [
              Tab(text: '전체 피드'),
              Tab(text: '내가 쓴 피드'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              _FeedTabView(mineOnly: false),
              _FeedTabView(mineOnly: true),
            ],
          ),
        ),
      ],
    );
  }
}

class _FeedTabView extends StatefulWidget {
  const _FeedTabView({required this.mineOnly});
  final bool mineOnly;

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

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _loadInitial();
    _scrollController.addListener(_onScroll);
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
      final page = await FeedService.instance.listPosts(
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
      final page = await FeedService.instance.listPosts(
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
      await FeedService.instance.deletePost(postId);
      if (!mounted) return;
      setState(() => _posts.removeWhere((p) => p.postId == postId));
    } catch (_) {}
  }

  Future<void> _toggleLike(String postId) async {
    try {
      final result = await FeedService.instance.toggleLike(postId);
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
    } catch (_) {}
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
            const Text(
              '피드를 불러오지 못했어요.',
              style: TextStyle(color: FuryColors.muted),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: _loadInitial,
              child: const Text('다시 시도'),
            ),
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
              widget.mineOnly
                  ? '아직 작성한 피드가 없어요.\n첫 번째 분노를 공유해보세요!'
                  : '아직 피드가 없어요.\n첫 번째로 분노를 공유해보세요!',
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
    this.onDelete,
    super.key,
  });

  final FeedPost post;
  final String likeLabel;
  final String commentLabel;
  final VoidCallback onToggleLike;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FuryPostCard(
          emoji: rageEmoji(post.rageLevel),
          nickname: post.nickname,
          category: categoryDisplay(post.category),
          text: post.text ?? '',
          avatarBytes: post.avatarBytes,
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

class FuryPostAction extends StatelessWidget {
  const FuryPostAction({
    required this.icon,
    required this.label,
    this.onPressed,
    this.isActive = false,
    super.key,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 17),
      label: Text(label),
      style: TextButton.styleFrom(
        foregroundColor: isActive ? FuryColors.red : FuryColors.muted,
        minimumSize: const Size(0, 36),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}
