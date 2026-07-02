import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fury_note/firebase_options.dart';
import 'package:fury_note/l10n/app_localizations.dart';
import 'package:fury_note/l10n/l10n_extensions.dart';
import 'package:fury_note/screens/app_guide_screen.dart';
import 'package:fury_note/screens/calm_guide_screen.dart';
import 'package:fury_note/screens/splash_screen.dart';
import 'package:fury_note/screens/calm_screen.dart';
import 'package:fury_note/screens/feed_screen.dart';
import 'package:fury_note/screens/record_screen.dart';
import 'package:fury_note/screens/settings_screen.dart';
import 'package:fury_note/screens/stats_screen.dart';
import 'package:fury_note/src/analytics/app_analytics.dart';
import 'package:fury_note/src/api/env_config.dart';
import 'package:fury_note/src/api/feed_service.dart';
import 'package:fury_note/src/audio/voice_recorder.dart';
import 'package:fury_note/src/notes/rage_note_repository.dart';
import 'package:fury_note/src/notifications/push_notification_service.dart';
import 'package:fury_note/src/notifications/reminder_notification_service.dart';
import 'package:fury_note/src/profile/app_profile.dart';
import 'package:fury_note/widgets/shared_widgets.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await EnvConfig.instance.load();
  await LocalReminderScheduler.instance.initialize();
  await AppProfileController.instance.load();
  unawaited(PushNotificationService.instance.initialize());
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
  static const toastText = Color(0xFFFFFFFF);
  static const toastSuccess = Color(0xFFB3262F);
  static const toastError = Color(0xFF8F1D28);
}

class FuryToastController extends ChangeNotifier {
  FuryToastController._();

  static final FuryToastController instance = FuryToastController._();

  String? message;
  bool visible = false;
  bool isError = false;
  Timer? _timer;
  int _version = 0;

  Color get backgroundColor =>
      isError ? FuryColors.toastError : FuryColors.toastSuccess;

  void show(String nextMessage, {bool isError = false}) {
    _timer?.cancel();
    final nextVersion = _version + 1;
    _version = nextVersion;
    message = nextMessage;
    visible = true;
    this.isError = isError;
    notifyListeners();

    _timer = Timer(const Duration(seconds: 2), () {
      if (_version != nextVersion) {
        return;
      }

      visible = false;
      notifyListeners();

      Future<void>.delayed(const Duration(milliseconds: 220), () {
        if (_version != nextVersion || visible) {
          return;
        }

        message = null;
        notifyListeners();
      });
    });
  }

  void clear({bool notify = true}) {
    _timer?.cancel();
    _timer = null;
    _version += 1;
    message = null;
    visible = false;
    isError = false;
    if (notify) {
      notifyListeners();
    }
  }
}

class FuryNoteApp extends StatelessWidget {
  const FuryNoteApp({
    this.initialLocale,
    this.feedService,
    this.noteRepository,
    this.reminderScheduler,
    this.reminderNotificationTapSource,
    this.commentPushTapSource,
    this.voiceRecorder,
    this.analytics,
    super.key,
  });

  final Locale? initialLocale;
  final FeedService? feedService;
  final RageNoteRepository? noteRepository;
  final ReminderScheduler? reminderScheduler;
  final ReminderNotificationTapSource? reminderNotificationTapSource;
  final CommentPushTapSource? commentPushTapSource;
  final FuryVoiceRecorder? voiceRecorder;
  final AppAnalytics? analytics;

  @override
  Widget build(BuildContext context) {
    final appAnalytics = analytics ?? _defaultAnalytics();
    return MaterialApp(
      title: 'Fury Note',
      locale: initialLocale,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return FuryAppFrame(
          child: FuryKeyboardDismissScope(
            child: FuryToastOverlay(child: child ?? const SizedBox.shrink()),
          ),
        );
      },
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      navigatorObservers: [AppAnalyticsRouteObserver(appAnalytics)],
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
      home: _FurySplashGate(
        feedService: feedService,
        noteRepository: noteRepository,
        reminderScheduler: reminderScheduler,
        reminderNotificationTapSource: reminderNotificationTapSource,
        commentPushTapSource: commentPushTapSource,
        voiceRecorder: voiceRecorder,
        analytics: appAnalytics,
      ),
    );
  }
}

