import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:fury_note/l10n/app_localizations.dart';
import 'package:fury_note/l10n/l10n_extensions.dart';
import 'package:fury_note/src/notes/rage_note.dart';
import 'package:fury_note/src/notes/rage_note_repository.dart';
import 'package:fury_note/widgets/shared_widgets.dart';
import 'package:intl/intl.dart';
import '../main.dart';

class StatsCalendarScreen extends StatefulWidget {
  const StatsCalendarScreen({this.noteRepository, super.key});

  final RageNoteRepository? noteRepository;

  @override
  State<StatsCalendarScreen> createState() => _StatsCalendarScreenState();
}

class _StatsCalendarScreenState extends State<StatsCalendarScreen> {
  List<RageNote> _records = const [];
  bool _loading = true;
  late DateTime _focusedMonth;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _focusedMonth = DateTime(now.year, now.month);
    _selectedDate = DateTime(now.year, now.month, now.day);
    _loadRecords();
  }

  Future<void> _loadRecords() async {
    try {
      final records =
          await (widget.noteRepository ?? RageNoteRepository.instance).getAll();
      if (!mounted) {
        return;
      }
      setState(() {
        _records = records;
        _loading = false;
      });
    } catch (_) {
      if (!mounted) {
        return;
      }
      setState(() => _loading = false);
    }
  }

  void _changeMonth(int delta) {
    setState(() {
      final nextMonth = DateTime(
        _focusedMonth.year,
        _focusedMonth.month + delta,
      );
      _focusedMonth = DateTime(nextMonth.year, nextMonth.month);

      final maxDay = DateUtils.getDaysInMonth(
        _focusedMonth.year,
        _focusedMonth.month,
      );
      final selectedDay = _selectedDate.day.clamp(1, maxDay);
      _selectedDate = DateTime(
        _focusedMonth.year,
        _focusedMonth.month,
        selectedDay,
      );
    });
  }

  List<RageNote> _recordsForDate(DateTime date) {
    final matches =
        _records
            .where((record) => DateUtils.isSameDay(record.createdAt, date))
            .toList()
          ..sort((left, right) => left.createdAt.compareTo(right.createdAt));
    return matches;
  }

  void _selectDate(DateTime date) {
    setState(() {
      _focusedMonth = DateTime(date.year, date.month);
      _selectedDate = date;
    });
  }

  Future<void> _deleteRecord(RageNote record) async {
    final repo = widget.noteRepository ?? RageNoteRepository.instance;
    if (record.id != null) {
      await repo.deleteById(record.id!);
    }
    await _loadRecords();
  }

  @override
  Widget build(BuildContext context) {
    final selectedRecords = _recordsForDate(_selectedDate);
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: FuryColors.phone,
      appBar: AppBar(
        backgroundColor: FuryColors.chrome,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(l10n.statsCalendarTitle),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          if (_loading)
            const LinearProgressIndicator(value: 0.35, minHeight: 2)
          else
            const SizedBox.shrink(),
          const SizedBox(height: 12),
          _StatsCalendarCard(
            month: _focusedMonth,
            selectedDate: _selectedDate,
            records: _records,
            onPreviousMonth: () => _changeMonth(-1),
            onNextMonth: () => _changeMonth(1),
            onDateSelected: _selectDate,
          ),
          const SizedBox(height: 12),
          _SelectedDayRecordList(
            selectedDate: _selectedDate,
            records: selectedRecords,
            onDelete: _deleteRecord,
          ),
        ],
      ),
    );
  }
}

class _StatsCalendarCard extends StatelessWidget {
  const _StatsCalendarCard({
    required this.month,
    required this.selectedDate,
    required this.records,
    required this.onPreviousMonth,
    required this.onNextMonth,
    required this.onDateSelected,
  });

  final DateTime month;
  final DateTime selectedDate;
  final List<RageNote> records;
  final VoidCallback onPreviousMonth;
  final VoidCallback onNextMonth;
  final ValueChanged<DateTime> onDateSelected;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final weekdayFormatter = DateFormat.E(l10n.localeName);
    final weekLabels = [
      for (var i = 0; i < 7; i++)
        weekdayFormatter.format(DateTime.utc(2020, 1, 5 + i)),
    ];
    final monthLabel = l10n.formatMonth(month);
    final firstDay = DateTime(month.year, month.month, 1);
    final leadingDays = firstDay.weekday % 7;
    final totalDays = DateUtils.getDaysInMonth(month.year, month.month);
    final recordCounts = <int, int>{};

    for (final record in records) {
      if (record.createdAt.year == month.year &&
          record.createdAt.month == month.month) {
        recordCounts[record.createdAt.day] =
            (recordCounts[record.createdAt.day] ?? 0) + 1;
      }
    }

