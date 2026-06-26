import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class ReminderNotificationTap {
  const ReminderNotificationTap({required this.noteId});

  final int noteId;
}

abstract class ReminderNotificationTapSource {
  Stream<ReminderNotificationTap> get reminderNotificationTaps;

  ReminderNotificationTap? takeInitialReminderNotificationTap();
}

abstract class ReminderScheduler {
  Future<void> initialize();

  Future<void> scheduleRageReminder({
    required int id,
    required DateTime scheduledAt,
    required String body,
  });
}

class LocalReminderScheduler
    implements ReminderScheduler, ReminderNotificationTapSource {
  LocalReminderScheduler({FlutterLocalNotificationsPlugin? plugin})
    : _plugin = plugin ?? FlutterLocalNotificationsPlugin();

  static final LocalReminderScheduler instance = LocalReminderScheduler();

  final FlutterLocalNotificationsPlugin _plugin;
  final StreamController<ReminderNotificationTap> _tapController =
      StreamController<ReminderNotificationTap>.broadcast();
  ReminderNotificationTap? _initialTap;
  bool _pluginInitialized = false;
  bool _initialized = false;

  @override
  Stream<ReminderNotificationTap> get reminderNotificationTaps =>
      _tapController.stream;

  @override
  ReminderNotificationTap? takeInitialReminderNotificationTap() {
    final tap = _initialTap;
    _initialTap = null;
    return tap;
  }

  @override
  Future<void> initialize() async {
    if (_initialized) {
      return;
    }

    try {
      await _initializePlugin();
      await _plugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >()
          ?.requestNotificationsPermission();
      await _plugin
          .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin
          >()
          ?.requestPermissions(alert: true, badge: true, sound: true);
      _initialized = true;
    } on MissingPluginException {
      _initialized = false;
    }
  }

  Future<void> _initializePlugin() async {
    if (_pluginInitialized) {
      return;
    }

    await _configureLocalTimezone();
    const initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    await _plugin.initialize(
      settings: initializationSettings,
      onDidReceiveNotificationResponse: _handleNotificationResponse,
    );
    await _captureLaunchNotification();
    _pluginInitialized = true;
  }

  Future<void> _captureLaunchNotification() async {
    final details = await _plugin.getNotificationAppLaunchDetails();
    if (details?.didNotificationLaunchApp ?? false) {
      _initialTap = _tapFromPayload(details?.notificationResponse?.payload);
    }
  }

  void _handleNotificationResponse(NotificationResponse response) {
    final tap = _tapFromPayload(response.payload);
    if (tap != null) {
      _tapController.add(tap);
    }
  }

  ReminderNotificationTap? _tapFromPayload(String? payload) {
    const prefix = 'rage_note:';
    if (payload == null || !payload.startsWith(prefix)) {
      return null;
    }

    final noteId = int.tryParse(payload.substring(prefix.length));
    if (noteId == null) {
      return null;
    }

    return ReminderNotificationTap(noteId: noteId);
  }

  @override
  Future<void> scheduleRageReminder({
    required int id,
    required DateTime scheduledAt,
    required String body,
  }) async {
    if (scheduledAt.isBefore(DateTime.now())) {
      return;
    }

    try {
      await initialize();
      await _plugin.zonedSchedule(
        id: id,
        title: 'Fury Note',
        body: body.isEmpty ? '아까 그 분노, 지금은 어떤가요?' : body,
        scheduledDate: tz.TZDateTime.from(scheduledAt, tz.local),
        notificationDetails: const NotificationDetails(
          android: AndroidNotificationDetails(
            'rage_reminders',
            'Rage reminders',
            channelDescription: 'Reminder notifications for saved rage notes',
            importance: Importance.high,
            priority: Priority.high,
          ),
          iOS: DarwinNotificationDetails(),
        ),
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        payload: 'rage_note:$id',
      );
    } on MissingPluginException {
      return;
    }
  }

  Future<void> cancelAllRageReminders() async {
    try {
      await _initializePlugin();
      await _plugin.cancelAll();
    } on MissingPluginException {
      return;
    }
  }

  Future<void> _configureLocalTimezone() async {
    tz.initializeTimeZones();
    try {
      final timezone = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(timezone.identifier));
    } on MissingPluginException {
      return;
    } on Exception {
      return;
    }
  }
}