AppAnalytics _defaultAnalytics() {
  if (Firebase.apps.isEmpty) {
    return const NoopAppAnalytics();
  }
  return FirebaseAppAnalytics.instance;
}

class _FurySplashGate extends StatefulWidget {
  const _FurySplashGate({
    this.feedService,
    this.noteRepository,
    this.reminderScheduler,
    this.reminderNotificationTapSource,
    this.commentPushTapSource,
    this.voiceRecorder,
    required this.analytics,
  });

  final FeedService? feedService;
  final RageNoteRepository? noteRepository;
  final ReminderScheduler? reminderScheduler;
  final ReminderNotificationTapSource? reminderNotificationTapSource;
  final CommentPushTapSource? commentPushTapSource;
  final FuryVoiceRecorder? voiceRecorder;
  final AppAnalytics analytics;

  @override
  State<_FurySplashGate> createState() => _FurySplashGateState();
}

class _FurySplashGateState extends State<_FurySplashGate> {
  bool _splashDone = false;

  void _onSplashDone() {
    if (!mounted) return;
    setState(() => _splashDone = true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      switchInCurve: Curves.easeOut,
      switchOutCurve: Curves.easeIn,
      transitionBuilder: (child, animation) =>
          FadeTransition(opacity: animation, child: child),
      child: _splashDone
          ? FuryShell(
              key: const ValueKey('fury-shell'),
              feedService: widget.feedService,
              noteRepository: widget.noteRepository,
              reminderScheduler: widget.reminderScheduler,
              reminderNotificationTapSource:
                  widget.reminderNotificationTapSource,
              commentPushTapSource: widget.commentPushTapSource,
              voiceRecorder: widget.voiceRecorder,
              analytics: widget.analytics,
            )
          : SplashScreen(
              key: const ValueKey('fury-splash'),
              onDone: _onSplashDone,
            ),
    );
  }
}

