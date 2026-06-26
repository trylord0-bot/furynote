import 'package:flutter/material.dart';
import 'package:fury_note/l10n/app_localizations.dart';
import '../main.dart';

class AppGuideScreen extends StatelessWidget {
  const AppGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: FuryColors.phone,
      appBar: AppBar(
        backgroundColor: FuryColors.chrome,
        title: Text(l10n.drawerGuide),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
        children: [
          Text(
            l10n.appGuideTitle,
            style: const TextStyle(
              color: FuryColors.text,
              fontSize: 24,
              fontWeight: FontWeight.w800,
              height: 1.3,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            l10n.appGuideSubtitle,
            style: const TextStyle(
              color: FuryColors.muted,
              fontSize: 14,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 18),

          _GuideCard(
            emoji: '🔥',
            title: l10n.appGuideRecordTitle,
            children: [
              _BodyText(l10n.appGuideRecordBody),
              const SizedBox(height: 10),
              _GuideStep(number: 1, text: l10n.appGuideRecordStep1),
              _GuideStep(number: 2, text: l10n.appGuideRecordStep2),
              _GuideStep(number: 3, text: l10n.appGuideRecordStep3),
              _GuideStep(number: 4, text: l10n.appGuideRecordStep4),
              _GuideStep(number: 5, text: l10n.appGuideRecordStep5),
            ],
          ),

          _GuideCard(
            emoji: '📮',
            title: l10n.appGuideFeedTitle,
            alt: true,
            children: [
              _BodyText(l10n.appGuideFeedBody),
              const SizedBox(height: 10),
              _BoldBullet(text: l10n.appGuideFeedItem1),
              _BoldBullet(text: l10n.appGuideFeedItem2),
              _BoldBullet(text: l10n.appGuideFeedItem3),
            ],
          ),

          _GuideCard(
            emoji: '📊',
            title: l10n.appGuideStatsTitle,
            children: [
              _BodyText(l10n.appGuideStatsBody),
              const SizedBox(height: 10),
              _BulletItem(text: l10n.appGuideStatsItem1),
              _BulletItem(text: l10n.appGuideStatsItem2),
              _BulletItem(text: l10n.appGuideStatsItem3),
              _BulletItem(text: l10n.appGuideStatsItem4),
            ],
          ),

          _GuideCard(
            emoji: '🧘',
            title: l10n.appGuideCalmTitle,
            alt: true,
            children: [
              _BodyText(l10n.appGuideCalmBody),
              const SizedBox(height: 10),
              _BulletItem(text: l10n.appGuideCalmItem1),
              _BulletItem(text: l10n.appGuideCalmItem2),
              _BulletItem(text: l10n.appGuideCalmItem3),
              _BulletItem(text: l10n.appGuideCalmItem4),
            ],
          ),

          _GuideCard(
            emoji: '🎭',
            title: l10n.appGuideProfileTitle,
            children: [
              _BodyText(l10n.appGuideProfileBody),
              const SizedBox(height: 10),
              _BulletItem(text: l10n.appGuideProfileItem1),
              _BulletItem(text: l10n.appGuideProfileItem2),
            ],
          ),

          _GuideCard(
            emoji: '🔔',
            title: l10n.appGuideNotificationTitle,
            alt: true,
            children: [
              _BulletItem(text: l10n.appGuideNotificationItem1),
              _BulletItem(text: l10n.appGuideNotificationItem2),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.04),
                  border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.info_outline,
                      color: FuryColors.faint,
                      size: 14,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        l10n.appGuideNotificationHint,
                        style: const TextStyle(
                          color: FuryColors.faint,
                          fontSize: 12,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.only(top: 18),
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: FuryColors.border)),
            ),
            child: Column(
              children: [
                const Text('🔥', style: TextStyle(fontSize: 22)),
                const SizedBox(height: 4),
                Text(
                  l10n.appGuideFooterTitle,
                  style: const TextStyle(color: FuryColors.faint, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BodyText extends StatelessWidget {
  const _BodyText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: FuryColors.muted,
        fontSize: 14,
        height: 1.6,
      ),
    );
  }
}

/// Renders text with `**bold**` markers as rich text.
class _BoldBullet extends StatelessWidget {
  const _BoldBullet({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    const baseStyle = TextStyle(color: FuryColors.muted, fontSize: 14, height: 1.5);
    final boldStyle = baseStyle.copyWith(
      color: FuryColors.text,
      fontWeight: FontWeight.w800,
    );

    final spans = <TextSpan>[];
    final parts = text.split('**');
    for (var i = 0; i < parts.length; i++) {
      if (parts[i].isEmpty) continue;
      spans.add(TextSpan(text: parts[i], style: i.isOdd ? boldStyle : baseStyle));
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 7),
            child: SizedBox(
              width: 14,
              child: Center(
                child: SizedBox(
                  width: 4,
                  height: 4,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: FuryColors.muted,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(child: RichText(text: TextSpan(children: spans, style: baseStyle))),
        ],
      ),
    );
  }
}

class _BulletItem extends StatelessWidget {
  const _BulletItem({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 7),
            child: SizedBox(
              width: 14,
              child: Center(
                child: SizedBox(
                  width: 4,
                  height: 4,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: FuryColors.muted,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: FuryColors.muted,
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GuideStep extends StatelessWidget {
  const _GuideStep({required this.number, required this.text});

  final int number;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.045),
        border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 34,
            height: 34,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: FuryColors.red.withValues(alpha: 0.16),
              shape: BoxShape.circle,
            ),
            child: Text(
              '$number',
              style: const TextStyle(
                color: FuryColors.red,
                fontWeight: FontWeight.w900,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Text(
                text,
                style: const TextStyle(
                  color: FuryColors.text,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 1.4,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GuideCard extends StatelessWidget {
  const _GuideCard({
    required this.emoji,
    required this.title,
    required this.children,
    this.alt = false,
  });

  final String emoji;
  final String title;
  final List<Widget> children;
  final bool alt;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: alt ? FuryColors.panelAlt : FuryColors.panel,
        border: Border.all(color: FuryColors.border),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(emoji, style: const TextStyle(fontSize: 18)),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: FuryColors.text,
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.3,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ...children,
        ],
      ),
    );
  }
}
