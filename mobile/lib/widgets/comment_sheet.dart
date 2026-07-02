import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fury_note/l10n/l10n_extensions.dart';
import 'package:fury_note/main.dart';
import 'package:fury_note/src/analytics/app_analytics.dart';
import 'package:fury_note/src/api/api_client.dart';
import 'package:fury_note/src/api/api_error_messages.dart';
import 'package:fury_note/src/api/feed_service.dart';
import 'package:fury_note/src/profile/app_profile.dart';
import 'package:fury_note/widgets/shared_widgets.dart';

Future<void> showCommentSheet(
  BuildContext context, {
  required String postId,
  required int commentCount,
  String? postNickname,
  String? postProfileCode,
  List<int>? postAvatarBytes,
  String? postText,
  int? postRageLevel,
  String? postCategory,
  FeedService? feedService,
  AppAnalytics analytics = const NoopAppAnalytics(),
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
      postNickname: postNickname,
      postProfileCode: postProfileCode,
      postAvatarBytes: postAvatarBytes,
      postText: postText,
      postRageLevel: postRageLevel,
      postCategory: postCategory,
      feedService: feedService,
      analytics: analytics,
      onCountChanged: onCountChanged,
    ),
  );
}

class CommentSheet extends StatefulWidget {
  const CommentSheet({
    required this.postId,
    required this.initialCommentCount,
    required this.onCountChanged,
    this.postNickname,
    this.postProfileCode,
    this.postAvatarBytes,
    this.postText,
    this.postRageLevel,
    this.postCategory,
    this.feedService,
    this.analytics = const NoopAppAnalytics(),
    super.key,
  });

  final String postId;
  final int initialCommentCount;
  final void Function(int) onCountChanged;
  final String? postNickname;
  final String? postProfileCode;
  final List<int>? postAvatarBytes;
  final String? postText;
  final int? postRageLevel;
  final String? postCategory;
  final FeedService? feedService;
  final AppAnalytics analytics;

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
  FeedService get _feedService => widget.feedService ?? FeedService.instance;

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
      final comments = await _feedService.listComments(widget.postId);
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
    final l10n = resolveL10n(context);
    final nickname = AppProfileController.instance.displayName(
      fallback: l10n.profileName,
    );
    final profileCode = AppProfileController.instance.profileCode;
    setState(() => _sending = true);
    try {
      final comment = await _feedService.createComment(
        postId: widget.postId,
        nickname: nickname,
        profileCode: profileCode,
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
      unawaited(
        widget.analytics.logEvent(
          'comment_created',
          parameters: {
            'post_id': widget.postId,
            'comment_count': _commentCount,
            'text_length': text.length,
          },
        ),
      );
      FurySnackBar.show(context, l10n.commentPostedToast);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
          );
        }
      });
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() => _sending = false);
      FurySnackBar.show(
        context,
        localizedApiErrorMessage(l10n, e),
        isError: true,
      );
    } catch (_) {
      if (!mounted) return;
      setState(() => _sending = false);
      FurySnackBar.show(context, l10n.commentSendFailedToast, isError: true);
    }
  }

  Future<void> _confirmDelete(FeedComment comment) async {
    final l10n = resolveL10n(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: FuryColors.panel,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: FuryColors.border),
        ),
        title: Text(
          l10n.commentDeleteTitle,
          style: const TextStyle(
            color: FuryColors.text,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        content: Text(
          l10n.commentDeleteContent,
          style: const TextStyle(color: FuryColors.muted),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: TextButton.styleFrom(foregroundColor: FuryColors.red),
            child: Text(l10n.delete),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;
    try {
      await _feedService.deleteComment(
        postId: widget.postId,
        commentId: comment.commentId,
      );
      if (!mounted) return;
      setState(() {
        _comments.removeWhere((c) => c.commentId == comment.commentId);
        _commentCount--;
      });
      widget.onCountChanged(_commentCount);
      unawaited(
        widget.analytics.logEvent(
          'comment_deleted',
          parameters: {
            'post_id': widget.postId,
            'comment_count': _commentCount,
          },
        ),
      );
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    final postRageLevel = widget.postRageLevel;
    final postCategory = widget.postCategory;
    final showPostSummary = postRageLevel != null && postCategory != null;
    final l10n = resolveL10n(context);

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
                  l10n.commentsCount(_commentCount),
                  style: const TextStyle(
                    color: FuryColors.text,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => Navigator.pop(context, _commentCount),
                  icon: const Icon(
                    Icons.close,
                    color: FuryColors.muted,
                    size: 22,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          ),
          const Divider(color: FuryColors.border, height: 1),
          if (showPostSummary) ...[
            _SourcePostSummary(
              nickname: widget.postNickname,
              profileCode: widget.postProfileCode,
              avatarBytes: widget.postAvatarBytes,
              text: widget.postText ?? '',
              emoji: rageEmoji(postRageLevel),
              category: l10n.categoryDisplay(postCategory),
            ),
            const Divider(color: FuryColors.border, height: 1),
          ],
          // Comment list
          Expanded(
            child: _loading
                ? const Center(
                    child: CircularProgressIndicator(color: FuryColors.red),
                  )
                : _comments.isEmpty
                ? Center(
                    child: Text(
                      l10n.commentsEmpty,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const FuryProfileAvatar(
                  key: ValueKey('comment-input-avatar'),
                  size: 32,
                  borderRadius: 10,
                  fallbackFontSize: 16,
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
                      hintText: l10n.commentInputHint,
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
                  key: const ValueKey('comment-send-button'),
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

class _SourcePostSummary extends StatelessWidget {
  const _SourcePostSummary({
    required this.nickname,
    required this.profileCode,
    required this.avatarBytes,
    required this.text,
    required this.emoji,
    required this.category,
  });

  final String? nickname;
  final String? profileCode;
  final List<int>? avatarBytes;
  final String text;
  final String emoji;
  final String category;

  @override
  Widget build(BuildContext context) {
    final displayText = text.trim();

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: FuryColors.panelAlt,
          border: Border.all(color: FuryColors.border),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                FuryProfileAvatar(
                  size: 28,
                  borderRadius: 10,
                  fallbackFontSize: 15,
                  bytes: avatarBytes,
                  useProfileFallback: false,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    profileDisplayName(
                      nickname: nickname ?? '',
                      profileCode: profileCode,
                      fallback: profileNameFallback(context),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: FuryColors.muted,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              displayText.isEmpty
                  ? '<${resolveL10n(context).noContent}>'
                  : displayText,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: displayText.isEmpty
                    ? FuryColors.faint
                    : const Color(0xFFCCCCCC),
                fontSize: 13,
                height: 1.45,
                fontStyle: displayText.isEmpty
                    ? FontStyle.italic
                    : FontStyle.normal,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(emoji, style: const TextStyle(fontSize: 18)),
                const SizedBox(width: 8),
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.06),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      category,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: FuryColors.muted,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
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
    final avatarBytes = comment.avatarBytes;
    final hasAvatar = avatarBytes != null && avatarBytes.isNotEmpty;

    return GestureDetector(
      onLongPress: onDelete,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            hasAvatar
                ? FuryProfileAvatar(
                    size: 32,
                    borderRadius: 10,
                    fallbackFontSize: 15,
                    bytes: avatarBytes,
                  )
                : Container(
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
                          profileDisplayName(
                            nickname: comment.nickname,
                            profileCode: comment.profileCode,
                            fallback: profileNameFallback(context),
                          ),
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
                        relativeTime(context, comment.createdAt),
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