class FuryKeyboardDismissScope extends StatelessWidget {
  const FuryKeyboardDismissScope({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Actions(
      actions: <Type, Action<Intent>>{
        EditableTextTapOutsideIntent:
            CallbackAction<EditableTextTapOutsideIntent>(
              onInvoke: (_) {
                FocusManager.instance.primaryFocus?.unfocus();
                return null;
              },
            ),
      },
      child: child,
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

class FuryToastOverlay extends StatefulWidget {
  const FuryToastOverlay({required this.child, super.key});

  final Widget child;

  @override
  State<FuryToastOverlay> createState() => _FuryToastOverlayState();
}

class _FuryToastOverlayState extends State<FuryToastOverlay> {
  @override
  void initState() {
    super.initState();
    FuryToastController.instance.clear(notify: false);
  }

  @override
  void dispose() {
    FuryToastController.instance.clear(notify: false);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      key: const ValueKey('fury-toast-overlay'),
      fit: StackFit.expand,
      children: [
        Positioned.fill(child: widget.child),
        Positioned(
          left: 16,
          right: 16,
          top: MediaQuery.paddingOf(context).top + 52 + 12,
          child: AnimatedBuilder(
            animation: FuryToastController.instance,
            builder: (context, _) {
              final controller = FuryToastController.instance;
              return FuryBottomToast(
                message: controller.message,
                visible: controller.visible,
                backgroundColor: controller.backgroundColor,
              );
            },
          ),
        ),
      ],
    );
  }
}

class FuryShell extends StatefulWidget {
  const FuryShell({
    this.feedService,
    this.noteRepository,
    this.reminderScheduler,
    this.reminderNotificationTapSource,
    this.commentPushTapSource,
    this.voiceRecorder,
    required this.analytics,
    super.key,
  });

  final FeedService? feedService;
  final RageNoteRepository? noteRepository;
  final ReminderScheduler? reminderScheduler;
  final ReminderNotificationTapSource? reminderNotificationTapSource;
  final CommentPushTapSource? commentPushTapSource;
  final FuryVoiceRecorder? voiceRecorder;
  final AppAnalytics analytics;

  @override
  State<FuryShell> createState() => _FuryShellState();
}

class _FuryShellState extends State<FuryShell> {
  static const int _feedIndex = 1;
  static const int _calmIndex = 3;
  static const _screenNames = ['record', 'feed', 'stats', 'calm'];

  int _index = _feedIndex;
  StreamSubscription<ReminderNotificationTap>? _reminderTapSubscription;
  StreamSubscription<CommentPushTap>? _commentPushTapSubscription;
  String? _pendingCommentPostId;
  int _pendingCommentOpenToken = 0;

  ReminderNotificationTapSource get _reminderTapSource =>
      widget.reminderNotificationTapSource ?? LocalReminderScheduler.instance;
  CommentPushTapSource? get _commentPushTapSource {
    if (widget.commentPushTapSource != null) {
      return widget.commentPushTapSource;
    }

    try {
      return PushNotificationService.instance;
    } on FirebaseException {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _trackCurrentScreen();
      }
    });
    _listenForReminderNotificationTaps();
    _listenForCommentPushTaps();
  }

  @override
  void dispose() {
    unawaited(_reminderTapSubscription?.cancel());
    unawaited(_commentPushTapSubscription?.cancel());
    super.dispose();
  }

  void _listenForReminderNotificationTaps() {
    final tapSource = _reminderTapSource;
    _reminderTapSubscription = tapSource.reminderNotificationTaps.listen((_) {
      _openCalmFromReminderNotification();
    });

    final initialTap = tapSource.takeInitialReminderNotificationTap();
    if (initialTap != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _openCalmFromReminderNotification();
      });
    }
  }

  void _openCalmFromReminderNotification() {
    if (!mounted) {
      return;
    }

    Navigator.of(context).popUntil((route) => route.isFirst);
    FuryToastController.instance.clear();
    _selectTab(_calmIndex, source: 'reminder_notification');
  }

  void _listenForCommentPushTaps() {
    final tapSource = _commentPushTapSource;
    if (tapSource == null) {
      return;
    }

    _commentPushTapSubscription = tapSource.commentPushTaps.listen((tap) {
      _openFeedCommentsFromPush(tap);
    });

    final initialTap = tapSource.takeInitialCommentPushTap();
    if (initialTap != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _openFeedCommentsFromPush(initialTap);
      });
    }
  }

  void _openFeedCommentsFromPush(CommentPushTap tap) {
    if (!mounted) {
      return;
    }

    Navigator.of(context).popUntil((route) => route.isFirst);
    FuryToastController.instance.clear();
    setState(() {
      _index = _feedIndex;
      _pendingCommentPostId = tap.postId;
      _pendingCommentOpenToken += 1;
    });
    _trackCurrentScreen(source: 'comment_push');
    unawaited(
      widget.analytics.logEvent(
        'comments_opened_from_push',
        parameters: {'post_id': tap.postId},
      ),
    );
  }

  void _openFeed({String? toastMessage}) {
    if (toastMessage == null) {
      FuryToastController.instance.clear();
    } else {
      FuryToastController.instance.show(toastMessage);
    }

    if (_index == _feedIndex) {
      return;
    }

    _selectTab(_feedIndex, source: 'record_complete');
  }

  void _selectTab(int value, {required String source}) {
    if (_index == value) {
      return;
    }

    setState(() {
      _index = value;
    });
    _trackCurrentScreen(source: source);
  }

  void _trackCurrentScreen({String source = 'app'}) {
    unawaited(
      widget.analytics.logScreenView(
        _screenNames[_index],
        screenClass: 'FuryShell',
        parameters: {'source': source},
      ),
    );
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
        onPost: () => _openFeed(toastMessage: l10n.recordPostedToast),
        onSaveOnly: () => _openFeed(toastMessage: l10n.recordSavedToast),
        feedService: widget.feedService,
        noteRepository: widget.noteRepository,
        reminderScheduler: widget.reminderScheduler,
        voiceRecorder: widget.voiceRecorder,
        analytics: widget.analytics,
      ),
      FeedScreen(
        feedService: widget.feedService,
        pendingCommentPostId: _pendingCommentPostId,
        pendingCommentOpenToken: _pendingCommentOpenToken,
        analytics: widget.analytics,
      ),
      StatsScreen(noteRepository: widget.noteRepository),
      CalmScreen(
        onNavigateToFeed: _openFeed,
        noteRepository: widget.noteRepository,
      ),
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
      endDrawer: Drawer(
        backgroundColor: FuryColors.panel,
        surfaceTintColor: Colors.transparent,
        child: FuryDrawer(noteRepository: widget.noteRepository),
      ),
      body: Stack(children: [Positioned.fill(child: screens[_index])]),
      bottomNavigationBar: FuryBottomNav(
        selectedIndex: _index,
        onSelected: (value) {
          FuryToastController.instance.clear();
          _selectTab(value, source: 'bottom_nav');
        },
        labels: [l10n.record, l10n.feed, l10n.stats, l10n.calm],
      ),
    );
  }
}

