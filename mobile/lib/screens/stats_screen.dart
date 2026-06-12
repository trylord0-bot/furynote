import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:fury_note/l10n/app_localizations.dart';
import 'package:fury_note/src/notes/rage_note.dart';
import 'package:fury_note/src/notes/rage_note_repository.dart';
import '../main.dart';
import '../widgets/shared_widgets.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({this.noteRepository, super.key});

  final RageNoteRepository? noteRepository;

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  List<RageNote> _records = const [];
  String _range = 'week';
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

  List<RageNote> _filteredRecords() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    return switch (_range) {
      'week' =>
        _records
            .where(
              (record) => !record.createdAt.isBefore(
                today.subtract(const Duration(days: 6)),
              ),
            )
            .toList(),
      'month' =>
        _records
            .where(
              (record) =>
                  record.createdAt.year == now.year &&
                  record.createdAt.month == now.month,
            )
            .toList(),
      _ => List<RageNote>.of(_records),
    };
  }

  String _highestLevelLabel(List<RageNote> records) {
    if (records.isEmpty) {
      return '-';
    }
    final highest = records.reduce(
      (left, right) => left.rageLevel >= right.rageLevel ? left : right,
    );
    return '${highest.rageEmoji} ${highest.rageLabel}';
  }

  String _dailyAverageLabel(List<RageNote> records) {
    if (records.isEmpty) {
      return '0.0';
    }
    final dayCount = switch (_range) {
      'week' => 7,
      'month' => DateTime.now().day,
      _ =>
        records
            .map(
              (record) => DateTime(
                record.createdAt.year,
                record.createdAt.month,
                record.createdAt.day,
              ),
            )
            .toSet()
            .length
            .clamp(1, 100000),
    };
    return (records.length / dayCount).toStringAsFixed(1);
  }

  List<double> _weeklyIntensityBars() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    return [
      for (var i = 6; i >= 0; i--)
        _averageIntensityForDate(today.subtract(Duration(days: i))) / 5,
    ];
  }

  double _averageIntensityForDate(DateTime date) {
    final records = _recordsForDate(date);
    if (records.isEmpty) {
      return 0;
    }
    final total = records.fold<int>(0, (sum, note) => sum + note.rageLevel);
    return total / records.length;
  }

  List<double> _categoryDistributionBars(List<RageNote> records) {
    if (records.isEmpty) {
      return const [0, 0, 0, 0, 0];
    }
    final counts = <String, int>{};
    for (final record in records) {
      counts[record.categoryLabel] = (counts[record.categoryLabel] ?? 0) + 1;
    }
    final sorted = counts.values.toList()..sort((a, b) => b.compareTo(a));
    final maxCount = sorted.first;
    return [
      for (final count in sorted.take(5)) count / maxCount,
      for (var i = sorted.length; i < 5; i++) 0,
    ];
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
    final l10n = AppLocalizations.of(context);
    final selectedRecords = _recordsForDate(_selectedDate);
    final filteredRecords = _filteredRecords();

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        SectionHeader(
          title: l10n.statsTitle,
          subtitle: l10n.statsSubtitle,
          showTitle: false,
          showSubtitle: false,
        ),
        const SizedBox(height: 12),
        SegmentedButton<String>(
          segments: [
            ButtonSegment(value: 'week', label: Text(l10n.week)),
            ButtonSegment(value: 'month', label: Text(l10n.month)),
            ButtonSegment(value: 'all', label: Text(l10n.all)),
          ],
          selected: {_range},
          onSelectionChanged: (value) => setState(() => _range = value.single),
        ),
        const SizedBox(height: 16),
        if (_loading)
          const LinearProgressIndicator(value: 0.35, minHeight: 2)
        else
          const SizedBox.shrink(),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: MetricTile(
                label: l10n.totalRecords,
                value: '${filteredRecords.length}',
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: MetricTile(
                label: l10n.highestLevel,
                value: _highestLevelLabel(filteredRecords),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: MetricTile(
                label: l10n.dailyAverage,
                value: _dailyAverageLabel(filteredRecords),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ChartPanel(title: '분노 강도 추이', bars: _weeklyIntensityBars()),
        const SizedBox(height: 12),
        ChartPanel(
          title: '원인별 분포',
          bars: _categoryDistributionBars(filteredRecords),
        ),
        const SizedBox(height: 16),
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
    );
  }
}

class MetricTile extends StatelessWidget {
  const MetricTile({required this.label, required this.value, super.key});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 98,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: BoxDecoration(
          color: FuryColors.panel,
          border: Border.all(color: FuryColors.border),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              label,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: FuryColors.faint, fontSize: 11),
            ),
            const SizedBox(height: 6),
            Text(
              value,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: FuryColors.text,
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChartPanel extends StatelessWidget {
  const ChartPanel({required this.title, required this.bars, super.key});

  final String title;
  final List<double> bars;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: FuryColors.panel,
        border: Border.all(color: FuryColors.border),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: FuryColors.text,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 120,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final bar in bars)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: FractionallySizedBox(
                        heightFactor: bar,
                        alignment: Alignment.bottomCenter,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: FuryColors.orange,
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
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
    final weekLabels = Localizations.localeOf(context).languageCode == 'en'
        ? const ['S', 'M', 'T', 'W', 'T', 'F', 'S']
        : const ['일', '월', '화', '수', '목', '금', '토'];
    final monthLabel = '${month.year}. ${month.month}';
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
              '${date.day}',
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
    final dateLabel =
        '${selectedDate.year}. ${selectedDate.month}. ${selectedDate.day}';

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
            '$dateLabel 기록',
            style: const TextStyle(
              color: FuryColors.text,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 12),
          if (records.isEmpty)
            const Text(
              '선택한 날짜에 작성된 기록이 없습니다.',
              style: TextStyle(color: FuryColors.faint),
            )
          else
            for (final record in records) ...[
              Dismissible(
                key: ValueKey(record.id),
                direction: DismissDirection.endToStart,
                background: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 24),
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: FuryColors.red,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(Icons.delete, color: Colors.white, size: 24),
                ),
                confirmDismiss: (_) async {
                  return await showDialog<bool>(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      backgroundColor: FuryColors.panel,
                      title: Text(
                        l10n.deleteConfirm,
                        style: const TextStyle(color: FuryColors.text),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(ctx, false),
                          child: Text(
                            l10n.cancel,
                            style: const TextStyle(color: FuryColors.muted),
                          ),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(ctx, true),
                          child: Text(
                            l10n.delete,
                            style: const TextStyle(color: FuryColors.red),
                          ),
                        ),
                      ],
                    ),
                  ) ?? false;
                },
                onDismissed: (_) => onDelete(record),
                child: _StatsRecordTile(record: record),
              ),
              const SizedBox(height: 10),
            ],
        ],
      ),
    );
  }
}

