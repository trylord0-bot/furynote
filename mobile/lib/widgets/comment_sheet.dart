import 'package:flutter/material.dart';
import 'package:fury_note/l10n/app_localizations.dart';
import 'package:fury_note/main.dart';
import 'package:fury_note/src/api/feed_service.dart';
import 'package:fury_note/src/profile/app_profile.dart';

Future<void> showCommentSheet(
  BuildContext context, {
  required String postId,
  required int commentCount,
  required void Function(int) onCountChanged,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: FuryColors.panel,
    barrierColor: Colors.black.withValues(alpha: 0.65),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (ctx) => CommentSheet(
      postId: postId,
      initialCommentCount: commentCount,
      onCountChanged: onCountChanged,
    ),
  );
}

class CommentSheet extends StatefulWidget {
  const CommentSheet({
    required this.postId,
    required this.initialCommentCount,
    required this.onCountChanged,
    super.key,
  });

  final String postId;
  final int initialCommentCount;
  final void Function(int) onCountChanged;

  @override
  State<CommentSheet> createState() => _CommentSheetState();
}

class _CommentSheetState extends State<CommentSheet> {
  final _textController = TextEditingController();
  final _scrollController = ScrollController();
  List<FeedComment> _comments = [];
  bool _loading = true;
  bool _sending = false;
  late int _commentCount;

  @override
  void initState() {
    super.initState();
    _commentCount = widget.initialCommentCount;
    _loadComments();
  }

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadComments() async {
    setState(() => _loading = true);
    try {
      final comments = await FeedService.instance.listComments(widget.postId);
      if (mounted) {
        setState(() {
          _comments = comments;
          _loading = false;
        });
      }
    } catch (_) {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _sendComment() async {
    final text = _textController.text.trim();
    if (text.isEmpty || _sending) return;
    final l10n = AppLocalizations.of(context);
    final nickname = AppProfileController.instance
        .displayName(fallback: l10n.profileName);
    setState(() => _sending = true);
    try {
      final comment = await FeedService.instance.createComment(
        postId: widget.postId,
        nickname: nickname,
        text: text,
      );
      if (!mounted) return;
      _textController.clear();
      setState(() {
        _comments.add(comment);
        _commentCount++;
        _sending = false;
      });
      widget.onCountChanged(_commentCount);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
          );
        }
      });
    } catch (_) {
      if (mounted) setState(() => _sending = false);
    }
  }

  Future<void> _confirmDelete(FeedComment comment) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: FuryColors.panel,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: FuryColors.border),
        ),
        title: const Text(
          '댓글 삭제',
          style: TextStyle(
            color: FuryColors.text,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        content: const Text(
          '이 댓글을 삭제할까요?',
          style: TextStyle(color: FuryColors.muted),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('취소'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: TextButton.styleFrom(foregroundColor: FuryColors.red),
            child: const Text('삭제'),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;
    try {
      await FeedService.instance.deleteComment(
        postId: widget.postId,
        commentId: comment.commentId,
      );
      if (!mounted) return;
      setState(() {
        _comments.removeWhere((c) => c.commentId == comment.commentId);
        _commentCount--;
      });
      widget.onCountChanged(_commentCount);
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return SizedBox(
      height: screenHeight * 0.75,
      child: Column(
        children: [
          // Drag handle
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 6),
            width: 36,
            height: 4,
            decoration: BoxDecoration(
              color: FuryColors.faint,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 4, 14, 10),
            child: Row(
              children: [
                Text(
                  '댓글 $_commentCount개',
                  style: const TextStyle(
                    color: FuryColors.text,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => Navigator.pop(context, _commentCount),
                  icon: const Icon(Icons.close, color: FuryColors.muted, size: 22),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          ),
          const Divider(color: FuryColors.border, height: 1),
          // Comment list
          Expanded(
            child: _loading
                ? const Center(
                    child: CircularProgressIndicator(color: FuryColors.red),
                  )
                : _comments.isEmpty
                    ? const Center(
                        child: Text(
                          '아직 댓글이 없어요\n첫 번째 댓글을 남겨보세요 💬',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: FuryColors.muted,
                            height: 1.6,
                          ),
                        ),
                      )
                    : ListView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        itemCount: _comments.length,
                        itemBuilder: (context, index) {
                          final comment = _comments[index];
                          return _CommentItem(
                            comment: comment,
                            onDelete: comment.isMine
                                ? () => _confirmDelete(comment)
                                : null,
                          );
                        },
                      ),
          ),
          const Divider(color: FuryColors.border, height: 1),
          // Input row
          Padding(
            padding: EdgeInsets.fromLTRB(14, 10, 14, 10 + bottomInset),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: FuryColors.red.withValues(alpha: 0.18),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text('🔥', style: TextStyle(fontSize: 16)),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _textController,
                    maxLength: 200,
                    maxLines: 4,
                    minLines: 1,
                    textInputAction: TextInputAction.newline,
                    style: const TextStyle(
                      color: FuryColors.text,
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      hintText: '댓글을 입력하세요...',
                      hintStyle: const TextStyle(color: FuryColors.faint),
                      counterText: '',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: FuryColors.border),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: FuryColors.border),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: FuryColors.red),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      filled: true,
                      fillColor: FuryColors.panelAlt,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: _sendComment,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: _sending ? FuryColors.border : FuryColors.red,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: _sending
                        ? const Center(
                            child: SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: FuryColors.text,
                              ),
                            ),
                          )
                        : const Icon(
                            Icons.send_rounded,
                            color: Colors.white,
                            size: 17,
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CommentItem extends StatelessWidget {
  const _CommentItem({required this.comment, this.onDelete});

  final FeedComment comment;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onDelete,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: FuryColors.red.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text('🔥', style: TextStyle(fontSize: 15)),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          comment.nickname,
                          style: const TextStyle(
                            color: FuryColors.muted,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _relativeTime(comment.createdAt),
                        style: const TextStyle(
                          color: FuryColors.faint,
                          fontSize: 10,
                        ),
                      ),
                      if (onDelete != null) ...[
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: onDelete,
                          child: const Icon(
                            Icons.delete_outline,
                            size: 15,
                            color: FuryColors.faint,
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 3),
                  Text(
                    comment.text,
                    style: const TextStyle(
                      color: Color(0xFFCCCCCC),
                      fontSize: 13,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String _relativeTime(DateTime dt) {
  final diff = DateTime.now().difference(dt);
  if (diff.inMinutes < 1) return '방금';
  if (diff.inMinutes < 60) return '${diff.inMinutes}분 전';
  if (diff.inHours < 24) return '${diff.inHours}시간 전';
  return '${diff.inDays}일 전';
}
