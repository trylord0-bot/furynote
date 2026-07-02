import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fury_note/l10n/app_localizations.dart';
import 'package:fury_note/l10n/app_localizations_ko.dart';
import 'package:fury_note/l10n/l10n_extensions.dart';
import 'package:fury_note/src/profile/app_profile.dart';
import '../main.dart';

AppLocalizations resolveL10n(BuildContext context) {
  return Localizations.of<AppLocalizations>(context, AppLocalizations) ??
      AppLocalizationsKo();
}

String relativeTime(BuildContext context, DateTime value) {
  return resolveL10n(context).formatRelativeTime(value);
}

String profileNameFallback(BuildContext context) {
  return resolveL10n(context).profileName;
}

class FurySnackBar {
  const FurySnackBar._();

  static SnackBar success(String message) {
    return _build(message, backgroundColor: FuryColors.toastSuccess);
  }

  static SnackBar error(String message) {
    return _build(message, backgroundColor: FuryColors.toastError);
  }

  static void show(
    BuildContext context,
    String message, {
    bool isError = false,
  }) {
    FuryToastController.instance.show(message, isError: isError);
  }

  static SnackBar _build(String message, {required Color backgroundColor}) {
    return SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: FuryColors.toastText,
          fontSize: 14,
          fontWeight: FontWeight.w800,
        ),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: backgroundColor,
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: FuryColors.toastText.withValues(alpha: 0.16)),
      ),
      duration: const Duration(seconds: 2),
    );
  }
}

class FuryPostCard extends StatelessWidget {
  const FuryPostCard({
    required this.emoji,
    required this.nickname,
    required this.category,
    required this.text,
    this.profileCode,
    this.avatarBytes,
    this.showAuthor = true,
    this.showProfileAvatar = false,
    this.angerRecordCount,
    this.postCount,
    this.createdTimeLabel,
    this.isMine = false,
    this.onDelete,
    this.deleteTitle,
    this.deleteContent,
    super.key,
  });

  final String emoji;
  final String nickname;
  final String? profileCode;
  final String category;
  final String text;
  final List<int>? avatarBytes;
  final bool showAuthor;
  final bool showProfileAvatar;
  final int? angerRecordCount;
  final int? postCount;
  final String? createdTimeLabel;
  final bool isMine;
  final VoidCallback? onDelete;
  final String? deleteTitle;
  final String? deleteContent;

