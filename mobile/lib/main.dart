import 'package:flutter/material.dart';
import 'package:fury_note/l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const FuryNoteApp());
}

class FuryColors {
  static const page = Color(0xFF1A1A1A);
  static const phone = Color(0xFF0D0D0D);
  static const chrome = Color(0xFF111111);
  static const panel = Color(0xFF161616);
  static const panelAlt = Color(0xFF1E1E1E);
  static const border = Color(0xFF2A2A2A);
  static const divider = Color(0xFF222222);
  static const text = Color(0xFFF0F0F0);
  static const muted = Color(0xFF888888);
  static const faint = Color(0xFF555555);
  static const red = Color(0xFFE63946);
  static const deepRed = Color(0xFF9B1D20);
  static const orange = Color(0xFFFF6B35);
  static const yellow = Color(0xFFFFD93D);
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
        brightness: Brightness.dark,
        useMaterial3: true,
        scaffoldBackgroundColor: FuryColors.phone,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: FuryColors.red,
          primary: FuryColors.red,
          secondary: FuryColors.orange,
          surface: FuryColors.panel,
          onSurface: FuryColors.text,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: FuryColors.chrome,
          foregroundColor: FuryColors.text,
          elevation: 0,
          centerTitle: false,
        ),
        cardTheme: CardThemeData(
          color: FuryColors.panel,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: FuryColors.border),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        chipTheme: ChipThemeData(
          backgroundColor: FuryColors.panelAlt,
          selectedColor: FuryColors.red.withValues(alpha: 0.14),
          side: const BorderSide(color: FuryColors.border),
          labelStyle: const TextStyle(color: FuryColors.muted),
          secondaryLabelStyle: const TextStyle(color: FuryColors.red),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white.withValues(alpha: 0.055),
          labelStyle: const TextStyle(color: FuryColors.faint),
          hintStyle: const TextStyle(color: FuryColors.faint),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: FuryColors.border),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: FuryColors.red),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: FuryColors.muted),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: FuryColors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: FuryColors.muted,
            side: const BorderSide(color: FuryColors.border),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
      home: const FuryAppFrame(child: FuryShell()),
    );
  }
}

class FuryAppFrame extends StatelessWidget {
  const FuryAppFrame({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      key: const ValueKey('fury-app-shell'),
      decoration: const BoxDecoration(color: FuryColors.page),
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final framed = constraints.maxWidth >= 520;
            final frameHeight = framed
                ? constraints.maxHeight.clamp(0.0, 760.0).toDouble()
                : constraints.maxHeight;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 260),
              curve: Curves.easeOutCubic,
              width: framed ? 360 : constraints.maxWidth,
              height: frameHeight,
              decoration: BoxDecoration(
                color: FuryColors.phone,
                border: framed
                    ? Border.all(color: FuryColors.border, width: 2)
                    : null,
                borderRadius: BorderRadius.circular(framed ? 40 : 0),
                boxShadow: framed
                    ? const [
                        BoxShadow(
                          color: Color(0xB3000000),
                          blurRadius: 60,
                          offset: Offset(0, 20),
                        ),
                      ]
                    : null,
              ),
              clipBehavior: Clip.antiAlias,
              child: child,
            );
          },
        ),
      ),
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
      backgroundColor: Colors.transparent,
      drawerScrimColor: Colors.black.withValues(alpha: 0.6),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(52),
        child: Builder(
          builder: (context) => FuryHeader(
            title: l10n.appTitle,
            onMenu: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: const Drawer(
        backgroundColor: FuryColors.panel,
        surfaceTintColor: Colors.transparent,
        child: FuryDrawer(),
      ),
      body: screens[_index],
      bottomNavigationBar: FuryBottomNav(
        selectedIndex: _index,
        onSelected: (value) => setState(() => _index = value),
        labels: [l10n.record, l10n.feed, l10n.stats, l10n.calm],
      ),
    );
  }
}

class FuryHeader extends StatelessWidget {
  const FuryHeader({required this.title, required this.onMenu, super.key});

