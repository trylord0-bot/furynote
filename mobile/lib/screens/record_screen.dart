import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fury_note/l10n/app_localizations.dart';
import 'package:fury_note/src/audio/voice_recorder.dart';
import 'package:fury_note/src/notes/rage_note.dart';
import 'package:fury_note/src/notes/rage_note_repository.dart';
import 'package:fury_note/src/notifications/reminder_notification_service.dart';
import '../main.dart';
import '../widgets/shared_widgets.dart';

class RageChoice {
  const RageChoice(this.level, this.emoji, this.label, this.color);

  final int level;
  final String emoji;
  final String label;
  final Color color;

  static List<RageChoice> choices(AppLocalizations l10n) => [
    RageChoice(1, '😒', l10n.annoyed, const Color(0xFFFFD93D)),
    RageChoice(2, '😤', l10n.angry, const Color(0xFFFF9A3C)),
    RageChoice(3, '😠', l10n.mad, const Color(0xFFFF6B35)),
    RageChoice(4, '😡', l10n.furious, const Color(0xFFE63946)),
    RageChoice(5, '🤬', l10n.rage, const Color(0xFF9B1D20)),
  ];
}

class CategoryChoice {
  const CategoryChoice(this.key, this.emoji, this.label);

  final String key;
  final String emoji;
  final String label;

  CategoryChoice copyWith({String? label}) {
    return CategoryChoice(key, emoji, label ?? this.label);
  }

  static List<CategoryChoice> choices(AppLocalizations l10n) => [
    CategoryChoice('family', '👨‍👩‍👧', l10n.family),
    CategoryChoice('romance', '💕', l10n.romance),
    CategoryChoice('work', '💼', l10n.work),
    CategoryChoice('people', '🧑', l10n.people),
    CategoryChoice('driving', '🚗', l10n.driving),
    CategoryChoice('custom', '➕', l10n.custom),
  ];
}

class RecordScreen extends StatefulWidget {
  const RecordScreen({
    this.onPost,
    this.onSaveOnly,
    this.noteRepository,
    this.reminderScheduler,
    this.voiceRecorder,
    super.key,
  });

  final VoidCallback? onPost;
  final VoidCallback? onSaveOnly;
  final RageNoteRepository? noteRepository;
  final ReminderScheduler? reminderScheduler;
  final FuryVoiceRecorder? voiceRecorder;

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  final PageController _controller = PageController();
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _customCategoryController =
      TextEditingController();
  late final FuryVoiceRecorder _voiceRecorder =
      widget.voiceRecorder ?? createVoiceRecorder();
  int _step = 0;
  RageChoice? _rage;
  CategoryChoice? _category;
  String? _reminder;
  DateTime? _customReminderDateTime;
  String? _recordedAudioPath;
  int? _savedNoteId;
  bool _isRecording = false;
  bool _isSaving = false;

  @override
  void dispose() {
    _controller.dispose();
    _textController.dispose();
    _customCategoryController.dispose();
    _voiceRecorder.dispose();
    super.dispose();
  }

  void _goTo(int step) {
    setState(() => _step = step);
    _controller.animateToPage(
      step,
      duration: const Duration(milliseconds: 320),
      curve: Curves.easeOutCubic,
    );
  }

