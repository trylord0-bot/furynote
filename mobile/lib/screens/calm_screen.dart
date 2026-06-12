import 'package:flutter/material.dart';
import 'package:fury_note/l10n/app_localizations.dart';
import '../main.dart';
import '../widgets/shared_widgets.dart';
import 'calm/calm_breathing_screen.dart';
import 'calm/calm_meditation_screen.dart';
import 'calm/calm_timeout_screen.dart';

class CalmScreen extends StatelessWidget {
  const CalmScreen({this.onNavigateToFeed, super.key});

  final VoidCallback? onNavigateToFeed;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final tools = [
      (Icons.air, l10n.breathing, '4-7-8'),
      (Icons.timer_outlined, l10n.timeout, '10 min'),
      (Icons.image_outlined, l10n.meditation, '5-10 min'),
      (Icons.forum_outlined, l10n.feedSupport, l10n.feed),
    ];

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        SectionHeader(
          title: l10n.calmTitle,
          subtitle: l10n.calmSubtitle,
          showTitle: false,
          showSubtitle: false,
        ),
        const SizedBox(height: 16),
        Text(
          l10n.reminderNotes,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 8),
        const Card(
          child: ListTile(
            leading: Text('😡', style: TextStyle(fontSize: 24)),
            title: Text('아까 그 분노, 지금은 어때요?'),
            subtitle: Text('최초 강한 분노 · 1시간 후'),
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: SizedBox(
            width: 320,
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.05,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                for (var i = 0; i < tools.length; i++)
                  _CalmToolCard(
                    icon: tools[i].$1,
                    title: tools[i].$2,
                    subtitle: tools[i].$3,
                    onTap: () {
                      switch (i) {
                        case 0:
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const CalmBreathingScreen(),
                            ),
                          );
                        case 1:
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const CalmTimeoutScreen(),
                            ),
                          );
                        case 2:
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const CalmMeditationScreen(),
                            ),
                          );
                        case 3:
                          onNavigateToFeed?.call();
                      }
                    },
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _CalmToolCard extends StatelessWidget {
  const _CalmToolCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 32, color: FuryColors.orange),
              const SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: FuryColors.text,
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: FuryColors.faint,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