    final dayCells = <Widget>[
      for (var i = 0; i < leadingDays; i++) const SizedBox.shrink(),
      for (var day = 1; day <= totalDays; day++)
        _StatsCalendarDayCell(
          date: DateTime(month.year, month.month, day),
          recordCount: recordCounts[day] ?? 0,
          isSelected: DateUtils.isSameDay(
            selectedDate,
            DateTime(month.year, month.month, day),
          ),
          onTap: () => onDateSelected(DateTime(month.year, month.month, day)),
        ),
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: FuryColors.panel,
        border: Border.all(color: FuryColors.border),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: onPreviousMonth,
                icon: const Icon(Icons.chevron_left),
                color: FuryColors.text,
              ),
              Expanded(
                child: Text(
                  monthLabel,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: FuryColors.text,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              IconButton(
                onPressed: onNextMonth,
                icon: const Icon(Icons.chevron_right),
                color: FuryColors.text,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              for (final label in weekLabels)
                Expanded(
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: FuryColors.faint,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 10),
          GridView.count(
            crossAxisCount: 7,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 8,
            crossAxisSpacing: 4,
            childAspectRatio: 0.86,
            children: dayCells,
          ),
        ],
      ),
    );
  }
}

class _StatsCalendarDayCell extends StatelessWidget {
  const _StatsCalendarDayCell({
    required this.date,
    required this.recordCount,
    required this.isSelected,
    required this.onTap,
  });

  final DateTime date;
  final int recordCount;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isToday = DateUtils.isSameDay(date, DateTime.now());
    final dotCount = recordCount.clamp(0, 3);

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        curve: Curves.easeOutCubic,
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? FuryColors.red.withValues(alpha: 0.16) : null,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? FuryColors.red
                : isToday
                ? FuryColors.orange.withValues(alpha: 0.55)
                : Colors.transparent,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context).formatInteger(date.day),
              style: TextStyle(
                color: isSelected ? FuryColors.text : FuryColors.muted,
                fontSize: 13,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 4),
            if (dotCount > 0)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 0; i < dotCount; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1.2),
                      child: Container(
                        width: 4,
                        height: 4,
                        decoration: const BoxDecoration(
                          color: FuryColors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              )
            else
              const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}

class _SelectedDayRecordList extends StatelessWidget {
  const _SelectedDayRecordList({
    required this.selectedDate,
    required this.records,
    required this.onDelete,
  });

  final DateTime selectedDate;
  final List<RageNote> records;
  final Future<void> Function(RageNote record) onDelete;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final dateLabel = l10n.formatShortDate(selectedDate);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: FuryColors.panel,
        border: Border.all(color: FuryColors.border),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.selectedDateRecordsTitle(dateLabel),
            style: const TextStyle(
              color: FuryColors.text,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 12),
          if (records.isEmpty)
            Text(
              l10n.noRecordsOnSelectedDate,
              style: const TextStyle(color: FuryColors.faint),
            )
          else
            for (final record in records) ...[
              _StatsRecordTile(
                key: ValueKey(record.id),
                record: record,
                onDelete: () => onDelete(record),
              ),
              const SizedBox(height: 10),
            ],
        ],
      ),
    );
  }
}

class _StatsRecordTile extends StatefulWidget {
  const _StatsRecordTile({
    required this.record,
    required this.onDelete,
    super.key,
  });

  final RageNote record;
  final VoidCallback onDelete;

  @override
  State<_StatsRecordTile> createState() => _StatsRecordTileState();
}

class _StatsRecordTileState extends State<_StatsRecordTile> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  bool get _hasAudio =>
      widget.record.audioPath != null && widget.record.audioPath!.isNotEmpty;

  bool get _hasReminder => widget.record.reminderAt != null;

  @override
  void initState() {
    super.initState();
    _audioPlayer.onPlayerStateChanged.listen((state) {
      if (mounted) {
        setState(() {
          _isPlaying = state == PlayerState.playing;
        });
      }
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _togglePlayback() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(DeviceFileSource(widget.record.audioPath!));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final timeLabel = l10n.formatTime(widget.record.createdAt);
    final categoryLabel = widget.record.categoryKey == 'custom'
        ? widget.record.categoryLabel
        : l10n.categoryName(widget.record.categoryKey);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FuryPostCard(
          emoji: widget.record.rageEmoji,
          nickname: '',
          category: '${widget.record.categoryEmoji} $categoryLabel',
          text: widget.record.body,
          showAuthor: false,
          createdTimeLabel: timeLabel,
          isMine: true,
          onDelete: widget.onDelete,
          deleteTitle: l10n.deleteConfirm,
          deleteContent: '',
        ),
        if (_hasReminder || _hasAudio)
          Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: Wrap(
              spacing: 8,
              runSpacing: 4,
              children: [
                if (_hasReminder)
                  FuryPostAction(
                    icon: Icons.calendar_today,
                    label: l10n.reminderAction,
                  ),
                if (_hasAudio)
                  FuryPostAction(
                    icon: _isPlaying ? Icons.pause : Icons.play_arrow,
                    label: _isPlaying ? l10n.pause : l10n.play,
                    isActive: _isPlaying,
                    onPressed: _togglePlayback,
                  ),
              ],
            ),
          ),
      ],
    );
  }
}