  Future<void> _showCustomReminderSheet(BuildContext context) async {
    final now = DateTime.now();
    final initial =
        _customReminderDateTime ?? now.add(const Duration(hours: 1));
    var selectedDate = DateTime(initial.year, initial.month, initial.day);
    var selectedHour = initial.hour;
    var selectedMinute = initial.minute;
    final hourController = FixedExtentScrollController(
      initialItem: selectedHour,
    );
    final minuteController = FixedExtentScrollController(
      initialItem: selectedMinute,
    );

    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: FuryColors.panel,
      barrierColor: Colors.black.withValues(alpha: 0.65),
      enableDrag: false,
      showDragHandle: false,
      isScrollControlled: true,
      builder: (sheetContext) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            return SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18, 14, 18, 18),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CalendarDatePicker(
                      key: const ValueKey('custom-reminder-calendar'),
                      initialDate: selectedDate,
                      firstDate: DateTime(now.year, now.month, now.day),
                      lastDate: DateTime(now.year + 100, now.month, now.day),
                      onDateChanged: (value) =>
                          setSheetState(() => selectedDate = value),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 132,
                      child: Row(
                        children: [
                          Expanded(
                            child: ReminderWheelPicker(
                              key: const ValueKey(
                                'custom-reminder-hour-picker',
                              ),
                              controller: hourController,
                              itemCount: 24,
                              suffix: '시',
                              onSelectedItemChanged: (value) =>
                                  selectedHour = value,
                            ),
                          ),
                          Expanded(
                            child: ReminderWheelPicker(
                              key: const ValueKey(
                                'custom-reminder-minute-picker',
                              ),
                              controller: minuteController,
                              itemCount: 60,
                              suffix: '분',
                              onSelectedItemChanged: (value) =>
                                  selectedMinute = value,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Navigator.of(sheetContext).pop(),
                            child: const Text('취소'),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: FilledButton(
                            onPressed: () {
                              final selected = DateTime(
                                selectedDate.year,
                                selectedDate.month,
                                selectedDate.day,
                                selectedHour,
                                selectedMinute,
                              );
                              setState(() {
                                _customReminderDateTime = selected;
                                _reminder = '직접 설정';
                              });
                              Navigator.of(sheetContext).pop();
                            },
                            child: const Text('저장'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );

    hourController.dispose();
    minuteController.dispose();
  }

  DateTime? _selectedReminderDateTime() {
    final now = DateTime.now();
    return switch (_reminder) {
      '30분 후' => now.add(const Duration(minutes: 30)),
      '1시간 후' => now.add(const Duration(hours: 1)),
      '2시간 후' => now.add(const Duration(hours: 2)),
      '6시간 후' => now.add(const Duration(hours: 6)),
      '내일' => now.add(const Duration(days: 1)),
      '직접 설정' => _customReminderDateTime,
      _ => null,
    };
  }

  Future<void> _toggleVoiceRecording(AppLocalizations l10n) async {
    try {
      if (_isRecording) {
        final path = await _voiceRecorder.stop();
        if (!mounted) {
          return;
        }
        setState(() {
          _isRecording = false;
          _recordedAudioPath = path;
        });
        return;
      }

      final hasPermission = await _voiceRecorder.hasPermission();
      if (!hasPermission) {
        if (!mounted) {
          return;
        }
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('마이크 권한이 필요합니다.')));
        return;
      }

      await _voiceRecorder.startNew();
      if (!mounted) {
        return;
      }
      setState(() {
        _isRecording = true;
        _recordedAudioPath = null;
      });
    } catch (_) {
      if (!mounted) {
        return;
      }
      setState(() => _isRecording = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${l10n.voiceInput}을 시작할 수 없습니다.')),
      );
    }
  }

  Future<void> _saveNoteAndContinue(
    RageChoice rage,
    CategoryChoice category,
  ) async {
    if (_savedNoteId != null) {
      _goTo(5);
      return;
    }

    setState(() => _isSaving = true);
    final body = _textController.text.trim();
    final reminderAt = _selectedReminderDateTime();
    try {
      final id = await (widget.noteRepository ?? RageNoteRepository.instance)
          .insert(
            RageNote(
              createdAt: DateTime.now(),
              rageLevel: rage.level,
              rageEmoji: rage.emoji,
              rageLabel: rage.label,
              categoryKey: category.key,
              categoryEmoji: category.emoji,
              categoryLabel: category.label,
              body: body,
              audioPath: _recordedAudioPath,
              reminderAt: reminderAt,
            ),
          );
      if (reminderAt != null) {
        await (widget.reminderScheduler ?? LocalReminderScheduler.instance)
            .scheduleRageReminder(id: id, scheduledAt: reminderAt, body: body);
      }
      if (!mounted) {
        return;
      }
      setState(() => _savedNoteId = id);
      _goTo(5);
    } catch (_) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('기록을 저장하지 못했습니다. 다시 시도해주세요.')),
      );
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final rage = _rage ?? RageChoice.choices(l10n).first;
    final selectedCategory = _category ?? CategoryChoice.choices(l10n).first;
    final category =
        selectedCategory.key == 'custom' &&
            _customCategoryController.text.trim().isNotEmpty
        ? selectedCategory.copyWith(
            label: _customCategoryController.text.trim(),
          )
        : selectedCategory;
    final canContinueText =
        _textController.text.trim().isNotEmpty || _recordedAudioPath != null;
    final canContinueReminder = _reminder != null;

    final reminderSubtitle =
        _reminder == '직접 설정' && _customReminderDateTime != null
        ? formatDottedLocaleDateTime(
            Localizations.localeOf(context),
            _customReminderDateTime!,
          )
        : _reminder ?? l10n.noReminder;

    return Container(
      decoration: BoxDecoration(
        color: Color.lerp(
          FuryColors.phone,
          rage.color,
          _rage == null ? 0 : 0.08,
        ),
      ),
      child: Column(
        children: [
          RecordProgressBar(active: _step),
          Expanded(
            child: PageView(
              controller: _controller,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                RecordStep(
                  title: l10n.stepIntensity,
                  subtitle: l10n.stepIntensitySub,
                  child: ChoiceGrid(
                    children: [
                      for (final choice in RageChoice.choices(l10n))
                        Center(
                          child: ChoiceChipCard(
                            selected: _rage?.level == choice.level,
                            color: choice.color,
                            title: choice.emoji,
                            subtitle: choice.label,
                            onTap: () {
                              setState(() => _rage = choice);
                              _goTo(1);
                            },
                          ),
                        ),
                    ],
                  ),
                ),
                RecordStep(
                  title: l10n.stepCategory,
                  subtitle: l10n.stepCategorySub,
                  onBack: () => _goTo(0),
                  child: Column(
                    children: [
                      ChoiceGrid(
                        children: [
                          for (final choice in CategoryChoice.choices(l10n))
                            Center(
                              child: ChoiceChipCard(
                                selected: _category?.key == choice.key,
                                color: const Color(0xFFFF9A3C),
                                title: choice.emoji,
                                subtitle: choice.label,
                                onTap: () {
                                  setState(() => _category = choice);
                                  if (choice.key != 'custom') {
                                    _goTo(2);
                                  }
                                },
                              ),
                            ),
                        ],
                      ),
                      if (_category?.key == 'custom') ...[
                        const SizedBox(height: 18),
                        TextField(
                          key: const ValueKey('custom-category-field'),
                          controller: _customCategoryController,
                          decoration: InputDecoration(labelText: '카테고리를 입력하세요'),
                          style: const TextStyle(color: FuryColors.text),
                        ),
                        const SizedBox(height: 12),
                        FilledButton(
                          key: const ValueKey('custom-category-next'),
                          onPressed: () {
                            if (_customCategoryController.text
                                .trim()
                                .isNotEmpty) {
                              _goTo(2);
                            }
                          },
                          child: Text(l10n.next),
                        ),
                      ],
                    ],
                  ),
                ),
                RecordStep(
                  title: l10n.stepText,
                  subtitle: l10n.stepTextSub,
                  onBack: () => _goTo(1),
                  child: Column(
                    children: [
                      TextField(
                        controller: _textController,
                        maxLength: 300,
                        maxLines: 5,
                        onChanged: (_) => setState(() {}),
                        decoration: const InputDecoration(
                          hintText: '여기에 적어보세요',
                        ),
                        style: const TextStyle(
                          color: FuryColors.text,
                          height: 1.7,
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: () => _toggleVoiceRecording(l10n),
                          icon: Icon(
                            _isRecording
                                ? Icons.stop_circle_outlined
                                : _recordedAudioPath == null
                                ? Icons.mic_outlined
                                : Icons.replay_outlined,
                          ),
                          label: Text(
                            _isRecording
                                ? '녹음 중지'
                                : _recordedAudioPath == null
                                ? l10n.voiceInput
                                : '다시 녹음',
                          ),
                        ),
                      ),
                      if (_recordedAudioPath != null && !_isRecording) ...[
                        const SizedBox(height: 8),
                        const Text(
                          '음성 녹음이 저장됐어요.',
                          style: TextStyle(
                            color: FuryColors.faint,
                            fontSize: 12,
                          ),
                        ),
                      ],
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: canContinueText ? () => _goTo(3) : null,
                          child: Text(l10n.next),
                        ),
                      ),
                      const SizedBox(height: 4),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          key: const ValueKey('text-step-skip'),
                          onPressed: () => _goTo(3),
                          child: Text(l10n.skip),
                        ),
                      ),
                    ],
                  ),
                ),
                RecordStep(
                  title: l10n.stepReminder,
                  subtitle: l10n.stepReminderSub,
                  onBack: () => _goTo(2),
                  child: Column(
                    children: [
                      SwitchListTile(
                        value: _reminder != null,
                        onChanged: (value) =>
                            setState(() => _reminder = value ? '30분 후' : null),
                        title: Text(l10n.reminderNotification),
                        subtitle: Text(reminderSubtitle),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Wrap(
                            key: const ValueKey('reminder-option-wrap'),
                            alignment: WrapAlignment.center,
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              for (final option in [
                                '30분 후',
                                '1시간 후',
                                '2시간 후',
                                '6시간 후',
                                '내일',
                              ])
                                FilterChip(
                                  label: Text(option),
                                  selected: _reminder == option,
                                  onSelected: (_) =>
                                      setState(() => _reminder = option),
                                ),
                              FilterChip(
                                key: const ValueKey('custom-reminder-chip'),
                                label: const Text('직접 설정'),
                                selected: _reminder == '직접 설정',
                                onSelected: (_) =>
                                    _showCustomReminderSheet(context),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: canContinueReminder
                              ? () => _goTo(4)
                              : null,
                          child: Text(l10n.next),
                        ),
                      ),
                      const SizedBox(height: 4),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          key: const ValueKey('reminder-step-skip'),
                          onPressed: () => _goTo(4),
                          child: Text(l10n.skip),
                        ),
                      ),
                    ],
                  ),
                ),
                RecordStep(
                  title: l10n.stepSave,
                  subtitle: l10n.stepSaveSub,
                  onBack: () => _goTo(3),
                  child: SummaryCard(
                    rows: {
                      l10n.summaryIntensity: '${rage.emoji} ${rage.label}',
                      l10n.summaryCategory:
                          '${category.emoji} ${category.label}',
                      l10n.summaryText: _textController.text.isEmpty
                          ? l10n.none
                          : _textController.text,
                      '음성': _recordedAudioPath == null ? l10n.none : '녹음 포함',
                      l10n.summaryReminder: _reminder ?? l10n.none,
                    },
                    action: SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        onPressed: _isSaving
                            ? null
                            : () => _saveNoteAndContinue(rage, category),
                        icon: const Icon(Icons.local_fire_department),
                        label: Text(_isSaving ? '저장 중...' : l10n.saveNote),
                      ),
                    ),
                  ),
                ),
                RecordStep(
                  title: l10n.stepPost,
                  subtitle: l10n.stepPostSub,
                  onBack: () => _goTo(4),
                  child: Column(
                    children: [
                      FuryPostCard(
                        emoji: rage.emoji,
                        nickname: l10n.profileName,
                        category: '${category.emoji} ${category.label}',
                        text: _textController.text.isEmpty
                            ? l10n.none
                            : _textController.text,
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton.icon(
                          onPressed: widget.onPost,
                          icon: const Icon(Icons.send_outlined),
                          label: Text(l10n.postIt),
                        ),
                      ),
                      const SizedBox(height: 4),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: widget.onSaveOnly,
                          child: Text(l10n.saveOnly),
                        ),
                      ),
                    ],
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

class RecordStep extends StatelessWidget {
  const RecordStep({
    required this.title,
    required this.subtitle,
    required this.child,
    this.onBack,
    super.key,
  });

