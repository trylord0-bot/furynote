import 'package:flutter/material.dart';
import 'package:fury_note/l10n/app_localizations.dart';
import '../widgets/shared_widgets.dart';

class CalmScreen extends StatelessWidget {
  const CalmScreen({super.key});

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
        const SizedBox(height: 16),
        for (final tool in tools)
          Card(
            child: ListTile(
              leading: Icon(tool.$1),
              title: Text(tool.$2),
              subtitle: Text(tool.$3),
              trailing: const Icon(Icons.chevron_right),
            ),
          ),
      ],
    );
  }
}
