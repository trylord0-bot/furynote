import 'package:flutter/material.dart';
import 'package:fury_note/l10n/app_localizations.dart';
import '../main.dart';
import '../widgets/shared_widgets.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final posts = [
      (
        '😡',
        l10n.profileName,
        '🚗 ${l10n.driving}',
        '옆 차선 차가 갑자기 끼어들었는데 사과도 없이 가버림.',
        12,
        3,
        47,
        12,
      ),
      ('😤', '부글부글 곰 #1234', '💼 ${l10n.work}', '회의가 또 퇴근 직전에 잡혔다.', 8, 1, 23, 5),
    ];

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        SectionHeader(
          title: l10n.feedTitle,
          subtitle: l10n.feedSubtitle,
          showTitle: false,
          showSubtitle: false,
        ),
        const SizedBox(height: 16),
        for (final post in posts) ...[
          FuryPostCard(
            emoji: post.$1,
            nickname: post.$2,
            category: post.$3,
            text: post.$4,
            angerRecordCount: post.$7,
            postCount: post.$8,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: Wrap(
              spacing: 8,
              runSpacing: 4,
              children: [
                FuryPostAction(
                  icon: Icons.favorite_border,
                  label: '${l10n.like} ${post.$5}',
                ),
                FuryPostAction(
                  icon: Icons.chat_bubble_outline,
                  label: '${l10n.comment} ${post.$6}',
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}

class FuryPostAction extends StatelessWidget {
  const FuryPostAction({required this.icon, required this.label, super.key});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 17),
      label: Text(label),
      style: TextButton.styleFrom(
        foregroundColor: FuryColors.muted,
        minimumSize: const Size(0, 36),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}
