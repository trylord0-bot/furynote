import 'package:flutter/material.dart';
import 'package:fury_note/l10n/app_localizations.dart';
import '../../main.dart';
import '../src/profile/app_profile.dart';
import '../widgets/shared_widgets.dart';
import 'settings/profile_edit_screen.dart';
import 'settings/data_export_screen.dart';
import 'settings/data_import_screen.dart';
import 'settings/privacy_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _remindNotification = true;
  bool _commentNotification = true;
  bool _weeklyReport = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: FuryColors.phone,
      appBar: AppBar(
        backgroundColor: FuryColors.chrome,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(l10n.settings),
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 32),
        children: [
          const SizedBox(height: 16),
          _SettingsProfileCard(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ProfileEditScreen()),
              );
            },
          ),
          const SizedBox(height: 8),
          _SettingsSection(
            label: '알림',
            children: [
              _SettingsTile(
                icon: Icons.notifications_outlined,
                iconColor: FuryColors.red,
                title: l10n.reminderNotification,
                subtitle: '설정한 시간에 분노 노트 알림',
                trailing: Switch(
                  value: _remindNotification,
                  onChanged: (v) => setState(() => _remindNotification = v),
                  activeThumbColor: FuryColors.red,
                ),
              ),
              _SettingsTile(
                icon: Icons.chat_bubble_outline,
                iconColor: FuryColors.orange,
                title: '댓글 알림',
                subtitle: '내 포스팅에 댓글이 달리면 알림',
                trailing: Switch(
                  value: _commentNotification,
                  onChanged: (v) => setState(() => _commentNotification = v),
                  activeThumbColor: FuryColors.red,
                ),
              ),
              _SettingsTile(
                icon: Icons.bar_chart_outlined,
                iconColor: FuryColors.yellow,
                title: '주간 리포트 알림',
                subtitle: '매주 월요일 지난 주 통계 알림',
                trailing: Switch(
                  value: _weeklyReport,
                  onChanged: (v) => setState(() => _weeklyReport = v),
                  activeThumbColor: FuryColors.red,
                ),
              ),
            ],
          ),
          _SettingsSection(
            label: '데이터',
            children: [
              _SettingsTile(
                icon: Icons.upload_outlined,
                iconColor: const Color(0xFF64B4FF),
                title: '데이터 내보내기',
                subtitle: '내 기록을 CSV / JSON으로 저장',
                trailing: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _ProBadge(),
                    SizedBox(width: 4),
                    Icon(Icons.chevron_right, color: Color(0xFF444444)),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const DataExportScreen()),
                  );
                },
              ),
              _SettingsTile(
                icon: Icons.download_outlined,
                iconColor: const Color(0xFFA8D8A8),
                title: '데이터 가져오기',
                subtitle: '백업 파일로 기록 복원',
                trailing: const Icon(
                  Icons.chevron_right,
                  color: Color(0xFF444444),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const DataImportScreen()),
                  );
                },
              ),
            ],
          ),
          _SettingsSection(
            label: '지원',
            children: [
              _SettingsTile(
                icon: Icons.lock_outline,
                iconColor: const Color(0xFF888888),
                title: '개인정보처리방침',
                subtitle: '수집 정보 및 이용 목적 안내',
                trailing: const Icon(
                  Icons.chevron_right,
                  color: Color(0xFF444444),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const PrivacyScreen()),
                  );
                },
              ),
              _SettingsTile(
                icon: Icons.mail_outline,
                iconColor: const Color(0xFFC9B8FF),
                title: '피드백 보내기',
                subtitle: '불편한 점이나 개선 아이디어',
                trailing: const Icon(
                  Icons.open_in_new,
                  color: Color(0xFF444444),
                  size: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const _SettingsFooter(),
        ],
      ),
    );
  }
}

class _SettingsProfileCard extends StatelessWidget {
  const _SettingsProfileCard({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: FuryColors.panel,
            border: Border.all(color: FuryColors.border),
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              colors: [Color(0x0AE63946), Colors.transparent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              const FuryProfileAvatar(
                size: 52,
                borderRadius: 18,
                fallbackFontSize: 26,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedBuilder(
                      animation: AppProfileController.instance,
                      builder: (context, _) {
                        return Text(
                          AppProfileController.instance.displayName(
                            fallback: l10n.profileName,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: FuryColors.text,
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Text(
                          '🔥 47',
                          style: TextStyle(
                            color: FuryColors.red,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Text(
                          ' 기록',
                          style: TextStyle(
                            color: FuryColors.faint,
                            fontSize: 11,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          '📮 12',
                          style: TextStyle(
                            color: FuryColors.red,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Text(
                          ' 포스팅',
                          style: TextStyle(
                            color: FuryColors.faint,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.05),
                  border: Border.all(color: FuryColors.border),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.edit,
                  color: FuryColors.faint,
                  size: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SettingsSection extends StatelessWidget {
  const _SettingsSection({required this.label, required this.children});

  final String label;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 8),
            child: Text(
              label,
              style: const TextStyle(
                color: FuryColors.faint,
                fontSize: 10,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.8,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: FuryColors.panel,
              border: Border.all(color: FuryColors.border),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                for (var i = 0; i < children.length; i++) ...[
                  children[i],
                  if (i < children.length - 1)
                    const Divider(
                      height: 1,
                      indent: 52,
                      color: Color(0xFF1E1E1E),
                    ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: iconColor, size: 17),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: FuryColors.text,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: FuryColors.faint,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
            ?trailing,
          ],
        ),
      ),
    );
  }
}

class _ProBadge extends StatelessWidget {
  const _ProBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFFD700), Color(0xFFFFA500)],
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: const Text(
        'PRO',
        style: TextStyle(
          color: Color(0xFF1A1A1A),
          fontSize: 9,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _SettingsFooter extends StatelessWidget {
  const _SettingsFooter();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('🔥', style: TextStyle(fontSize: 22)),
        SizedBox(height: 4),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Fury ',
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                ),
              ),
              TextSpan(
                text: 'Note',
                style: TextStyle(
                  color: FuryColors.red,
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 2),
        Text(
          'v1.0.0 · 2026',
          style: TextStyle(color: Color(0xFF3A3A3A), fontSize: 11),
        ),
      ],
    );
  }
}
