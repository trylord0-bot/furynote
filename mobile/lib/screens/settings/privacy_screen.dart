import 'package:flutter/material.dart';
import 'package:fury_note/l10n/app_localizations.dart';
import '../../main.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: FuryColors.phone,
      appBar: AppBar(
        backgroundColor: FuryColors.chrome,
        title: Text(l10n.privacyTitle),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.privacyLastUpdated,
              style: const TextStyle(color: FuryColors.faint, fontSize: 10),
            ),
            const SizedBox(height: 16),
            _PrivacySection(
              title: l10n.privacySection1Title,
              body: l10n.privacySection1Body,
            ),
            const _PrivacyDivider(),
            _PrivacySection(
              title: l10n.privacySection2Title,
              body: l10n.privacySection2Body,
            ),
            const _PrivacyDivider(),
            _PrivacySection(
              title: l10n.privacySection3Title,
              body: l10n.privacySection3Body,
            ),
            const _PrivacyDivider(),
            _PrivacySection(
              title: l10n.privacySection4Title,
              body: l10n.privacySection4Body,
            ),
            const _PrivacyDivider(),
            _PrivacySection(
              title: l10n.privacySection5Title,
              body: l10n.privacySection5Body,
            ),
            const _PrivacyDivider(),
            _PrivacySection(
              title: l10n.privacySection6Title,
              body: l10n.privacySection6Body,
            ),
          ],
        ),
      ),
    );
  }
}

class _PrivacySection extends StatelessWidget {
  const _PrivacySection({required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: FuryColors.text,
            fontSize: 13,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          body,
          style: const TextStyle(
            color: FuryColors.muted,
            fontSize: 11,
            height: 1.8,
          ),
        ),
      ],
    );
  }
}

class _PrivacyDivider extends StatelessWidget {
  const _PrivacyDivider();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Divider(height: 1, color: Color(0xFF1E1E1E)),
    );
  }
}