  @override
  Widget build(BuildContext context) {
    final authorName = profileDisplayName(
      nickname: nickname,
      profileCode: profileCode,
      fallback: profileNameFallback(context),
    );
    final card = Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        border: Border.all(color: FuryColors.border),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showAuthor) ...[
            Row(
              children: [
                if (showProfileAvatar)
                  const FuryProfileAvatar(
                    size: 28,
                    borderRadius: 10,
                    fallbackFontSize: 15,
                  )
                else
                  FuryProfileAvatar(
                    size: 28,
                    borderRadius: 10,
                    fallbackFontSize: 15,
                    bytes: avatarBytes,
                    useProfileFallback: false,
                  ),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    authorName,
                    style: const TextStyle(
                      color: FuryColors.muted,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
          ],
          text.isNotEmpty
              ? Text(
                  text,
                  style: const TextStyle(
                    color: Color(0xFFCCCCCC),
                    fontSize: 13,
                    height: 1.6,
                  ),
                )
              : Text(
                  '<${resolveL10n(context).noContent}>',
                  style: const TextStyle(
                    color: FuryColors.faint,
                    fontSize: 13,
                    height: 1.6,
                    fontStyle: FontStyle.italic,
                  ),
                ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(emoji, style: const TextStyle(fontSize: 18)),
              const SizedBox(width: 6),
              Container(
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
                  style: const TextStyle(color: FuryColors.muted, fontSize: 10),
                ),
              ),
              const Spacer(),
              if (angerRecordCount != null)
                Text(
                  '🔥 $angerRecordCount',
                  style: const TextStyle(
                    color: FuryColors.faint,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              if (angerRecordCount != null && postCount != null)
                const SizedBox(width: 8),
              if (postCount != null)
                Text(
                  '📮 $postCount',
                  style: const TextStyle(
                    color: FuryColors.faint,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              if ((angerRecordCount != null || postCount != null) &&
                  createdTimeLabel != null)
                const SizedBox(width: 8),
              if (createdTimeLabel != null)
                Text(
                  createdTimeLabel!,
                  style: const TextStyle(
                    color: FuryColors.faint,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ],
          ),
        ],
      ),
    );

    if (!isMine || onDelete == null) return card;

    return Stack(
      children: [
        card,
        Positioned(
          top: 14,
          right: 14,
          child: GestureDetector(
            onTap: () {
              final l10n = resolveL10n(context);
              final resolvedDeleteContent =
                  deleteContent ?? l10n.feedDeleteContent;
              showDialog<void>(
                context: context,
                builder: (ctx) => AlertDialog(
                  backgroundColor: FuryColors.panel,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: const BorderSide(color: FuryColors.border),
                  ),
                  title: Text(
                    deleteTitle ?? l10n.feedDeleteTitle,
                    style: const TextStyle(
                      color: FuryColors.text,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  content: resolvedDeleteContent.isEmpty
                      ? null
                      : Text(
                          resolvedDeleteContent,
                          style: const TextStyle(color: FuryColors.muted),
                        ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(ctx),
                      child: Text(l10n.cancel),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                        onDelete!();
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: FuryColors.red,
                      ),
                      child: Text(l10n.delete),
                    ),
                  ],
                ),
              );
            },
            child: const Icon(
              Icons.delete_outline,
              size: 20,
              color: FuryColors.faint,
            ),
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
        disabledForegroundColor: FuryColors.muted,
        minimumSize: const Size(0, 36),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}

class FuryProfileAvatar extends StatelessWidget {
  const FuryProfileAvatar({
    this.size = 44,
    this.borderRadius = 16,
    this.fallbackFontSize = 22,
    this.bytes,
    this.useProfileFallback = true,
    super.key,
  });

  final double size;
  final double borderRadius;
  final double fallbackFontSize;
  final List<int>? bytes;
  final bool useProfileFallback;

  @override
  Widget build(BuildContext context) {
    final explicitBytes = bytes;
    if (explicitBytes != null && explicitBytes.isNotEmpty) {
      return _AvatarImage(
        size: size,
        borderRadius: borderRadius,
        bytes: explicitBytes,
      );
    }

    if (!useProfileFallback) {
      return _fallbackAvatar();
    }

    return AnimatedBuilder(
      animation: AppProfileController.instance,
      builder: (context, _) {
        final profileBytes = AppProfileController.instance.avatarBytes;
        if (profileBytes != null && profileBytes.isNotEmpty) {
          return _AvatarImage(
            size: size,
            borderRadius: borderRadius,
            bytes: profileBytes,
          );
        }

        return _fallbackAvatar();
      },
    );
  }

  Widget _fallbackAvatar() {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: FuryColors.red.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: FuryColors.red.withValues(alpha: 0.18)),
      ),
      child: Center(
        child: Text('🔥', style: TextStyle(fontSize: fallbackFontSize)),
      ),
    );
  }
}

class _AvatarImage extends StatelessWidget {
  const _AvatarImage({
    required this.size,
    required this.borderRadius,
    required this.bytes,
  });

  final double size;
  final double borderRadius;
  final List<int> bytes;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.memory(
        Uint8List.fromList(bytes),
        width: size,
        height: size,
        fit: BoxFit.cover,
        gaplessPlayback: true,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: size,
            height: size,
            color: FuryColors.red.withValues(alpha: 0.18),
            child: Center(
              child: Text('🔥', style: TextStyle(fontSize: size * 0.5)),
            ),
          );
        },
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    required this.title,
    required this.subtitle,
    this.showTitle = true,
    this.showSubtitle = true,
    super.key,
  });

  final String title;
  final String subtitle;
  final bool showTitle;
  final bool showSubtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showTitle && title.isNotEmpty)
          Text(
            title,
            style: const TextStyle(
              color: FuryColors.text,
              fontSize: 28,
              fontWeight: FontWeight.w900,
            ),
          ),
        if (showTitle && title.isNotEmpty) const SizedBox(height: 6),
        if (showSubtitle)
          Text(subtitle, style: const TextStyle(color: FuryColors.faint)),
      ],
    );
  }
}
