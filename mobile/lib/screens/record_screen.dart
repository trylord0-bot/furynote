import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fury_note/l10n/app_localizations.dart';
import 'package:fury_note/l10n/l10n_extensions.dart';
import 'package:fury_note/src/analytics/app_analytics.dart';
import 'package:fury_note/src/api/api_client.dart';
import 'package:fury_note/src/api/api_error_messages.dart';
import 'package:fury_note/src/api/feed_service.dart';
import 'package:fury_note/src/audio/voice_recorder.dart';
import 'package:fury_note/src/notes/rage_note.dart';
import 'package:fury_note/src/notes/rage_note_repository.dart';
import 'package:fury_note/src/notifications/notification_settings.dart';
import 'package:fury_note/src/notifications/reminder_notification_service.dart';
import 'package:fury_note/src/profile/app_profile.dart';
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
    this.feedService,
    this.noteRepository,
    this.notificationSettingsStore,
    this.reminderScheduler,
    this.voiceRecorder,
    this.analytics = const NoopAppAnalytics(),
    super.key,
  });

  final VoidCallback? onPost;
  final VoidCallback? onSaveOnly;
  final FeedService? feedService;
  final RageNoteRepository? noteRepository;
  final NotificationSettingsStore? notificationSettingsStore;
  final ReminderScheduler? reminderScheduler;
  final FuryVoiceRecorder? voiceRecorder;
  final AppAnalytics analytics;

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
  bool _isPosting = false;

  static const _reminder30m = '30m';
  static const _reminder1h = '1h';
  static const _reminder2h = '2h';
  static const _reminder6h = '6h';
  static const _reminderTomorrow = 'tomorrow';
  static const _reminderCustom = 'custom';

  static const _funnelSteps = [
    'intensity',
    'category',
    'content',
    'reminder',
    'save',
    'post',
  ];

  @override
  void initState() {
    super.initState();
    _trackFunnelStep(0);
  }

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
    _trackFunnelStep(step);
    _controller.animateToPage(
      step,
      duration: const Duration(milliseconds: 320),
      curve: Curves.easeOutCubic,
    );
  }

  void _trackFunnelStep(int step) {
    _logAnalyticsEvent(
      'record_funnel_step',
      parameters: {'step': _funnelSteps[step], 'step_index': step},
    );
  }

  void _logAnalyticsEvent(String name, {Map<String, Object>? parameters}) {
    unawaited(
      Future<void>(() async {
        try {
          await widget.analytics.logEvent(name, parameters: parameters);
        } catch (_) {
          return;
        }
      }),
    );
  }

  Future<void> _showCustomReminderSheet(BuildContext context) async {
    final l10n = AppLocalizations.of(context);
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
                              suffix: l10n.hourSuffix,
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
                              suffix: l10n.minuteSuffix,
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
                            child: Text(l10n.cancel),
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
                                _reminder = _reminderCustom;
                              });
                              Navigator.of(sheetContext).pop();
                            },
                            child: Text(l10n.save),
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
      _reminder30m => now.add(const Duration(minutes: 30)),
      _reminder1h => now.add(const Duration(hours: 1)),
      _reminder2h => now.add(const Duration(hours: 2)),
      _reminder6h => now.add(const Duration(hours: 6)),
      _reminderTomorrow => now.add(const Duration(days: 1)),
      _reminderCustom => _customReminderDateTime,
      _ => null,
    };
  }

  String? _reminderLabel(AppLocalizations l10n, String? reminder) {
    return switch (reminder) {
      _reminder30m => l10n.reminderIn30Minutes,
      _reminder1h => l10n.reminderIn1Hour,
      _reminder2h => l10n.reminderIn2Hours,
      _reminder6h => l10n.reminderIn6Hours,
      _reminderTomorrow => l10n.reminderTomorrow,
      _reminderCustom => l10n.reminderCustom,
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
        FurySnackBar.show(
          context,
          l10n.recordMicPermissionRequired,
          isError: true,
        );
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
      FurySnackBar.show(
        context,
        l10n.recordVoiceStartFailed(l10n.voiceInput),
        isError: true,
      );
    }
  }

  Future<void> _postToFeed(
    AppLocalizations l10n,
    RageChoice rage,
    CategoryChoice category,
  ) async {
    final categoryValue =
        category.key == 'custom' &&
            _customCategoryController.text.trim().isNotEmpty
        ? _customCategoryController.text.trim()
        : category.key;
    final text = _textController.text.trim();

    setState(() => _isPosting = true);
    try {
      await (widget.feedService ?? FeedService.instance).createPost(
        nickname: AppProfileController.instance.displayName(
          fallback: l10n.profileName,
        ),
        profileCode: AppProfileController.instance.profileCode,
        rageLevel: rage.level,
        category: categoryValue,
        text: text.isEmpty ? null : text,
      );
      final savedNoteId = _savedNoteId;
      if (savedNoteId != null) {
        await (widget.noteRepository ?? RageNoteRepository.instance).markPosted(
          savedNoteId,
        );
      }
      _logAnalyticsEvent(
        'feed_post_created',
        parameters: {
          'source': 'record_funnel',
          'rage_level': rage.level,
          'category': categoryValue,
          'has_text': text.isNotEmpty,
        },
      );
      widget.onPost?.call();
    } on ApiException catch (e) {
      if (!mounted) return;
      FurySnackBar.show(
        context,
        localizedApiErrorMessage(l10n, e),
        isError: true,
      );
    } catch (_) {
      if (!mounted) return;
      FurySnackBar.show(context, l10n.feedPostFailedToast, isError: true);
    } finally {
      if (mounted) setState(() => _isPosting = false);
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
    final l10n = AppLocalizations.of(context);
    final body = _textController.text.trim();
    final reminderAt = _selectedReminderDateTime();
    var audioPath = _recordedAudioPath;
    try {
      if (_isRecording) {
        audioPath = await _voiceRecorder.stop();
        if (!mounted) {
          return;
        }
        setState(() {
          _isRecording = false;
          _recordedAudioPath = audioPath;
        });
      }

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
              audioPath: audioPath,
              reminderAt: reminderAt,
            ),
          );
      final reminderSchedule = reminderAt != null
          ? _scheduleReminderAfterSave(
              id: id,
              scheduledAt: reminderAt,
              body: body.isEmpty ? l10n.reminderNotificationFallbackBody : body,
            )
          : null;
      if (!mounted) {
        return;
      }
      _logAnalyticsEvent(
        'record_saved',
        parameters: {
          'rage_level': rage.level,
          'category': category.key,
          'has_text': body.isNotEmpty,
          'has_audio': audioPath != null,
          'has_reminder': reminderAt != null,
        },
      );
      setState(() => _savedNoteId = id);
      _goTo(5);
      if (reminderSchedule != null) {
        unawaited(reminderSchedule);
      }
    } catch (_) {
      if (!mounted) {
        return;
      }
      FurySnackBar.show(context, l10n.recordSaveFailedToast, isError: true);
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  Future<void> _scheduleReminderAfterSave({
    required int id,
    required DateTime scheduledAt,
    required String body,
  }) async {
    try {
      final reminderNotificationsEnabled =
          await (widget.notificationSettingsStore ??
                  NotificationSettingsStore.instance)
              .isReminderEnabled();
      if (!reminderNotificationsEnabled) {
        return;
      }
      await (widget.reminderScheduler ?? LocalReminderScheduler.instance)
          .scheduleRageReminder(id: id, scheduledAt: scheduledAt, body: body);
    } catch (_) {
      return;
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
        !_isRecording &&
        (_textController.text.trim().isNotEmpty || _recordedAudioPath != null);
    final canContinueReminder = _reminder != null;

    final reminderSubtitle =
        _reminder == _reminderCustom && _customReminderDateTime != null
        ? l10n.formatDateTime(_customReminderDateTime!)
        : _reminderLabel(l10n, _reminder) ?? l10n.noReminder;

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
                          decoration: InputDecoration(
                            labelText: l10n.recordCustomCategoryHint,
                          ),
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
                        decoration: InputDecoration(
                          hintText: l10n.recordTextHint,
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
                                ? l10n.recordVoiceStopRecording
                                : _recordedAudioPath == null
                                ? l10n.voiceInput
                                : l10n.recordVoiceRecordAgain,
                          ),
                        ),
                      ),
                      if (_recordedAudioPath != null && !_isRecording) ...[
                        const SizedBox(height: 8),
                        Text(
                          l10n.recordVoiceSaved,
                          style: const TextStyle(
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
                          onPressed: _isRecording ? null : () => _goTo(3),
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
                        onChanged: (value) => setState(
                          () => _reminder = value ? _reminder30m : null,
                        ),
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
                                (_reminder30m, l10n.reminderIn30Minutes),
                                (_reminder1h, l10n.reminderIn1Hour),
                                (_reminder2h, l10n.reminderIn2Hours),
                                (_reminder6h, l10n.reminderIn6Hours),
                                (_reminderTomorrow, l10n.reminderTomorrow),
                              ])
                                FilterChip(
                                  label: Text(option.$2),
                                  selected: _reminder == option.$1,
                                  onSelected: (_) =>
                                      setState(() => _reminder = option.$1),
                                ),
                              FilterChip(
                                key: const ValueKey('custom-reminder-chip'),
                                label: Text(l10n.reminderCustom),
                                selected: _reminder == _reminderCustom,
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
                          ? l10n.noContent
                          : _textController.text,
                      l10n.recordAudioSummaryLabel: _recordedAudioPath == null
                          ? l10n.none
                          : l10n.recordAudioIncluded,
                      l10n.summaryReminder:
                          _reminderLabel(l10n, _reminder) ?? l10n.none,
                    },
                    action: SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        onPressed: _isSaving
                            ? null
                            : () => _saveNoteAndContinue(rage, category),
                        icon: const Icon(Icons.local_fire_department),
                        label: Text(
                          _isSaving
                              ? l10n.recordSavingInProgress
                              : l10n.saveNote,
                        ),
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
                      AnimatedBuilder(
                        animation: AppProfileController.instance,
                        builder: (context, _) {
                          return FuryPostCard(
                            emoji: rage.emoji,
                            nickname: AppProfileController.instance.displayName(
                              fallback: l10n.profileName,
                            ),
                            profileCode:
                                AppProfileController.instance.profileCode,
                            category: '${category.emoji} ${category.label}',
                            text: _textController.text.trim(),
                            showProfileAvatar: true,
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton.icon(
                          onPressed: _isPosting
                              ? null
                              : () => _postToFeed(l10n, rage, category),
                          icon: const Icon(Icons.send_outlined),
                          label: Text(
                            _isPosting
                                ? l10n.recordPostingInProgress
                                : l10n.postIt,
                          ),
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

class RecordStep extends StatefulWidget {
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
  State<RecordStep> createState() => _RecordStepState();
}

class _RecordStepState extends State<RecordStep> {
  Offset? _dragStart;
  bool _backSwipeTriggered = false;

  void _handlePointerDown(PointerDownEvent event) {
    _dragStart = event.position;
    _backSwipeTriggered = false;
  }

  void _handlePointerMove(PointerMoveEvent event) {
    final onBack = widget.onBack;
    final dragStart = _dragStart;
    if (onBack == null || dragStart == null || _backSwipeTriggered) {
      return;
    }

    final delta = event.position - dragStart;
    final isDownSwipe = delta.dy > 72 && delta.dy > delta.dx.abs() * 1.4;
    if (!isDownSwipe) {
      return;
    }

    _backSwipeTriggered = true;
    onBack();
  }

  void _handlePointerEnd(PointerEvent event) {
    _dragStart = null;
    _backSwipeTriggered = false;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : MediaQuery.sizeOf(context).width;
        final contentWidth = (availableWidth - 36).clamp(0.0, 324.0);
        const verticalPadding = 30.0;
        return Listener(
          behavior: HitTestBehavior.translucent,
          onPointerDown: widget.onBack == null ? null : _handlePointerDown,
          onPointerMove: widget.onBack == null ? null : _handlePointerMove,
          onPointerUp: widget.onBack == null ? null : _handlePointerEnd,
          onPointerCancel: widget.onBack == null ? null : _handlePointerEnd,
          child: SingleChildScrollView(
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
                      if (widget.onBack != null) ...[
                        SizedBox(
                          height: 38,
                          child: IconButton.filledTonal(
                            onPressed: widget.onBack,
                            icon: const Icon(Icons.keyboard_arrow_up),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                      Text(
                        widget.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: FuryColors.text,
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.subtitle,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: FuryColors.faint),
                      ),
                      const SizedBox(height: 22),
                      SizedBox(width: double.infinity, child: widget.child),
                    ],
                  ),
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
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 10,
          runSpacing: 10,
          children: [
            for (final child in children)
              SizedBox(width: 88, height: 112, child: child),
          ],
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
