import 'package:flutter/material.dart';
import 'package:fury_note/l10n/app_localizations.dart';
import '../main.dart';
import '../widgets/shared_widgets.dart';

class StatsRecordEntry {
  const StatsRecordEntry({
    required this.dateTime,
    required this.title,
    required this.category,
    required this.body,
  });

  final DateTime dateTime;
  final String title;
  final String category;
  final String body;
}

class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  late final List<StatsRecordEntry> _records = _buildRecords(DateTime.now());
  late DateTime _focusedMonth;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _focusedMonth = DateTime(now.year, now.month);
    _selectedDate = DateTime(now.year, now.month, now.day);
  }

  static List<StatsRecordEntry> _buildRecords(DateTime now) {
    DateTime at(int daysAgo, int hour, int minute) {
      final base = DateTime(
        now.year,
        now.month,
        now.day,
      ).subtract(Duration(days: daysAgo));
      return DateTime(base.year, base.month, base.day, hour, minute);
    }

    return [
      StatsRecordEntry(
        dateTime: at(0, 8, 20),
        title: '출근길 끼어들기',
        category: '🚗 운전',
        body: '옆 차선 차가 갑자기 끼어들었는데 사과도 없이 가버림.',
      ),
      StatsRecordEntry(
        dateTime: at(0, 22, 10),
        title: '저녁 회의',
        category: '💼 일',
        body: '회의가 또 퇴근 직전에 잡혔다.',
      ),
      StatsRecordEntry(
        dateTime: at(2, 13, 40),
        title: '택배 분실',
        category: '🏠 생활',
        body: '문 앞에 둔 택배가 사라짐.',
      ),
      StatsRecordEntry(
        dateTime: at(5, 18, 5),
        title: '동료의 말투',
        category: '💼 일',
        body: '질문했을 뿐인데 너무 퉁명스럽게 답해서 기분이 상함.',
      ),
      StatsRecordEntry(
        dateTime: at(7, 9, 15),
        title: '배달 지연',
        category: '🍔 식사',
        body: '예상보다 40분이나 늦게 도착했다.',
      ),
    ];
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

  List<StatsRecordEntry> _recordsForDate(DateTime date) {
    final matches =
        _records
            .where((record) => DateUtils.isSameDay(record.dateTime, date))
            .toList()
          ..sort((left, right) => left.dateTime.compareTo(right.dateTime));
    return matches;
  }

  void _selectDate(DateTime date) {
    setState(() {
      _focusedMonth = DateTime(date.year, date.month);
      _selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final selectedRecords = _recordsForDate(_selectedDate);

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
          selected: const {'week'},
          onSelectionChanged: (_) {},
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: MetricTile(label: l10n.totalRecords, value: '47'),
            ),
            const SizedBox(width: 10),
            Expanded(
              child:
                  MetricTile(label: l10n.highestLevel, value: '🤬 매우 화남'),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: MetricTile(label: l10n.dailyAverage, value: '1.8'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const ChartPanel(
          title: '분노 강도 추이',
          bars: [0.2, 0.5, 0.35, 0.8, 0.55, 0.3, 0.65],
        ),
        const SizedBox(height: 12),
        const ChartPanel(
          title: '원인별 분포',
          bars: [0.8, 0.55, 0.45, 0.35, 0.25],
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
      height: 88,
      child: Container(
        padding: const EdgeInsets.all(16),
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
              style: const TextStyle(color: FuryColors.faint, fontSize: 11),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: FuryColors.text,
                fontSize: 20,
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
  final List<StatsRecordEntry> records;
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
      if (record.dateTime.year == month.year &&
          record.dateTime.month == month.month) {
        recordCounts[record.dateTime.day] =
            (recordCounts[record.dateTime.day] ?? 0) + 1;
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
          onTap: () =>
              onDateSelected(DateTime(month.year, month.month, day)),
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
                      padding:
                          const EdgeInsets.symmetric(horizontal: 1.2),
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
  });

  final DateTime selectedDate;
  final List<StatsRecordEntry> records;

  @override
  Widget build(BuildContext context) {
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
              _StatsRecordTile(record: record),
              const SizedBox(height: 10),
            ],
        ],
      ),
    );
  }
}

class _StatsRecordTile extends StatelessWidget {
  const _StatsRecordTile({required this.record});

  final StatsRecordEntry record;

  @override
  Widget build(BuildContext context) {
    final timeLabel =
        '${record.dateTime.hour.toString().padLeft(2, '0')}:${record.dateTime.minute.toString().padLeft(2, '0')}';

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
              style:
                  const TextStyle(color: FuryColors.faint, fontSize: 11),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            record.body,
            style: const TextStyle(
              color: Color(0xFFCCCCCC),
              fontSize: 13,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: FuryColors.red.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              record.category,
              style: const TextStyle(
                color: FuryColors.red,
                fontSize: 10,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
