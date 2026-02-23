class AppConstants {
  static const String appName = 'CallOne';
  static const String appDescription =
      'A simple app to build a weekly call habit. Pick one person. Call them once per week. Stay consistent.';
  static const String privacyPolicyUrl = 'http://localhost:3000/privacy-policy';
  static const String termsUrl = 'http://localhost:3000/terms';
  static const String supportEmail = 'support@callone.app';
  static const String developerName = 'CallOne Developer';

  // Hive Box Names
  static const String settingsBox = 'settings_box';
  static const String dataBox = 'app_data_box';

  // Hive Keys
  static const String contactsKey = 'contacts_list';
  static const String currentContactIndexKey = 'current_contact_index';
  static const String reminderDayKey = 'reminder_day'; // 1-7 (Mon-Sun)
  static const String reminderTimeKey = 'reminder_time'; // "HH:mm"
  static const String notificationsEnabledKey = 'notifications_enabled';
  static const String rotatingModeEnabledKey = 'rotating_mode_enabled';

  static const String currentStreakKey = 'current_streak';
  static const String longestStreakKey = 'longest_streak';
  static const String lastCallDateKey = 'last_call_date';
  static const String weeklyHistoryKey =
      'weekly_history'; // List of JSON history
}