class _StatsRecordTile extends StatefulWidget {
  const _StatsRecordTile({required this.record});

  final RageNote record;

  @override
  State<_StatsRecordTile> createState() => _StatsRecordTileState();
}

class _StatsRecordTileState extends State<_StatsRecordTile> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  bool get _hasAudio =>
      widget.record.audioPath != null &&
      widget.record.audioPath!.isNotEmpty;

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
    final timeLabel =
        '${widget.record.createdAt.hour.toString().padLeft(2, '0')}:${widget.record.createdAt.minute.toString().padLeft(2, '0')}';

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        border: Border.all(color: FuryColors.border),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              timeLabel,
              style: const TextStyle(color: FuryColors.faint, fontSize: 11),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.record.body.isEmpty
                ? l10n.noContent
                : widget.record.body,
            style: const TextStyle(
              color: Color(0xFFCCCCCC),
              fontSize: 13,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: FuryColors.red.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${widget.record.categoryEmoji} ${widget.record.categoryLabel}',
                  style: const TextStyle(
                    color: FuryColors.red,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Spacer(),
              if (_hasReminder)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: FuryColors.yellow.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.calendar_today,
                    size: 12,
                    color: FuryColors.yellow,
                  ),
                ),
              if (_hasReminder && _hasAudio) const SizedBox(width: 6),
              if (_hasAudio)
                GestureDetector(
                  onTap: _togglePlayback,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: FuryColors.orange.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      _isPlaying ? Icons.pause : Icons.play_arrow,
                      size: 14,
                      color: FuryColors.orange,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