  final String title;
  final String subtitle;
  final Widget child;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : MediaQuery.sizeOf(context).width;
        final contentWidth = (availableWidth - 36).clamp(0.0, 324.0);
        const verticalPadding = 30.0;
        return SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(18, 10, 18, 20),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: (constraints.maxHeight - verticalPadding).clamp(
                0.0,
                double.infinity,
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: contentWidth,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (onBack != null) ...[
                      SizedBox(
                        height: 38,
                        child: IconButton.filledTonal(
                          onPressed: onBack,
                          icon: const Icon(Icons.keyboard_arrow_up),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: FuryColors.text,
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      subtitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: FuryColors.faint),
                    ),
                    const SizedBox(height: 22),
                    SizedBox(width: double.infinity, child: child),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class RecordProgressBar extends StatelessWidget {
  const RecordProgressBar({required this.active, super.key});

  final int active;

  @override
  Widget build(BuildContext context) {
    final progress = (active + 1) / 6;

    return Semantics(
      label: 'record progress',
      value: '${active + 1} of 6',
      child: SizedBox(
        height: 4,
        child: Stack(
          fit: StackFit.expand,
          children: [
            const DecoratedBox(
              decoration: BoxDecoration(color: FuryColors.border),
            ),
            TweenAnimationBuilder<double>(
              tween: Tween<double>(end: progress),
              duration: const Duration(milliseconds: 320),
              curve: Curves.easeOutCubic,
              builder: (context, value, child) {
                return FractionallySizedBox(
                  widthFactor: value,
                  alignment: Alignment.centerLeft,
                  child: child,
                );
              },
              child: const DecoratedBox(
                decoration: BoxDecoration(color: FuryColors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReminderWheelPicker extends StatelessWidget {
  const ReminderWheelPicker({
    required this.controller,
    required this.itemCount,
    required this.suffix,
    required this.onSelectedItemChanged,
    super.key,
  });

  final FixedExtentScrollController controller;
  final int itemCount;
  final String suffix;
  final ValueChanged<int> onSelectedItemChanged;

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      scrollController: controller,
      itemExtent: 36,
      magnification: 1.08,
      useMagnifier: true,
      selectionOverlay: Container(
        decoration: BoxDecoration(
          color: FuryColors.red.withValues(alpha: 0.08),
          border: Border.symmetric(
            horizontal: BorderSide(
              color: FuryColors.red.withValues(alpha: 0.22),
            ),
          ),
        ),
      ),
      onSelectedItemChanged: onSelectedItemChanged,
      children: [
        for (var i = 0; i < itemCount; i++)
          Center(
            child: Text(
              '${i.toString().padLeft(2, '0')} $suffix',
              style: const TextStyle(
                color: FuryColors.text,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
      ],
    );
  }
}

class ChoiceGrid extends StatelessWidget {
  const ChoiceGrid({required this.children, super.key});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 284,
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.82,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: children,
        ),
      ),
    );
  }
}

class ChoiceChipCard extends StatelessWidget {
  const ChoiceChipCard({
    required this.selected,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.onTap,
    super.key,
  });

  final bool selected;
  final Color color;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(0, selected ? -3 : 0, 0),
        width: 80,
        height: 112,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: selected
              ? color.withValues(alpha: 0.14)
              : Colors.white.withValues(alpha: 0.05),
          border: Border.all(
            color: selected ? color : Colors.transparent,
            width: selected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: color.withValues(alpha: 0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 6),
                  ),
                ]
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 5),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: selected ? color : FuryColors.muted,
                fontSize: 11,
                height: 1.18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SummaryCard extends StatelessWidget {
  const SummaryCard({required this.rows, required this.action, super.key});

  final Map<String, String> rows;
  final Widget action;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        border: Border.all(color: FuryColors.border),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          for (final entry in rows.entries) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 92,
                  child: Text(
                    entry.key,
                    style: const TextStyle(
                      color: FuryColors.faint,
                      fontSize: 12,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    entry.value,
                    style: const TextStyle(
                      color: Color(0xFFCCCCCC),
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(height: 24, color: FuryColors.divider),
          ],
          action,
        ],
      ),
    );
  }
}
