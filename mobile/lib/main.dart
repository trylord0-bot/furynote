import 'package:flutter/material.dart';
import 'package:fury_note/l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const FuryNoteApp());
}

class FuryNoteApp extends StatelessWidget {
  const FuryNoteApp({this.initialLocale, super.key});

  final Locale? initialLocale;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fury Note',
      locale: initialLocale,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFFF7F1),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF6B35),
          primary: const Color(0xFFE63946),
          secondary: const Color(0xFFFF9A3C),
          surface: const Color(0xFFFFFBF7),
        ),
      ),
      home: const FuryShell(),
    );
  }
}

class FuryShell extends StatefulWidget {
  const FuryShell({super.key});

  @override
  State<FuryShell> createState() => _FuryShellState();
}

class _FuryShellState extends State<FuryShell> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final screens = [
      const RecordScreen(),
      const FeedScreen(),
      const StatsScreen(),
      const CalmScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 8,
        title: Row(
          children: [
            const Text('🔥', style: TextStyle(fontSize: 24)),
            const SizedBox(width: 8),
            Text(
              l10n.appTitle,
              style: const TextStyle(fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
      drawer: const FuryDrawer(),
      body: screens[_index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (value) => setState(() => _index = value),
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.local_fire_department),
            label: l10n.record,
          ),
          NavigationDestination(
            icon: const Icon(Icons.forum_outlined),
            label: l10n.feed,
          ),
          NavigationDestination(
            icon: const Icon(Icons.query_stats),
            label: l10n.stats,
          ),
          NavigationDestination(
            icon: const Icon(Icons.spa_outlined),
            label: l10n.calm,
          ),
        ],
      ),
    );
  }
}

class FuryDrawer extends StatelessWidget {
  const FuryDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 28,
                    child: Text('🐯', style: TextStyle(fontSize: 26)),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.profileName,
                          style: const TextStyle(fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          '🔥 47 · 📮 12',
                          style: TextStyle(color: Color(0xFF8B6B61)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: Text(l10n.settings),
            ),
            ListTile(
              leading: const Icon(Icons.menu_book_outlined),
              title: Text(l10n.drawerGuide),
            ),
            ListTile(
              leading: const Icon(Icons.spa_outlined),
              title: Text(l10n.drawerCalmGuide),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                l10n.drawerVersion,
                style: const TextStyle(color: Color(0xFF8B6B61)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecordScreen extends StatefulWidget {
  const RecordScreen({super.key});

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  final PageController _controller = PageController();
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _customCategoryController =
      TextEditingController();
  int _step = 0;
  RageChoice? _rage;
  CategoryChoice? _category;
  String? _reminder;

  @override
  void dispose() {
    _controller.dispose();
    _textController.dispose();
    _customCategoryController.dispose();
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

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [rage.color.withValues(alpha: 0.22), const Color(0xFFFFF7F1)],
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 4),
            child: Column(
              children: [
                Text(
                  l10n.recordTitle,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 14),
                StepDots(active: _step),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                RecordStep(
                  title: l10n.stepIntensity,
                  subtitle: l10n.stepIntensitySub,
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      for (final choice in RageChoice.choices(l10n))
                        ChoiceChipCard(
                          selected: _rage?.level == choice.level,
                          color: choice.color,
                          title: choice.emoji,
                          subtitle: 'Lv.${choice.level}\n${choice.label}',
                          onTap: () {
                            setState(() => _rage = choice);
                            _goTo(1);
                          },
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
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          for (final choice in CategoryChoice.choices(l10n))
                            ChoiceChipCard(
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
                        ],
                      ),
                      if (_category?.key == 'custom') ...[
                        const SizedBox(height: 18),
                        TextField(
                          key: const ValueKey('custom-category-field'),
                          controller: _customCategoryController,
                          decoration: InputDecoration(
                            labelText: '카테고리를 입력하세요',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
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
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.mic_outlined),
                            label: Text(l10n.voiceInput),
                          ),
                          const Spacer(),
                          FilledButton(
                            onPressed: () => _goTo(3),
                            child: Text(l10n.next),
                          ),
                        ],
                      ),
                      TextButton(
                        key: const ValueKey('text-step-skip'),
                        onPressed: () => _goTo(3),
                        child: Text(l10n.skip),
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
                        subtitle: Text(_reminder ?? l10n.noReminder),
                      ),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          for (final option in [
                            '30분 후',
                            '1시간 후',
                            '2시간 후',
                            '6시간 후',
                            '내일',
                            '직접 설정',
                          ])
                            FilterChip(
                              label: Text(option),
                              selected: _reminder == option,
                              onSelected: (_) =>
                                  setState(() => _reminder = option),
                            ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      FilledButton(
                        onPressed: () => _goTo(4),
                        child: Text(l10n.next),
                      ),
                      TextButton(
                        key: const ValueKey('reminder-step-skip'),
                        onPressed: () => _goTo(4),
                        child: Text(l10n.skip),
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
                      l10n.summaryIntensity:
                          '${rage.emoji} Lv.${rage.level} · ${rage.label}',
                      l10n.summaryCategory:
                          '${category.emoji} ${category.label}',
                      l10n.summaryText: _textController.text.isEmpty
                          ? l10n.none
                          : _textController.text,
                      l10n.summaryReminder: _reminder ?? l10n.none,
                    },
                    action: FilledButton.icon(
                      onPressed: () => _goTo(5),
                      icon: const Icon(Icons.local_fire_department),
                      label: Text(l10n.saveNote),
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
                        level: rage.level,
                        nickname: l10n.profileName,
                        category: '${category.emoji} ${category.label}',
                        text: _textController.text.isEmpty
                            ? l10n.none
                            : _textController.text,
                      ),
                      const SizedBox(height: 16),
                      FilledButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.send_outlined),
                        label: Text(l10n.postIt),
                      ),
                      TextButton(onPressed: () {}, child: Text(l10n.saveOnly)),
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
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(
            height: 44,
            child: onBack == null
                ? null
                : IconButton.filledTonal(
                    onPressed: onBack,
                    icon: const Icon(Icons.keyboard_arrow_up),
                  ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 8),
          Text(subtitle, style: const TextStyle(color: Color(0xFF8B6B61))),
          const SizedBox(height: 28),
          child,
        ],
      ),
    );
  }
}

class StepDots extends StatelessWidget {
  const StepDots({required this.active, super.key});

  final int active;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < 6; i++)
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: active == i ? 28 : 8,
            height: 8,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: i <= active
                  ? const Color(0xFFE63946)
                  : const Color(0xFFE8D8D0),
              borderRadius: BorderRadius.circular(999),
            ),
          ),
      ],
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
        width: 102,
        height: 132,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: selected ? color.withValues(alpha: 0.22) : Colors.white,
          border: Border.all(
            color: selected ? color : const Color(0xFFEADBD3),
            width: selected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: const TextStyle(fontSize: 26)),
            const SizedBox(height: 8),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w700),
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
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
                    style: const TextStyle(color: Color(0xFF8B6B61)),
                  ),
                ),
                Expanded(
                  child: Text(
                    entry.value,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            const Divider(height: 24),
          ],
          action,
        ],
      ),
    );
  }
}