class FuryBottomToast extends StatelessWidget {
  const FuryBottomToast({
    required this.message,
    required this.visible,
    this.backgroundColor = FuryColors.toastSuccess,
    super.key,
  });

  final String? message;
  final bool visible;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final shown = visible && message != null;

    if (!shown && message == null) {
      return const SizedBox.shrink();
    }

    return IgnorePointer(
      child: AnimatedSlide(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOutCubic,
        offset: shown ? Offset.zero : const Offset(0, -0.16),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 140),
          curve: Curves.easeOutCubic,
          opacity: shown ? 1 : 0,
          child: message == null
              ? const SizedBox.shrink()
              : Container(
                  key: const ValueKey('bottom-action-toast'),
                  constraints: const BoxConstraints(minHeight: 44),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 11,
                  ),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: FuryColors.toastText.withValues(alpha: 0.18),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.38),
                        blurRadius: 18,
                        offset: const Offset(0, 8),
                      ),
                      BoxShadow(
                        color: backgroundColor.withValues(alpha: 0.2),
                        blurRadius: 22,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Text(
                    message!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: FuryColors.toastText,
                      decoration: TextDecoration.none,
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
        ),
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
                tooltip: AppLocalizations.of(context).menuTooltip,
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
  const FuryDrawer({this.noteRepository, super.key});

  final RageNoteRepository? noteRepository;

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
                    const _DrawerProfileAvatar(
                      key: ValueKey('drawer-profile-avatar'),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: AnimatedBuilder(
                        animation: AppProfileController.instance,
                        builder: (context, _) {
                          return Text(
                            key: const ValueKey('drawer-profile-name'),
                            AppProfileController.instance.displayNameWithCode(
                              fallback: l10n.profileName,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: FuryColors.text,
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                FutureBuilder<int>(
                  future: _rageNoteCount(),
                  builder: (context, snapshot) {
                    final count = snapshot.data ?? 0;
                    return Container(
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
                      child: Text(
                        l10n.drawerRecordCount(l10n.formatInteger(count)),
                        style: const TextStyle(
                          color: FuryColors.red,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          FuryDrawerTile(
            icon: Icons.settings_outlined,
            title: l10n.settings,
            subtitle: l10n.drawerSettingsSubtitle,
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  settings: const RouteSettings(name: 'settings'),
                  builder: (_) => const SettingsScreen(),
                ),
              );
            },
          ),
          FuryDrawerTile(
            icon: Icons.menu_book_outlined,
            title: l10n.drawerGuide,
            subtitle: l10n.drawerGuideSubtitle,
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  settings: const RouteSettings(name: 'app_guide'),
                  builder: (_) => const AppGuideScreen(),
                ),
              );
            },
          ),
          FuryDrawerTile(
            icon: Icons.spa_outlined,
            title: l10n.drawerCalmGuide,
            subtitle: l10n.drawerCalmGuideSubtitle,
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  settings: const RouteSettings(name: 'calm_guide'),
                  builder: (_) => const CalmGuideScreen(),
                ),
              );
            },
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

  Future<int> _rageNoteCount() async {
    final records = await (noteRepository ?? RageNoteRepository.instance)
        .getAll();
    return records.length;
  }
}

class _DrawerProfileAvatar extends StatelessWidget {
  const _DrawerProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const FuryProfileAvatar(
      size: 44,
      borderRadius: 22,
      fallbackFontSize: 22,
    );
  }
}

class FuryDrawerTile extends StatelessWidget {
  const FuryDrawerTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
    super.key,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
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