  final String title;
  final VoidCallback onMenu;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        height: 52,
        decoration: const BoxDecoration(
          color: FuryColors.chrome,
          border: Border(bottom: BorderSide(color: FuryColors.border)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            const Text('🔥', style: TextStyle(fontSize: 20)),
            const SizedBox(width: 7),
            Semantics(
              label: title,
              child: ExcludeSemantics(
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      color: FuryColors.text,
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                    ),
                    children: [
                      const TextSpan(text: 'Fury '),
                      TextSpan(
                        text: 'Note',
                        style: const TextStyle(color: FuryColors.red),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            IconButton(
              tooltip: 'menu',
              onPressed: onMenu,
              icon: const Icon(Icons.menu, color: FuryColors.text),
              style: IconButton.styleFrom(
                backgroundColor: Colors.white.withValues(alpha: 0.04),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FuryBottomNav extends StatelessWidget {
  const FuryBottomNav({
    required this.selectedIndex,
    required this.onSelected,
    required this.labels,
    super.key,
  });

  final int selectedIndex;
  final ValueChanged<int> onSelected;
  final List<String> labels;

  @override
  Widget build(BuildContext context) {
    final items = [
      (Icons.local_fire_department, '🔥'),
      (Icons.forum_outlined, '📮'),
      (Icons.query_stats, '📊'),
      (Icons.spa_outlined, '🧘'),
    ];

    return Container(
      height: 76,
      decoration: const BoxDecoration(
        color: FuryColors.chrome,
        border: Border(top: BorderSide(color: FuryColors.border)),
      ),
      padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          for (var i = 0; i < labels.length; i++)
            Expanded(
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () => onSelected(i),
                child: SizedBox(
                  height: 68,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    clipBehavior: Clip.none,
                    children: [
                      if (i == 0)
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 180),
                          width: selectedIndex == i ? 48 : 44,
                          height: selectedIndex == i ? 48 : 44,
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [FuryColors.red, FuryColors.deepRed],
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: FuryColors.chrome,
                              width: 3,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: FuryColors.red.withValues(
                                  alpha: selectedIndex == i ? 0.65 : 0.45,
                                ),
                                blurRadius: selectedIndex == i ? 24 : 16,
                                offset: const Offset(0, -4),
                              ),
                              const BoxShadow(
                                color: Color(0x66000000),
                                blurRadius: 12,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Text('🔥', style: TextStyle(fontSize: 22)),
                          ),
                        )
                      else
                        Positioned(
                          bottom: 28,
                          child: Icon(
                            items[i].$1,
                            color: selectedIndex == i
                                ? FuryColors.red
                                : FuryColors.faint,
                            size: 22,
                          ),
                        ),
                      Positioned(
                        bottom: 2,
                        child: Text(
                          labels[i],
                          style: TextStyle(
                            color: selectedIndex == i
                                ? FuryColors.red
                                : FuryColors.faint,
                            fontSize: 9,
                            fontWeight: selectedIndex == i
                                ? FontWeight.w800
                                : FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 28, 20, 18),
            decoration: const BoxDecoration(
              color: FuryColors.chrome,
              border: Border(bottom: BorderSide(color: FuryColors.border)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.profileName,
                  style: const TextStyle(
                    color: FuryColors.text,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: FuryColors.red.withValues(alpha: 0.12),
                    border: Border.all(
                      color: FuryColors.red.withValues(alpha: 0.25),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    '🔥 분노 기록 47회',
                    style: TextStyle(
                      color: FuryColors.red,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          FuryDrawerTile(
            icon: Icons.settings_outlined,
            title: l10n.settings,
            subtitle: '닉네임 변경 · 알림 설정',
          ),
          FuryDrawerTile(
            icon: Icons.menu_book_outlined,
            title: l10n.drawerGuide,
            subtitle: 'Fury Note 사용 방법',
          ),
          FuryDrawerTile(
            icon: Icons.spa_outlined,
            title: l10n.drawerCalmGuide,
            subtitle: '감정 조절 카드 · 오늘의 팁',
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
    );
  }
}

class FuryDrawerTile extends StatelessWidget {
  const FuryDrawerTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    super.key,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      leading: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: FuryColors.panelAlt,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: FuryColors.muted, size: 19),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: FuryColors.text,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(color: FuryColors.faint, fontSize: 11),
      ),
      trailing: const Icon(
        Icons.chevron_right,
        color: Color(0xFF444444),
        size: 16,
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
        color: Color.lerp(
          FuryColors.phone,
          rage.color,
          _rage == null ? 0 : 0.08,
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
                    color: FuryColors.text,
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
                  child: ChoiceGrid(
                    children: [
                      for (final choice in RageChoice.choices(l10n))
                        Center(
                          child: ChoiceChipCard(
                            selected: _rage?.level == choice.level,
                            color: choice.color,
                            title: choice.emoji,
                            subtitle: 'Lv.${choice.level}\n${choice.label}',
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
                        decoration: const InputDecoration(
                          hintText: '여기에 적어보세요',
                        ),
                        style: const TextStyle(
                          color: FuryColors.text,
                          height: 1.7,
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : MediaQuery.sizeOf(context).width;
        final contentWidth = (availableWidth - 36).clamp(0.0, 324.0);
        return SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(18, 10, 18, 20),
          child: SizedBox(
            width: contentWidth,
            child: Column(
              children: [
                if (onBack != null) ...[
                  SizedBox(
                    height: 38,
                    child: IconButton.filledTonal(
                      onPressed: onBack,
                      icon: const Icon(Icons.keyboard_arrow_up),
                    ),
                  ),
                  const SizedBox(height: 8),
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
        );
      },
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
                  ? FuryColors.red.withValues(alpha: active == i ? 1 : 0.45)
                  : FuryColors.border,
              borderRadius: BorderRadius.circular(active == i ? 3 : 999),
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
        color: Colors.white.withValues(alpha: 0.04),
        border: Border.all(color: FuryColors.border),
        borderRadius: BorderRadius.circular(16),
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
                  style: const TextStyle(
                    color: FuryColors.muted,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Chip(
                label: Text('Lv.$level'),
                side: BorderSide(color: FuryColors.red.withValues(alpha: 0.3)),
                backgroundColor: FuryColors.red.withValues(alpha: 0.12),
                labelStyle: const TextStyle(
                  color: FuryColors.red,
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFFCCCCCC),
              fontSize: 13,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.06),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              category,
              style: const TextStyle(color: FuryColors.muted, fontSize: 10),
            ),
          ),
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
            child: Wrap(
              spacing: 8,
              runSpacing: 4,
              children: [
                FuryPostAction(
                  icon: Icons.favorite_border,
                  label: '${l10n.like} ${post.$6}',
                ),
                FuryPostAction(
                  icon: Icons.chat_bubble_outline,
                  label: '${l10n.comment} ${post.$7}',
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}

class FuryPostAction extends StatelessWidget {
  const FuryPostAction({required this.icon, required this.label, super.key});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 17),
      label: Text(label),
      style: TextButton.styleFrom(
        foregroundColor: FuryColors.muted,
        minimumSize: const Size(0, 36),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
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
          style: const TextStyle(
            color: FuryColors.text,
            fontSize: 28,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 6),
        Text(subtitle, style: const TextStyle(color: FuryColors.faint)),
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
        color: FuryColors.panel,
        border: Border.all(color: FuryColors.border),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: FuryColors.faint)),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: FuryColors.text,
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
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