class FuryPostCard extends StatelessWidget {
  const FuryPostCard({
    required this.emoji,
    required this.level,
    required this.nickname,
    required this.category,
    required this.text,
    super.key,
  });

  final String emoji;
  final int level;
  final String nickname;
  final String category;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(emoji, style: const TextStyle(fontSize: 22)),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  nickname,
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
              ),
              Chip(label: Text('Lv.$level')),
            ],
          ),
          const SizedBox(height: 12),
          Text(text, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 12),
          Text(category, style: const TextStyle(color: Color(0xFF8B6B61))),
        ],
      ),
    );
  }
}

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final posts = [
      (
        '😡',
        4,
        l10n.profileName,
        '🚗 ${l10n.driving}',
        '옆 차선 차가 갑자기 끼어들었는데 사과도 없이 가버림.',
        12,
        3,
      ),
      ('😤', 2, '부글부글 곰 #1234', '💼 ${l10n.work}', '회의가 또 퇴근 직전에 잡혔다.', 8, 1),
    ];

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        SectionHeader(title: l10n.feedTitle, subtitle: l10n.feedSubtitle),
        const SizedBox(height: 16),
        for (final post in posts) ...[
          FuryPostCard(
            emoji: post.$1,
            level: post.$2,
            nickname: post.$3,
            category: post.$4,
            text: post.$5,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: Row(
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border),
                  label: Text('${l10n.like} ${post.$6}'),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.chat_bubble_outline),
                  label: Text('${l10n.comment} ${post.$7}'),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        SectionHeader(title: l10n.statsTitle, subtitle: l10n.statsSubtitle),
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
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            MetricTile(label: l10n.totalRecords, value: '47'),
            MetricTile(label: l10n.highestLevel, value: '🤬 Lv.5'),
            MetricTile(label: l10n.dailyAverage, value: '1.8'),
            MetricTile(label: l10n.decreaseRate, value: '42%'),
          ],
        ),
        const SizedBox(height: 16),
        const ChartPanel(
          title: '분노 강도 추이',
          bars: [0.2, 0.5, 0.35, 0.8, 0.55, 0.3, 0.65],
        ),
        const SizedBox(height: 12),
        const ChartPanel(title: '원인별 분포', bars: [0.8, 0.55, 0.45, 0.35, 0.25]),
      ],
    );
  }
}

class CalmScreen extends StatelessWidget {
  const CalmScreen({super.key});

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
        SectionHeader(title: l10n.calmTitle, subtitle: l10n.calmSubtitle),
        const SizedBox(height: 16),
        Text(
          l10n.reminderNotes,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 8),
        const Card(
          child: ListTile(
            leading: Text('😡', style: TextStyle(fontSize: 24)),
            title: Text('아까 그 분노, 지금은 어때요?'),
            subtitle: Text('최초 Lv.4 · 1시간 후'),
          ),
        ),
        const SizedBox(height: 16),
        for (final tool in tools)
          Card(
            child: ListTile(
              leading: Icon(tool.$1),
              title: Text(tool.$2),
              subtitle: Text(tool.$3),
              trailing: const Icon(Icons.chevron_right),
            ),
          ),
      ],
    );
  }
}

class SectionHeader extends StatelessWidget {
  const SectionHeader({required this.title, required this.subtitle, super.key});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 6),
        Text(subtitle, style: const TextStyle(color: Color(0xFF8B6B61))),
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
    return Container(
      width: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Color(0xFF8B6B61))),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
          ),
        ],
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w800)),
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
                            color: const Color(0xFFFF6B35),
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
