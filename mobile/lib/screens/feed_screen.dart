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

class _FeedScreenState extends State<FeedScreen> {
  List<FeedPost> _posts = [];
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  Future<void> _loadPosts() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final posts = await FeedService.instance.listPosts();
      if (mounted) {
        setState(() {
          _posts = posts;
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

  Future<void> _deletePost(String postId) async {
    try {
      await FeedService.instance.deletePost(postId);
      if (!mounted) return;
      setState(() {
        _posts.removeWhere((p) => p.postId == postId);
      });
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
              '피드를 불러오지 못했어요.',
              style: const TextStyle(color: FuryColors.muted),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: _loadPosts,
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
              '아직 피드가 없어요.\n첫 번째로 분노를 공유해보세요!',
              textAlign: TextAlign.center,
              style: const TextStyle(color: FuryColors.muted, height: 1.6),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _loadPosts,
      color: FuryColors.red,
      backgroundColor: FuryColors.panel,
      child: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: _posts.length,
        itemBuilder: (context, index) {
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
                icon: post.isLiked ? Icons.favorite : Icons.favorite_border,
                label: '$likeLabel ${post.likeCount}',
                isActive: post.isLiked,
                onPressed: onToggleLike,
              ),
              FuryPostAction(
                icon: Icons.chat_bubble_outline,
                label: '$commentLabel ${post.commentCount}',
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
