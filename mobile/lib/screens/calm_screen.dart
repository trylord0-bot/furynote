import 'package:flutter/material.dart';
import 'package:fury_note/l10n/app_localizations.dart';
import 'package:fury_note/src/notes/rage_note.dart';
import 'package:fury_note/src/notes/rage_note_repository.dart';
import '../main.dart';
import '../widgets/shared_widgets.dart';
import 'calm/calm_breathing_screen.dart';
import 'calm/calm_meditation_screen.dart';
import 'calm/calm_timeout_screen.dart';
import 'record_screen.dart';

class CalmScreen extends StatefulWidget {
  const CalmScreen({this.onNavigateToFeed, this.noteRepository, super.key});

  final VoidCallback? onNavigateToFeed;
  final RageNoteRepository? noteRepository;

  @override
  State<CalmScreen> createState() => _CalmScreenState();
}

class _CalmScreenState extends State<CalmScreen> {
  List<RageNote> _reminders = [];
  bool _loaded = false;

  @override
  void initState() {
    super.initState();
    _loadReminders();
  }

  Future<void> _loadReminders() async {
    final all = await (widget.noteRepository ?? RageNoteRepository.instance)
        .getAll();
    final withReminder = all.where((n) => n.reminderAt != null).toList();
    if (mounted) {
      setState(() {
        _reminders = withReminder;
        _loaded = true;
      });
    }
  }

  String _relativeTime(AppLocalizations l10n, DateTime dt) {
    final diff = DateTime.now().difference(dt);
    if (diff.inDays >= 1) return '${diff.inDays}일 전';
    if (diff.inHours >= 1) return '${diff.inHours}시간 전';
    if (diff.inMinutes >= 1) return '${diff.inMinutes}분 전';
    return '방금 전';
  }

  void _showReminderCheckSheet(BuildContext context, RageNote note) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: FuryColors.panel,
      barrierColor: Colors.black.withValues(alpha: 0.65),
      isScrollControlled: true,
      enableDrag: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => _ReminderCheckSheet(
        note: note,
        onSaved: (choice) => _handleReminderSaved(note, choice),
      ),
    );
  }

  Future<void> _handleReminderSaved(RageNote note, RageChoice? choice) async {
    if (choice == null) {
      // 진정됨 — reminder 해제 후 목록에서 제거
      await RageNoteRepository.instance.clearReminderAt(note.id!);
      if (mounted) {
        setState(() => _reminders.removeWhere((n) => n.id == note.id));
      }
    } else {
      // 분노 수준 업데이트
      await RageNoteRepository.instance.updateRageLevel(
        note.id!,
        choice.level,
        choice.emoji,
        choice.label,
      );
      if (mounted) {
        setState(() {
          final idx = _reminders.indexWhere((n) => n.id == note.id);
          if (idx != -1) {
            _reminders[idx] = _reminders[idx].copyWith(
              rageLevel: choice.level,
              rageEmoji: choice.emoji,
              rageLabel: choice.label,
            );
          }
        });
      }
    }
  }

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
                              settings: const RouteSettings(
                                name: 'calm_breathing',
                              ),
                              builder: (_) => const CalmBreathingScreen(),
                            ),
                          );
                        case 1:
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              settings: const RouteSettings(
                                name: 'calm_timeout',
                              ),
                              builder: (_) => const CalmTimeoutScreen(),
                            ),
                          );
                        case 2:
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              settings: const RouteSettings(
                                name: 'calm_meditation',
                              ),
                              builder: (_) => const CalmMeditationScreen(),
                            ),
                          );
                        case 3:
                          widget.onNavigateToFeed?.call();
                      }
                    },
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          l10n.reminderNotes,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 8),
        if (!_loaded)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
          )
        else if (_reminders.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              '리마인드가 도착하면 여기 표시돼요',
              style: const TextStyle(color: FuryColors.muted, fontSize: 13),
            ),
          )
        else
          for (final note in _reminders)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Card(
                color: FuryColors.panelAlt,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(color: FuryColors.border),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () => _showReminderCheckSheet(context, note),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    child: Row(
                      children: [
                        Text(
                          note.rageEmoji,
                          style: const TextStyle(fontSize: 28),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                note.body.isEmpty
                                    ? '아까 그 분노, 지금은 어때요?'
                                    : note.body,
                                style: const TextStyle(
                                  color: FuryColors.text,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${note.rageLabel} · ${_relativeTime(l10n, note.createdAt)}',
                                style: const TextStyle(
                                  color: FuryColors.muted,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.chevron_right,
                          color: FuryColors.faint,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
      ],
    );
  }
}

// ─── Reminder Check Bottom Sheet ────────────────────────────────────────────

class _ReminderCheckSheet extends StatefulWidget {
  const _ReminderCheckSheet({required this.note, required this.onSaved});

  final RageNote note;
  final void Function(RageChoice? choice) onSaved;

  @override
  State<_ReminderCheckSheet> createState() => _ReminderCheckSheetState();
}

class _ReminderCheckSheetState extends State<_ReminderCheckSheet> {
  int? _selectedLevel; // null = 진정됨(0), 1-5 = 분노 단계

  static const _calmedLevel = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final choices = RageChoice.choices(l10n);

    final allOptions = [
      ...choices,
      RageChoice(0, '😌', l10n.calmed, const Color(0xFF4CAF50)),
    ];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: FuryColors.border,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '지금 분노는 어때요?',
              style: const TextStyle(
                color: FuryColors.text,
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${widget.note.rageEmoji} ${widget.note.rageLabel} · 아까의 그 분노',
              style: const TextStyle(color: FuryColors.muted, fontSize: 13),
            ),
            const SizedBox(height: 20),
            GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.1,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                for (final opt in allOptions)
                  _RageOptionTile(
                    choice: opt,
                    selected: _selectedLevel == opt.level,
                    onTap: () => setState(() => _selectedLevel = opt.level),
                  ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: FuryColors.muted,
                      side: const BorderSide(color: FuryColors.border),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(l10n.cancel),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _selectedLevel == null
                        ? null
                        : () {
                            final isCalmed = _selectedLevel == _calmedLevel;
                            final choice = isCalmed
                                ? null
                                : RageChoice.choices(
                                    AppLocalizations.of(context),
                                  )[_selectedLevel! - 1];
                            Navigator.of(context).pop();
                            widget.onSaved(choice);
                            FurySnackBar.show(
                              context,
                              isCalmed ? '잘 진정됐네요!' : '기록됐어요',
                            );
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: FuryColors.red,
                      foregroundColor: FuryColors.text,
                      disabledBackgroundColor: FuryColors.border,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(l10n.saveNote),
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

class _RageOptionTile extends StatelessWidget {
  const _RageOptionTile({
    required this.choice,
    required this.selected,
    required this.onTap,
  });

  final RageChoice choice;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
          color: selected
              ? choice.color.withValues(alpha: 0.18)
              : FuryColors.page,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? choice.color : FuryColors.border,
            width: selected ? 1.5 : 1,
          ),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: choice.color.withValues(alpha: 0.25),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(choice.emoji, style: const TextStyle(fontSize: 26)),
            const SizedBox(height: 6),
            Text(
              choice.label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: selected ? choice.color : FuryColors.muted,
                fontSize: 11,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
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
                style: const TextStyle(color: FuryColors.faint, fontSize: 11),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
