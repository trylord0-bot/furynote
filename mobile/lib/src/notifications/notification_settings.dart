import 'package:shared_preferences/shared_preferences.dart';

class NotificationSettings {
  const NotificationSettings({
    required this.reminderEnabled,
    required this.commentEnabled,
  });

  final bool reminderEnabled;
  final bool commentEnabled;
}

class NotificationSettingsStore {
  const NotificationSettingsStore();

  static const instance = NotificationSettingsStore();
  static const reminderEnabledKey = 'notification.remind_enabled';
  static const commentEnabledKey = 'notification.comment_enabled';

  Future<NotificationSettings> load() async {
    final preferences = await SharedPreferences.getInstance();
    return NotificationSettings(
      reminderEnabled: preferences.getBool(reminderEnabledKey) ?? true,
      commentEnabled: preferences.getBool(commentEnabledKey) ?? true,
    );
  }

  Future<bool> isReminderEnabled() async {
    final settings = await load();
    return settings.reminderEnabled;
  }

  Future<void> setReminderEnabled(bool enabled) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setBool(reminderEnabledKey, enabled);
  }

  Future<void> setCommentEnabled(bool enabled) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setBool(commentEnabledKey, enabled);
  }
}
