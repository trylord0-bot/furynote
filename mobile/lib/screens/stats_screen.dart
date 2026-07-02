import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:fury_note/l10n/app_localizations.dart';
import 'package:fury_note/l10n/l10n_extensions.dart';
import 'package:fury_note/screens/stats_calendar_screen.dart';
import 'package:fury_note/src/notes/rage_note.dart';
import 'package:fury_note/src/notes/rage_note_repository.dart';
import '../main.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({this.noteRepository, super.key});

  final RageNoteRepository? noteRepository;

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen>
    with SingleTickerProviderStateMixin {
  List<RageNote> _records = const [];
  late TabController _tabController;
  bool _loading = true;

  static const _ranges = ['week', 'month', 'all'];
  String get _range => _ranges[_tabController.index];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) setState(() {});
    });
    _loadRecords();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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

  String _dailyAverageLabel(AppLocalizations l10n, List<RageNote> records) {
    if (records.isEmpty) {
      return l10n.formatDecimal(0);
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
    return l10n.formatDecimal(records.length / dayCount);
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
          label: _monthDayLabel(
            AppLocalizations.of(context),
            today.subtract(Duration(days: i)),
          ),
          value: _averageIntensityForDate(today.subtract(Duration(days: i))),
        ),
    ];
  }

  List<_IntensityPoint> _monthlyIntensityPoints() {
    final now = DateTime.now();
    return [
      for (var day = 1; day <= now.day; day++)
        _IntensityPoint(
          label: _sparseDayLabel(AppLocalizations.of(context), day, now.day),
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
          label: _sparseDateLabel(
            AppLocalizations.of(context),
            days[i],
            i,
            days.length,
          ),
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

  String _monthDayLabel(AppLocalizations l10n, DateTime date) {
    return l10n.formatMonthDay(date);
  }

  String _sparseDayLabel(AppLocalizations l10n, int day, int totalDays) {
    if (totalDays <= 12 || day == 1 || day == totalDays || day % 7 == 0) {
      return l10n.formatInteger(day);
    }
    return '';
  }

  String _sparseDateLabel(
    AppLocalizations l10n,
    DateTime date,
    int index,
    int totalCount,
  ) {
    if (totalCount <= 7 || index == 0 || index == totalCount - 1) {
      return _monthDayLabel(l10n, date);
    }

    final interval = (totalCount / 6).ceil().clamp(1, totalCount);
    if (index % interval == 0) {
      return _monthDayLabel(l10n, date);
    }

    return '';
  }

  List<_CategorySlice> _categoryDistributionSlices(
    AppLocalizations l10n,
    List<RageNote> records,
  ) {
    if (records.isEmpty) {
      return const [];
    }
    final defaultCounts = {
      for (final category in _defaultDistributionCategories(l10n))
        category.key: 0,
    };
    final customCounts = <String, ({String label, int count})>{};
    for (final record in records) {
      if (defaultCounts.containsKey(record.categoryKey)) {
        defaultCounts[record.categoryKey] =
            defaultCounts[record.categoryKey]! + 1;
        continue;
      }

      final key = _categoryIdentityFor(record);
      final label = '${record.categoryEmoji} ${record.categoryLabel}';
      customCounts[key] = (
        label: label,
        count: (customCounts[key]?.count ?? 0) + 1,
      );
    }
    final sortedCustom = customCounts.values.toList()
      ..sort((a, b) => b.count.compareTo(a.count));
    final visibleCustom = sortedCustom.take(4).toList();
    final remainingCustomCount = sortedCustom
        .skip(4)
        .fold<int>(0, (sum, category) => sum + category.count);
    final chartItems = [
      for (final category in _defaultDistributionCategories(l10n))
        if (defaultCounts[category.key]! > 0)
          (
            label: '${category.emoji} ${category.label}',
            count: defaultCounts[category.key]!,
          ),
      ...visibleCustom,
      if (remainingCustomCount > 0)
        (label: l10n.statsOtherCategory, count: remainingCustomCount),
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

  List<_CategorySummary> _categorySummaries(List<RageNote> records) {
    if (records.isEmpty) {
      return const [];
    }

    final grouped = <String, List<RageNote>>{};
    for (final record in records) {
      final key = _categoryIdentityFor(record);
      grouped.putIfAbsent(key, () => []).add(record);
    }

    final summaries =
        [
          for (final entry in grouped.entries)
            _CategorySummary.fromRecords(
              records: entry.value,
              totalCount: records.length,
            ),
        ]..sort((left, right) {
          final countCompare = right.count.compareTo(left.count);
          if (countCompare != 0) {
            return countCompare;
          }
          return right.averageLevel.compareTo(left.averageLevel);
        });

    return summaries;
  }

  Future<void> _openSummaryScreen(
    AppLocalizations l10n,
    List<RageNote> records,
  ) async {
    await Navigator.of(context).push<void>(
      MaterialPageRoute(
        settings: const RouteSettings(name: 'stats_summary'),
        builder: (context) {
          return _StatsSummaryScreen(
            summaries: _categorySummaries(records),
            l10n: l10n,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final filteredRecords = _filteredRecords();

    return Column(
      children: [
        Container(
          color: FuryColors.chrome,
          child: TabBar(
            controller: _tabController,
            indicatorColor: FuryColors.red,
            indicatorWeight: 2,
            labelColor: FuryColors.text,
            unselectedLabelColor: FuryColors.muted,
            dividerColor: FuryColors.border,
            labelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            tabs: [
              Tab(text: l10n.week),
              Tab(text: l10n.month),
              Tab(text: l10n.all),
            ],
          ),
        ),
        if (_loading) const LinearProgressIndicator(value: 0.35, minHeight: 2),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Row(
                children: [
                  Expanded(
                    child: MetricTile(
                      label: l10n.totalRecords,
                      value: l10n.formatInteger(filteredRecords.length),
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
                      value: _dailyAverageLabel(l10n, filteredRecords),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _LineChartPanel(
                title: l10n.statsIntensityTrend,
                points: _intensityPoints(),
              ),
              const SizedBox(height: 12),
              _PieChartPanel(
                title: l10n.statsCategoryDistribution,
                slices: _categoryDistributionSlices(l10n, filteredRecords),
                noRecordsLabel: l10n.statsNoRecords,
              ),
              const SizedBox(height: 16),
              _CalendarRecordsButton(
                title: l10n.statsCalendarButtonTitle,
                subtitle: l10n.statsCalendarButtonSubtitle,
                onTap: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      settings: const RouteSettings(name: 'stats_calendar'),
                      builder: (_) => StatsCalendarScreen(
                        noteRepository: widget.noteRepository,
                      ),
                    ),
                  );
                  if (mounted) {
                    await _loadRecords();
                  }
                },
              ),
              const SizedBox(height: 10),
              _SummaryRecordsButton(
                title: l10n.statsSummaryButtonTitle,
                subtitle: l10n.statsSummaryButtonSubtitle,
                onTap: () => _openSummaryScreen(l10n, _records),
              ),
            ],
          ),
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

List<_DistributionCategory> _defaultDistributionCategories(
  AppLocalizations l10n,
) {
  return [
    _DistributionCategory(key: 'family', emoji: '👨‍👩‍👧', label: l10n.family),
    _DistributionCategory(key: 'romance', emoji: '💕', label: l10n.romance),
    _DistributionCategory(key: 'work', emoji: '💼', label: l10n.work),
    _DistributionCategory(key: 'people', emoji: '🧑', label: l10n.people),
    _DistributionCategory(key: 'driving', emoji: '🚗', label: l10n.driving),
  ];
}

class _DistributionCategory {
  const _DistributionCategory({
    required this.key,
    required this.emoji,
    required this.label,
  });

  final String key;
  final String emoji;
  final String label;
}

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

String _categoryIdentityFor(RageNote record) {
  return '${record.categoryKey}|${record.categoryEmoji}|${record.categoryLabel}';
}

class _CategorySummary {
  const _CategorySummary({
    required this.identityKey,
    required this.categoryKey,
    required this.emoji,
    required this.label,
    required this.count,
    required this.percent,
    required this.postedCount,
    required this.calmCount,
    required this.averageLevel,
    required this.peakEmoji,
  });

  final String identityKey;
  final String categoryKey;
  final String emoji;
  final String label;
  final int count;
  final int percent;
  final int postedCount;
  final int calmCount;
  final double averageLevel;
  final String peakEmoji;

  factory _CategorySummary.fromRecords({
    required List<RageNote> records,
    required int totalCount,
  }) {
    final first = records.first;
    final totalLevel = records.fold<int>(
      0,
      (sum, record) => sum + record.rageLevel,
    );
    final peak = records.reduce(
      (left, right) => left.rageLevel >= right.rageLevel ? left : right,
    );

    return _CategorySummary(
      identityKey: _categoryIdentityFor(first),
      categoryKey: first.categoryKey,
      emoji: first.categoryEmoji,
      label: first.categoryLabel,
      count: records.length,
      percent: totalCount == 0
          ? 0
          : (records.length / totalCount * 100).round(),
      postedCount: records.where((record) => record.posted).length,
      calmCount: records.where((record) => record.reminderAt != null).length,
      averageLevel: totalLevel / records.length,
      peakEmoji: peak.rageEmoji,
    );
  }
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
  const _PieChartPanel({
    required this.title,
    required this.slices,
    required this.noRecordsLabel,
  });

  final String title;
  final List<_CategorySlice> slices;
  final String noRecordsLabel;

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
            Text(
              noRecordsLabel,
              style: const TextStyle(color: FuryColors.faint, fontSize: 12),
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
    final l10n = AppLocalizations.of(context);
    final percent = total == 0 ? 0.0 : slice.count / total;

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
            '${slice.label} ${l10n.formatPercent(percent)}',
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

class _StatsSummaryScreen extends StatefulWidget {
  const _StatsSummaryScreen({required this.summaries, required this.l10n});

  final List<_CategorySummary> summaries;
  final AppLocalizations l10n;

  @override
  State<_StatsSummaryScreen> createState() => _StatsSummaryScreenState();
}

class _StatsSummaryScreenState extends State<_StatsSummaryScreen> {
  late final PageController _pageController = PageController();
  int _page = 0;

  int get _pageCount => math.max(widget.summaries.length, 1);
  bool get _canGoPrevious => _page > 0;
  bool get _canGoNext => _page < _pageCount - 1;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToPage(int page) {
    final target = page.clamp(0, _pageCount - 1);
    _pageController.animateToPage(
      target,
      duration: const Duration(milliseconds: 360),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = widget.l10n;

    return Scaffold(
      backgroundColor: FuryColors.phone,
      appBar: AppBar(
        backgroundColor: FuryColors.chrome,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(l10n.statsSummaryTitle),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(
                l10n.statsSummaryPageIndicator(_page + 1, _pageCount),
                style: const TextStyle(
                  color: FuryColors.faint,
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          _SummaryPageControls(
            l10n: l10n,
            canGoPrevious: _canGoPrevious,
            canGoNext: _canGoNext,
            onPrevious: () => _goToPage(_page - 1),
            onNext: () => _goToPage(_page + 1),
          ),
          Expanded(
            child: PageView(
              key: const ValueKey('stats-summary-page-view'),
              controller: _pageController,
              scrollDirection: Axis.vertical,
              physics: const PageScrollPhysics(),
              onPageChanged: (value) => setState(() => _page = value),
              children: widget.summaries.isEmpty
                  ? [_StatsSummaryEmptyPage(l10n: l10n)]
                  : [
                      for (var i = 0; i < widget.summaries.length; i++)
                        _StatsSummaryCategoryPage(
                          key: ValueKey(
                            'stats-summary-${widget.summaries[i].identityKey}',
                          ),
                          summary: widget.summaries[i],
                          l10n: l10n,
                          topCategory: i == 0,
                        ),
                    ],
            ),
          ),
          _SummaryPageControls(
            l10n: l10n,
            canGoPrevious: _canGoPrevious,
            canGoNext: _canGoNext,
            onPrevious: () => _goToPage(_page - 1),
            onNext: () => _goToPage(_page + 1),
            bottom: true,
          ),
        ],
      ),
    );
  }
}

class _StatsSummaryCategoryPage extends StatelessWidget {
  const _StatsSummaryCategoryPage({
    required this.summary,
    required this.l10n,
    required this.topCategory,
    super.key,
  });

  final _CategorySummary summary;
  final AppLocalizations l10n;
  final bool topCategory;

  @override
  Widget build(BuildContext context) {
    final headline = topCategory
        ? l10n.statsSummaryTopHeadline(summary.label)
        : l10n.statsSummaryCategoryHeadline(summary.label);
    final conclusion = topCategory
        ? l10n.statsSummaryConclusionTop
        : l10n.statsSummaryConclusionCategory;

    return Container(
      padding: const EdgeInsets.fromLTRB(18, 12, 18, 14),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            FuryColors.red.withValues(alpha: 0.10),
            FuryColors.phone.withValues(alpha: 0.0),
          ],
        ),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _AnimatedSummaryEmoji(
              emoji: summary.emoji,
              delay: const Duration(milliseconds: 40),
            ),
            const SizedBox(height: 10),
            _AnimatedSummaryText(
              delay: const Duration(milliseconds: 90),
              child: Text(
                headline,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: FuryColors.text,
                  fontSize: 21,
                  height: 1.22,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            const SizedBox(height: 10),
            _AnimatedSummaryText(
              delay: const Duration(milliseconds: 140),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _comfortEmojiFor(summary.categoryKey),
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(width: 7),
                  Flexible(
                    child: Text(
                      _comfortFor(l10n, summary.categoryKey),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: FuryColors.muted,
                        fontSize: 13,
                        height: 1.35,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 7),
                  _AnimatedSummaryIcon(
                    icon: Icons.volunteer_activism_outlined,
                    color: FuryColors.orange,
                    delay: const Duration(milliseconds: 170),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: [
                _SummaryMetricChip(
                  delay: const Duration(milliseconds: 190),
                  label: l10n.statsSummaryMetricCount,
                  value: l10n.statsSummaryRecordsUnit(summary.count),
                  icon: Icons.numbers,
                  color: FuryColors.red,
                ),
                _SummaryMetricChip(
                  delay: const Duration(milliseconds: 220),
                  label: l10n.statsSummaryMetricCategory,
                  value: '${summary.emoji} ${summary.label}',
                  icon: Icons.category_outlined,
                  color: FuryColors.orange,
                ),
                _SummaryMetricChip(
                  delay: const Duration(milliseconds: 250),
                  label: l10n.statsSummaryMetricFeed,
                  value: l10n.statsSummaryRecordsUnit(summary.postedCount),
                  icon: Icons.forum_outlined,
                  color: const Color(0xFF64B4FF),
                ),
                _SummaryMetricChip(
                  delay: const Duration(milliseconds: 280),
                  label: l10n.statsSummaryMetricCalm,
                  value: l10n.statsSummaryRecordsUnit(summary.calmCount),
                  icon: Icons.spa_outlined,
                  color: const Color(0xFFA8D8A8),
                ),
                _SummaryMetricChip(
                  delay: const Duration(milliseconds: 310),
                  label: l10n.statsSummaryMetricAverage,
                  value: l10n.statsSummaryAverageValue(
                    l10n.formatDecimal(summary.averageLevel),
                  ),
                  icon: Icons.show_chart,
                  color: FuryColors.yellow,
                ),
                _SummaryMetricChip(
                  delay: const Duration(milliseconds: 340),
                  label: l10n.statsSummaryMetricPeak,
                  value: summary.peakEmoji,
                  icon: Icons.local_fire_department_outlined,
                  color: FuryColors.deepRed,
                ),
              ],
            ),
            const SizedBox(height: 14),
            _AnimatedSummaryText(
              delay: const Duration(milliseconds: 360),
              child: _SummaryInsightBars(summary: summary, l10n: l10n),
            ),
            const SizedBox(height: 12),
            _AnimatedSummaryText(
              delay: const Duration(milliseconds: 430),
              child: _SummaryConclusion(
                title: l10n.statsSummaryConclusion,
                body: conclusion,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatsSummaryEmptyPage extends StatelessWidget {
  const _StatsSummaryEmptyPage({required this.l10n});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const _AnimatedSummaryEmoji(
            emoji: '📝',
            delay: Duration(milliseconds: 60),
          ),
          const SizedBox(height: 14),
          _AnimatedSummaryText(
            delay: const Duration(milliseconds: 120),
            child: Text(
              l10n.statsSummaryEmptyTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: FuryColors.text,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(height: 8),
          _AnimatedSummaryText(
            delay: const Duration(milliseconds: 180),
            child: Text(
              l10n.statsSummaryEmptyBody,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: FuryColors.faint,
                fontSize: 13,
                height: 1.45,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryPageControls extends StatelessWidget {
  const _SummaryPageControls({
    required this.l10n,
    required this.canGoPrevious,
    required this.canGoNext,
    required this.onPrevious,
    required this.onNext,
    this.bottom = false,
  });

  final AppLocalizations l10n;
  final bool canGoPrevious;
  final bool canGoNext;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final bool bottom;

  @override
  Widget build(BuildContext context) {
    if (bottom) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 4, 14, 14),
        child: FilledButton.icon(
          onPressed: canGoNext ? onNext : null,
          icon: const Icon(Icons.keyboard_arrow_down),
          label: Text(l10n.next),
          style: FilledButton.styleFrom(
            minimumSize: const Size(double.infinity, 44),
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 6, 14, 4),
      child: FilledButton.icon(
        onPressed: canGoPrevious ? onPrevious : null,
        icon: const Icon(Icons.keyboard_arrow_up),
        label: Text(l10n.previous),
        style: FilledButton.styleFrom(
          minimumSize: const Size(double.infinity, 44),
        ),
      ),
    );
  }
}

class _SummaryMetricChip extends StatelessWidget {
  const _SummaryMetricChip({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
    required this.delay,
  });

  final String label;
  final String value;
  final IconData icon;
  final Color color;
  final Duration delay;

  @override
  Widget build(BuildContext context) {
    return _AnimatedSummaryText(
      delay: delay,
      child: Container(
        width: 94,
        height: 54,
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.045),
          border: Border.all(color: color.withValues(alpha: 0.32)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            _AnimatedSummaryIcon(icon: icon, color: color, delay: delay),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: FuryColors.faint,
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: FuryColors.text,
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryConclusion extends StatelessWidget {
  const _SummaryConclusion({required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: FuryColors.red.withValues(alpha: 0.10),
        border: Border.all(color: FuryColors.red.withValues(alpha: 0.20)),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.check_circle_outline,
                color: FuryColors.red,
                size: 16,
              ),
              const SizedBox(width: 6),
              Text(
                title,
                style: const TextStyle(
                  color: FuryColors.text,
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            body,
            style: const TextStyle(
              color: FuryColors.muted,
              fontSize: 12,
              height: 1.36,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _AnimatedSummaryText extends StatelessWidget {
  const _AnimatedSummaryText({required this.child, required this.delay});

  final Widget child;
  final Duration delay;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 460 + delay.inMilliseconds),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        final delayed =
            ((value * (460 + delay.inMilliseconds)) - delay.inMilliseconds)
                .clamp(0.0, 460.0) /
            460.0;
        return Opacity(
          opacity: delayed,
          child: Transform.translate(
            offset: Offset(0, 12 * (1 - delayed)),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}

class _AnimatedSummaryIcon extends StatelessWidget {
  const _AnimatedSummaryIcon({
    required this.icon,
    required this.color,
    required this.delay,
  });

  final IconData icon;
  final Color color;
  final Duration delay;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 420 + delay.inMilliseconds),
      curve: Curves.easeOutBack,
      builder: (context, value, child) {
        final delayed =
            ((value * (420 + delay.inMilliseconds)) - delay.inMilliseconds)
                .clamp(0.0, 420.0) /
            420.0;
        return Transform.rotate(
          angle: (1 - delayed) * -0.35,
          child: Transform.scale(scale: delayed, child: child),
        );
      },
      child: Icon(icon, color: color, size: 18),
    );
  }
}

class _AnimatedSummaryEmoji extends StatelessWidget {
  const _AnimatedSummaryEmoji({required this.emoji, required this.delay});

  final String emoji;
  final Duration delay;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 580 + delay.inMilliseconds),
      curve: Curves.easeOutBack,
      builder: (context, value, child) {
        final delayed =
            ((value * (580 + delay.inMilliseconds)) - delay.inMilliseconds)
                .clamp(0.0, 580.0) /
            580.0;
        return Transform.scale(
          scale: 0.72 + delayed * 0.28,
          child: Opacity(opacity: delayed, child: child),
        );
      },
      child: Text(emoji, style: const TextStyle(fontSize: 42)),
    );
  }
}

class _SummaryInsightBars extends StatelessWidget {
  const _SummaryInsightBars({required this.summary, required this.l10n});

  final _CategorySummary summary;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final calmRate = summary.count == 0
        ? 0.0
        : summary.calmCount / summary.count;
    final shareRate = summary.count == 0
        ? 0.0
        : summary.postedCount / summary.count;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.035),
        border: Border.all(color: FuryColors.border),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SummaryStatBar(
            label: l10n.statsSummaryCategoryShare,
            value: summary.percent / 100.0,
            displayText: l10n.formatPercent(summary.percent / 100.0),
            color: FuryColors.red,
            delay: const Duration(milliseconds: 0),
          ),
          const SizedBox(height: 11),
          _SummaryStatBar(
            label: l10n.statsSummaryCalmRate,
            value: calmRate,
            displayText: l10n.formatPercent(calmRate),
            color: const Color(0xFFA8D8A8),
            delay: const Duration(milliseconds: 60),
          ),
          const SizedBox(height: 11),
          _SummaryStatBar(
            label: l10n.statsSummaryShareRate,
            value: shareRate,
            displayText: l10n.formatPercent(shareRate),
            color: const Color(0xFF64B4FF),
            delay: const Duration(milliseconds: 120),
          ),
        ],
      ),
    );
  }
}

class _SummaryStatBar extends StatelessWidget {
  const _SummaryStatBar({
    required this.label,
    required this.value,
    required this.displayText,
    required this.color,
    required this.delay,
  });

  final String label;
  final double value;
  final String displayText;
  final Color color;
  final Duration delay;

  @override
  Widget build(BuildContext context) {
    const totalMs = 640;
    final delayMs = delay.inMilliseconds;

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: totalMs + delayMs),
      curve: Curves.easeOutCubic,
      builder: (context, t, _) {
        final delayed =
            ((t * (totalMs + delayMs)) - delayMs).clamp(
              0.0,
              totalMs.toDouble(),
            ) /
            totalMs;
        final barFill = value.clamp(0.0, 1.0) * delayed;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: FuryColors.faint,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Opacity(
                  opacity: delayed,
                  child: Text(
                    displayText,
                    style: TextStyle(
                      color: color,
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: SizedBox(
                height: 6,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      color: color.withValues(alpha: 0.14),
                    ),
                    FractionallySizedBox(
                      widthFactor: barFill,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: [
                            BoxShadow(
                              color: color.withValues(alpha: 0.5),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

String _comfortFor(AppLocalizations l10n, String key) {
  return switch (key) {
    'family' => l10n.statsSummaryComfortGeneric,
    'romance' => l10n.statsSummaryComfortRomance,
    'work' => l10n.statsSummaryComfortWork,
    'people' => l10n.statsSummaryComfortPeople,
    'driving' => l10n.statsSummaryComfortDriving,
    _ => l10n.statsSummaryComfortGeneric,
  };
}

String _comfortEmojiFor(String key) {
  return switch (key) {
    'family' => '💛',
    'romance' => '🌙',
    'work' => '☕',
    'people' => '🤝',
    'driving' => '🛣️',
    _ => '🌱',
  };
}

class _CalendarRecordsButton extends StatelessWidget {
  const _CalendarRecordsButton({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return _StatsActionButton(
      title: title,
      subtitle: subtitle,
      icon: Icons.calendar_month_outlined,
      onTap: onTap,
    );
  }
}

class _SummaryRecordsButton extends StatelessWidget {
  const _SummaryRecordsButton({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return _StatsActionButton(
      title: title,
      subtitle: subtitle,
      icon: Icons.auto_awesome,
      onTap: onTap,
    );
  }
}

class _StatsActionButton extends StatelessWidget {
  const _StatsActionButton({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOutCubic,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: FuryColors.panel,
          border: Border.all(color: FuryColors.border),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            _StatsActionButtonIcon(icon: icon),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: FuryColors.text,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 3),
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
            const Icon(Icons.chevron_right, color: Color(0xFF444444)),
          ],
        ),
      ),
    );
  }
}

class _StatsActionButtonIcon extends StatelessWidget {
  const _StatsActionButtonIcon({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 520),
      curve: Curves.easeOutBack,
      builder: (context, value, child) {
        return Transform.scale(scale: value, child: child);
      },
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: FuryColors.red.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: FuryColors.red, size: 20),
      ),
    );
  }
}
