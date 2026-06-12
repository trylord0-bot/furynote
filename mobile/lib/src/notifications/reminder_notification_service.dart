import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

abstract class ReminderScheduler {
  Future<void> initialize();

  Future<void> scheduleRageReminder({
    required int id,
    required DateTime scheduledAt,
    required String body,
  });
}

class LocalReminderScheduler implements ReminderScheduler {
  LocalReminderScheduler({FlutterLocalNotificationsPlugin? plugin})
    : _plugin = plugin ?? FlutterLocalNotificationsPlugin();

  static final LocalReminderScheduler instance = LocalReminderScheduler();

  final FlutterLocalNotificationsPlugin _plugin;
  bool _initialized = false;

  @override
  Future<void> initialize() async {
    if (_initialized) {
      return;
    }

    try {
      await _configureLocalTimezone();
      const initializationSettings = InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(),
      );
      await _plugin.initialize(settings: initializationSettings);
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
