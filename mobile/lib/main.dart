import 'package:flutter/cupertino.dart';
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

String formatDottedLocaleDateTime(Locale locale, DateTime value) {
  final dateParts = _datePartsForLocale(locale, value);
  final hour = value.hour.toString().padLeft(2, '0');
  final minute = value.minute.toString().padLeft(2, '0');
  return '${dateParts.join('.')} $hour:$minute';
}

List<String> _datePartsForLocale(Locale locale, DateTime value) {
  final language = locale.languageCode.toLowerCase();
  final country = locale.countryCode?.toUpperCase();
  final year = value.year.toString().padLeft(4, '0');
  final month = value.month.toString();
  final day = value.day.toString();

  if ({'ko', 'ja', 'zh', 'hu'}.contains(language) ||
      {'KR', 'JP', 'CN', 'TW', 'HK', 'MO', 'HU'}.contains(country)) {
    return [year, month, day];
  }

  if (language == 'en' &&
      !{'GB', 'AU', 'NZ', 'IE', 'IN', 'ZA', 'SG', 'MY'}.contains(country)) {
    return [month, day, year];
  }

  return [day, month, year];
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
  static const int _feedIndex = 1;

  int _index = _feedIndex;

  void _openFeed({bool showPostedToast = false}) {
    setState(() => _index = _feedIndex);

    if (showPostedToast) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) {
          return;
        }

        final l10n = AppLocalizations.of(context);
        final height = MediaQuery.sizeOf(context).height;
        final bottomMargin = height > 160 ? height - 128 : 24.0;

        ScaffoldMessenger.of(context)
          ..clearSnackBars()
          ..showSnackBar(
            SnackBar(
              content: Text(
                l10n.feedPostedToast,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.w800),
              ),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: bottomMargin,
              ),
              backgroundColor: FuryColors.panelAlt,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: FuryColors.red),
                borderRadius: BorderRadius.circular(8),
              ),
              duration: const Duration(seconds: 2),
            ),
          );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final headerTitles = [
      l10n.recordTitle,
      l10n.feedTitle,
      l10n.statsTitle,
      l10n.calmTitle,
    ];
    final headerTitle = headerTitles[_index];
    final screens = [
      RecordScreen(
        onPost: () => _openFeed(showPostedToast: true),
        onSaveOnly: _openFeed,
      ),
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
            title: headerTitle,
            onMenu: () => Scaffold.of(context).openEndDrawer(),
          ),
        ),
      ),
      endDrawer: const Drawer(
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
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Semantics(
                label: 'Fury Note',
                child: const ExcludeSemantics(
                  child: Text('🔥', style: TextStyle(fontSize: 20)),
                ),
              ),
            ),
            Semantics(
              header: true,
              label: title,
              child: ExcludeSemantics(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 52),
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: FuryColors.text,
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
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
                Row(
                  children: [
                    CircleAvatar(
                      key: const ValueKey('drawer-profile-avatar'),
                      radius: 22,
                      backgroundColor: FuryColors.red.withValues(alpha: 0.18),
                      child: const Text('🐯', style: TextStyle(fontSize: 22)),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        key: const ValueKey('drawer-profile-name'),
                        l10n.profileName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: FuryColors.text,
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
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
  const RecordScreen({this.onPost, this.onSaveOnly, super.key});

  final VoidCallback? onPost;
  final VoidCallback? onSaveOnly;

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
  DateTime? _customReminderDateTime;
  bool _voiceInputReceived = false;

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
                            child: _ReminderWheelPicker(
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
                            child: _ReminderWheelPicker(
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
        _textController.text.trim().isNotEmpty || _voiceInputReceived;
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
                          onPressed: () =>
                              setState(() => _voiceInputReceived = true),
                          icon: Icon(
                            _voiceInputReceived
                                ? Icons.check_circle_outline
                                : Icons.mic_outlined,
                          ),
                          label: Text(l10n.voiceInput),
                        ),
                      ),
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
                      l10n.summaryReminder: _reminder ?? l10n.none,
                    },
                    action: SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        onPressed: () => _goTo(5),
                        icon: const Icon(Icons.local_fire_department),
                        label: Text(l10n.saveNote),
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

class _ReminderWheelPicker extends StatelessWidget {
  const _ReminderWheelPicker({
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

class FuryPostCard extends StatelessWidget {
  const FuryPostCard({
    required this.emoji,
    required this.nickname,
    required this.category,
    required this.text,
    super.key,
  });

  final String emoji;
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
        l10n.profileName,
        '🚗 ${l10n.driving}',
        '옆 차선 차가 갑자기 끼어들었는데 사과도 없이 가버림.',
        12,
        3,
      ),
      ('😤', '부글부글 곰 #1234', '💼 ${l10n.work}', '회의가 또 퇴근 직전에 잡혔다.', 8, 1),
    ];

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        SectionHeader(title: l10n.feedTitle, subtitle: l10n.feedSubtitle),
        const SizedBox(height: 16),
        for (final post in posts) ...[
          FuryPostCard(
            emoji: post.$1,
            nickname: post.$2,
            category: post.$3,
            text: post.$4,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: Wrap(
              spacing: 8,
              runSpacing: 4,
              children: [
                FuryPostAction(
                  icon: Icons.favorite_border,
                  label: '${l10n.like} ${post.$5}',
                ),
                FuryPostAction(
                  icon: Icons.chat_bubble_outline,
                  label: '${l10n.comment} ${post.$6}',
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
            MetricTile(label: l10n.highestLevel, value: '🤬 매우 화남'),
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
            subtitle: Text('최초 강한 분노 · 1시간 후'),
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
