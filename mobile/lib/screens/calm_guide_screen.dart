import 'package:flutter/material.dart';
import 'package:fury_note/l10n/app_localizations.dart';
import '../main.dart';

class CalmGuideScreen extends StatelessWidget {
  const CalmGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: FuryColors.phone,
      appBar: AppBar(
        backgroundColor: FuryColors.chrome,
        title: Text(l10n.drawerCalmGuide),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
        children: [
          Text(
            l10n.calmGuideTitle,
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
            l10n.calmGuideSubtitle,
            style: const TextStyle(
              color: FuryColors.muted,
              fontSize: 14,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 18),
          _NoticeBanner(text: l10n.calmGuideNotice),

          _GuideCard(
            emoji: '🔥',
            title: l10n.calmGuideMomentTitle,
            children: [
              _BoldText(l10n.calmGuideMomentBody1),
              const SizedBox(height: 8),
              _BoldText(l10n.calmGuideMomentBody2),
            ],
          ),

          _GuideCard(
            emoji: '🧭',
            title: l10n.calmGuideRoutineTitle,
            alt: true,
            children: [
              _GuideStep(number: 1, title: l10n.calmGuideStep1Title, desc: l10n.calmGuideStep1Desc),
              _GuideStep(number: 2, title: l10n.calmGuideStep2Title, desc: l10n.calmGuideStep2Desc),
              _GuideStep(number: 3, title: l10n.calmGuideStep3Title, desc: l10n.calmGuideStep3Desc),
              _GuideStep(number: 4, title: l10n.calmGuideStep4Title, desc: l10n.calmGuideStep4Desc),
            ],
          ),

          _GuideCard(
            emoji: '🌬️',
            title: l10n.calmGuideBreathTitle,
            children: [
              _GuideStep(number: 1, text: l10n.calmGuideBreathStep1),
              _GuideStep(number: 2, text: l10n.calmGuideBreathStep2),
              _GuideStep(number: 3, text: l10n.calmGuideBreathStep3),
              _GuideStep(number: 4, text: l10n.calmGuideBreathStep4),
              const SizedBox(height: 8),
              _BoldText(l10n.calmGuideBreathNote),
            ],
          ),

          _GuideCard(
            emoji: '⏱️',
            title: l10n.calmGuideTimeoutTitle,
            alt: true,
            children: [
              _BoldText(l10n.calmGuideTimeoutBody),
              const SizedBox(height: 14),
              Text(
                l10n.calmGuideTimeoutExamplesTitle,
                style: const TextStyle(
                  color: FuryColors.text,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6),
              _BulletItem(text: l10n.calmGuideTimeoutExample1),
              _BulletItem(text: l10n.calmGuideTimeoutExample2),
              _BulletItem(text: l10n.calmGuideTimeoutExample3),
            ],
          ),

          _GuideCard(
            emoji: '🧊',
            title: l10n.calmGuideSensoryTitle,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _QuickItem(title: l10n.calmGuideSensory1Title, desc: l10n.calmGuideSensory1Desc),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _QuickItem(title: l10n.calmGuideSensory2Title, desc: l10n.calmGuideSensory2Desc),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _QuickItem(title: l10n.calmGuideSensory3Title, desc: l10n.calmGuideSensory3Desc),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _QuickItem(title: l10n.calmGuideSensory4Title, desc: l10n.calmGuideSensory4Desc),
                  ),
                ],
              ),
            ],
          ),

