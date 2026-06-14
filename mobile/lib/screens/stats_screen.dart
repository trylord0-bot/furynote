import 'dart:math' as math;

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

  List<_IntensityPoint> _intensityPoints() {
    return switch (_range) {
      'week' => _weeklyIntensityPoints(),
      'month' => _monthlyIntensityPoints(),
      _ => _allIntensityPoints(),
    };
  }

  List<_IntensityPoint> _weeklyIntensityPoints() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    return [
      for (var i = 6; i >= 0; i--)
        _IntensityPoint(
          label: _monthDayLabel(today.subtract(Duration(days: i))),
          value: _averageIntensityForDate(today.subtract(Duration(days: i))),
        ),
    ];
  }

  List<_IntensityPoint> _monthlyIntensityPoints() {
    final now = DateTime.now();
    return [
      for (var day = 1; day <= now.day; day++)
        _IntensityPoint(
          label: _sparseDayLabel(day, now.day),
          value: _averageIntensityForDate(DateTime(now.year, now.month, day)),
        ),
    ];
  }

  List<_IntensityPoint> _allIntensityPoints() {
    if (_records.isEmpty) {
      return const [];
    }

    final recordsByDay = <DateTime, List<RageNote>>{};
    for (final record in _records) {
      final day = DateTime(
        record.createdAt.year,
        record.createdAt.month,
        record.createdAt.day,
      );
      recordsByDay.putIfAbsent(day, () => []).add(record);
    }

    final days = recordsByDay.keys.toList()..sort();
    return [
      for (var i = 0; i < days.length; i++)
        _IntensityPoint(
          label: _sparseDateLabel(days[i], i, days.length),
          value: _averageIntensityForRecords(recordsByDay[days[i]]!),
        ),
    ];
  }

  double _averageIntensityForDate(DateTime date) {
    return _averageIntensityForRecords(_recordsForDate(date));
  }

  double _averageIntensityForRecords(List<RageNote> records) {
    if (records.isEmpty) {
      return 0;
    }
    final total = records.fold<int>(0, (sum, note) => sum + note.rageLevel);
    return total / records.length;
  }

  String _monthDayLabel(DateTime date) => '${date.month}/${date.day}';

  String _sparseDayLabel(int day, int totalDays) {
    if (totalDays <= 12 || day == 1 || day == totalDays || day % 7 == 0) {
      return '$day';
    }
    return '';
  }

  String _sparseDateLabel(DateTime date, int index, int totalCount) {
    if (totalCount <= 7 || index == 0 || index == totalCount - 1) {
      return _monthDayLabel(date);
    }

    final interval = (totalCount / 6).ceil().clamp(1, totalCount);
    if (index % interval == 0) {
      return _monthDayLabel(date);
    }

    return '';
  }

  List<_CategorySlice> _categoryDistributionSlices(List<RageNote> records) {
    if (records.isEmpty) {
      return const [];
    }
    final counts = <String, ({String label, int count})>{};
    for (final record in records) {
      final key = '${record.categoryEmoji} ${record.categoryLabel}';
      counts[key] = (label: key, count: (counts[key]?.count ?? 0) + 1);
    }
    final sorted = counts.values.toList()
      ..sort((a, b) => b.count.compareTo(a.count));
    final visible = sorted.take(4).toList();
    final remainingCount = sorted
        .skip(4)
        .fold<int>(0, (sum, category) => sum + category.count);
    final chartItems = [
      ...visible,
      if (remainingCount > 0) (label: '기타', count: remainingCount),
    ];

    return [
      for (var i = 0; i < chartItems.length; i++)
        _CategorySlice(
          label: chartItems[i].label,
          count: chartItems[i].count,
          color: _categoryChartColors[i % _categoryChartColors.length],
        ),
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
        _LineChartPanel(title: '분노 강도 추이', points: _intensityPoints()),
        const SizedBox(height: 12),
        _PieChartPanel(
          title: '원인별 분포',
          slices: _categoryDistributionSlices(filteredRecords),
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

const _categoryChartColors = <Color>[
  FuryColors.red,
  FuryColors.orange,
  FuryColors.yellow,
  Color(0xFF64B4FF),
  Color(0xFFA8D8A8),
];

class _IntensityPoint {
  const _IntensityPoint({required this.label, required this.value});

  final String label;
  final double value;
}

class _CategorySlice {
  const _CategorySlice({
    required this.label,
    required this.count,
    required this.color,
  });

  final String label;
  final int count;
  final Color color;
}

class _LineChartPanel extends StatelessWidget {
  const _LineChartPanel({required this.title, required this.points});

  final String title;
  final List<_IntensityPoint> points;

  @override
  Widget build(BuildContext context) {
    final animationKey = ValueKey(
      'line-${points.map((point) => point.value.toStringAsFixed(2)).join(',')}',
    );

    return _ChartShell(
      title: title,
      child: TweenAnimationBuilder<double>(
        key: animationKey,
        tween: Tween(begin: 0, end: 1),
        duration: const Duration(milliseconds: 760),
        curve: Curves.easeOutCubic,
        builder: (context, progress, _) {
          return Column(
            children: [
              SizedBox(
                height: 126,
                width: double.infinity,
                child: CustomPaint(
                  key: const ValueKey('stats-intensity-line-chart'),
                  painter: _IntensityLinePainter(
                    points: points,
                    progress: progress,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  for (final point in points)
                    Expanded(
                      child: Text(
                        point.label,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        softWrap: false,
                        style: const TextStyle(
                          color: FuryColors.faint,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class _PieChartPanel extends StatelessWidget {
  const _PieChartPanel({required this.title, required this.slices});

  final String title;
  final List<_CategorySlice> slices;

  @override
  Widget build(BuildContext context) {
    final total = slices.fold<int>(0, (sum, slice) => sum + slice.count);
    final animationKey = ValueKey(
      'pie-${slices.map((slice) => '${slice.label}:${slice.count}').join(',')}',
    );

    return _ChartShell(
      title: title,
      child: Column(
        children: [
          TweenAnimationBuilder<double>(
            key: animationKey,
            tween: Tween(begin: 0, end: 1),
            duration: const Duration(milliseconds: 820),
            curve: Curves.easeOutCubic,
            builder: (context, progress, _) {
              return SizedBox(
                height: 148,
                width: double.infinity,
                child: CustomPaint(
                  key: const ValueKey('stats-category-pie-chart'),
                  painter: _CategoryPiePainter(
                    slices: slices,
                    total: total,
                    progress: progress,
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          if (slices.isEmpty)
            const Text(
              '표시할 기록이 없습니다.',
              style: TextStyle(color: FuryColors.faint, fontSize: 12),
            )
          else
            Wrap(
              spacing: 10,
              runSpacing: 8,
              children: [
                for (final slice in slices)
                  _PieLegendChip(slice: slice, total: total),
              ],
            ),
        ],
      ),
    );
  }
}

class _ChartShell extends StatelessWidget {
  const _ChartShell({required this.title, required this.child});

  final String title;
  final Widget child;

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
          const SizedBox(height: 18),
          child,
        ],
      ),
    );
  }
}

class _PieLegendChip extends StatelessWidget {
  const _PieLegendChip({required this.slice, required this.total});

  final _CategorySlice slice;
  final int total;

  @override
  Widget build(BuildContext context) {
    final percent = total == 0 ? 0 : (slice.count / total * 100).round();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.045),
        border: Border.all(color: FuryColors.border),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 9,
            height: 9,
            decoration: BoxDecoration(
              color: slice.color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 7),
          Text(
            '${slice.label} $percent%',
            style: const TextStyle(
              color: FuryColors.muted,
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _IntensityLinePainter extends CustomPainter {
  const _IntensityLinePainter({required this.points, required this.progress});

  final List<_IntensityPoint> points;
  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final plot = Rect.fromLTWH(8, 8, size.width - 16, size.height - 20);
    final gridPaint = Paint()
      ..color = FuryColors.border.withValues(alpha: 0.8)
      ..strokeWidth = 1;

    for (var i = 0; i <= 4; i++) {
      final y = plot.top + plot.height * i / 4;
      canvas.drawLine(Offset(plot.left, y), Offset(plot.right, y), gridPaint);
    }

    final baselinePaint = Paint()
      ..color = FuryColors.faint.withValues(alpha: 0.35)
      ..strokeWidth = 1.2;
    canvas.drawLine(
      Offset(plot.left, plot.bottom),
      Offset(plot.right, plot.bottom),
      baselinePaint,
    );

    if (points.isEmpty) {
      return;
    }

    final offsets = <Offset>[
      for (var i = 0; i < points.length; i++)
        Offset(
          points.length == 1
              ? plot.center.dx
              : plot.left + (plot.width * i / (points.length - 1)),
          plot.bottom -
              plot.height * (points[i].value / 5).clamp(0, 1) * progress,
        ),
    ];

    final linePath = Path()..moveTo(offsets.first.dx, offsets.first.dy);
    for (var i = 1; i < offsets.length; i++) {
      final previous = offsets[i - 1];
      final current = offsets[i];
      final controlX = (previous.dx + current.dx) / 2;
      linePath.cubicTo(
        controlX,
        previous.dy,
        controlX,
        current.dy,
        current.dx,
        current.dy,
      );
    }

    final fillPath = Path.from(linePath)
      ..lineTo(offsets.last.dx, plot.bottom)
      ..lineTo(offsets.first.dx, plot.bottom)
      ..close();
    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          FuryColors.red.withValues(alpha: 0.28 * progress),
          FuryColors.orange.withValues(alpha: 0.04 * progress),
        ],
      ).createShader(plot);
    canvas.drawPath(fillPath, fillPaint);

    final glowPaint = Paint()
      ..color = FuryColors.red.withValues(alpha: 0.18)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = 7;
    canvas.drawPath(linePath, glowPaint);

    final linePaint = Paint()
      ..shader = const LinearGradient(
        colors: [FuryColors.yellow, FuryColors.orange, FuryColors.red],
      ).createShader(plot)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = 3;
    canvas.drawPath(linePath, linePaint);

    for (final offset in offsets) {
      canvas.drawCircle(offset, 4.8, Paint()..color = FuryColors.phone);
      canvas.drawCircle(offset, 3.2, Paint()..color = FuryColors.yellow);
    }
  }

  @override
  bool shouldRepaint(_IntensityLinePainter oldDelegate) {
    return oldDelegate.points != points || oldDelegate.progress != progress;
  }
}

class _CategoryPiePainter extends CustomPainter {
  const _CategoryPiePainter({
    required this.slices,
    required this.total,
    required this.progress,
  });

  final List<_CategorySlice> slices;
  final int total;
  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final side = math.min(size.width, size.height);
    final center = Offset(size.width / 2, size.height / 2);
    final radius = side / 2 - 6;
    final strokeWidth = math.max(18.0, radius * 0.34);
    final rect = Rect.fromCircle(
      center: center,
      radius: radius - strokeWidth / 2,
    );
    final trackPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.055)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius - strokeWidth / 2, trackPaint);

    if (slices.isEmpty || total == 0) {
      _drawPieCenterLabel(canvas, center, '0');
      return;
    }

    var start = -math.pi / 2;
    final gap = slices.length == 1 ? 0.0 : 0.035;
    for (final slice in slices) {
      final fullSweep = (slice.count / total) * math.pi * 2;
      final sweep = math.max(0.0, fullSweep * progress - gap);
      final paint = Paint()
        ..color = slice.color
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;
      canvas.drawArc(rect, start, sweep, false, paint);
      start += fullSweep * progress;
    }

    _drawPieCenterLabel(canvas, center, '$total');
  }

  void _drawPieCenterLabel(Canvas canvas, Offset center, String text) {
    final painter = TextPainter(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          color: FuryColors.text,
          fontSize: 22,
          fontWeight: FontWeight.w900,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    )..layout();
    painter.paint(
      canvas,
      center - Offset(painter.width / 2, painter.height / 2),
    );
  }

  @override
  bool shouldRepaint(_CategoryPiePainter oldDelegate) {
    return oldDelegate.slices != slices ||
        oldDelegate.total != total ||
        oldDelegate.progress != progress;
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
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 24,
                  ),
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
                      ) ??
                      false;
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
            widget.record.body.isEmpty ? l10n.noContent : widget.record.body,
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
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