          _GuideCard(
            emoji: '📝',
            title: l10n.calmGuideQuestionsTitle,
            alt: true,
            children: [
              _BulletItem(text: l10n.calmGuideQuestion1),
              _BulletItem(text: l10n.calmGuideQuestion2),
              _BulletItem(text: l10n.calmGuideQuestion3),
              _BulletItem(text: l10n.calmGuideQuestion4),
              const SizedBox(height: 10),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  _GuideTag(text: l10n.calmGuideTag1),
                  _GuideTag(text: l10n.calmGuideTag2),
                  _GuideTag(text: l10n.calmGuideTag3),
                ],
              ),
            ],
          ),

          _GuideCard(
            emoji: '🚨',
            title: l10n.calmGuideDangerTitle,
            danger: true,
            children: [
              _BulletItem(text: l10n.calmGuideDanger1),
              _BulletItem(text: l10n.calmGuideDanger2),
              _BulletItem(text: l10n.calmGuideDanger3),
              _BulletItem(text: l10n.calmGuideDanger4),
              const SizedBox(height: 8),
              Text(
                l10n.calmGuideDangerBody,
                style: const TextStyle(
                  color: FuryColors.muted,
                  fontSize: 14,
                  height: 1.6,
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
                Text(
                  l10n.calmGuideFooterTitle,
                  style: const TextStyle(color: FuryColors.faint, fontSize: 12),
                ),
                const SizedBox(height: 4),
                Text(
                  l10n.calmGuideFooterDisclaimer,
                  textAlign: TextAlign.center,
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

/// Renders text containing `**bold**` markdown-style markers as rich text,
/// so localized strings can carry emphasis without splitting into many keys.
class _BoldText extends StatelessWidget {
  const _BoldText(this.text, {this.boldColor});

  final String text;
  final Color? boldColor;

  @override
  Widget build(BuildContext context) {
    const baseStyle = TextStyle(color: FuryColors.muted, fontSize: 14, height: 1.6);
    final boldStyle = baseStyle.copyWith(
      color: boldColor ?? FuryColors.text,
      fontWeight: FontWeight.w800,
    );

    final spans = <TextSpan>[];
    final parts = text.split('**');
    for (var i = 0; i < parts.length; i++) {
      if (parts[i].isEmpty) continue;
      spans.add(TextSpan(text: parts[i], style: i.isOdd ? boldStyle : baseStyle));
    }

    return RichText(text: TextSpan(children: spans, style: baseStyle));
  }
}

class _NoticeBanner extends StatelessWidget {
  const _NoticeBanner({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: FuryColors.orange.withValues(alpha: 0.08),
        border: Border.all(color: FuryColors.orange.withValues(alpha: 0.3)),
        borderRadius: BorderRadius.circular(18),
      ),
      child: _BoldText(text, boldColor: FuryColors.orange),
    );
  }
}

class _GuideCard extends StatelessWidget {
  const _GuideCard({
    required this.emoji,
    required this.title,
    required this.children,
    this.alt = false,
    this.danger = false,
  });

  final String emoji;
  final String title;
  final List<Widget> children;
  final bool alt;
  final bool danger;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: danger
            ? FuryColors.red.withValues(alpha: 0.08)
            : (alt ? FuryColors.panelAlt : FuryColors.panel),
        border: Border.all(
          color: danger ? FuryColors.red.withValues(alpha: 0.35) : FuryColors.border,
        ),
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
                  style: TextStyle(
                    color: danger ? const Color(0xFFFF6B75) : FuryColors.text,
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

class _GuideStep extends StatelessWidget {
  const _GuideStep({required this.number, this.title, this.desc, this.text})
      : assert(text != null || (title != null && desc != null));

  final int number;
  final String? title;
  final String? desc;
  final String? text;

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
            child: text != null
                ? Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: Text(
                      text!,
                      style: const TextStyle(
                        color: FuryColors.text,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        height: 1.4,
                      ),
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title!,
                        style: const TextStyle(
                          color: FuryColors.text,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        desc!,
                        style: const TextStyle(color: FuryColors.muted, fontSize: 13, height: 1.5),
                      ),
                    ],
                  ),
          ),
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
                    decoration: BoxDecoration(color: FuryColors.muted, shape: BoxShape.circle),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: FuryColors.muted, fontSize: 14, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickItem extends StatelessWidget {
  const _QuickItem({required this.title, required this.desc});

  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.045),
        border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(color: FuryColors.text, fontSize: 14, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 4),
          Text(
            desc,
            style: const TextStyle(color: FuryColors.muted, fontSize: 12, height: 1.4),
          ),
        ],
      ),
    );
  }
}

class _GuideTag extends StatelessWidget {
  const _GuideTag({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        text,
        style: const TextStyle(color: FuryColors.muted, fontSize: 12),
      ),
    );
  }
}
