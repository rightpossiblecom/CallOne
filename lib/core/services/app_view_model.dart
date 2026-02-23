import 'dart:convert';
import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../services/storage_service.dart';

class AppViewModel extends ChangeNotifier {
  final StorageService _storageService;

  AppViewModel(this._storageService) {
    _loadData();
  }

  // State
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  List<String> _contacts = [];
  List<String> get contacts => _contacts;

  int _currentContactIndex = 0;
  int get currentContactIndex => _currentContactIndex;

  String get currentContactName => _contacts.isNotEmpty
      ? _contacts[_currentContactIndex]
      : 'Tap Settings to add a name';

  int _reminderDay = 7; // Default Sunday
  int get reminderDay => _reminderDay;

  bool _notificationsEnabled = true;
  bool get notificationsEnabled => _notificationsEnabled;

  bool _rotatingModeEnabled = false;
  bool get rotatingModeEnabled => _rotatingModeEnabled;

  int _currentStreak = 0;
  int get currentStreak => _currentStreak;

  int _longestStreak = 0;
  int get longestStreak => _longestStreak;

  bool _callCompletedThisWeek = false;
  bool get callCompletedThisWeek => _callCompletedThisWeek;

  List<Map<String, dynamic>> _weeklyHistory = [];
  List<Map<String, dynamic>> get weeklyHistory => _weeklyHistory;

  Future<void> _loadData() async {
    _isLoading = true;
    notifyListeners();

    // Load Settings
    _contacts = _storageService.getStringList(
      AppConstants.contactsKey,
      isSettings: true,
    );
    _currentContactIndex = _storageService.getInt(
      AppConstants.currentContactIndexKey,
      isSettings: true,
    );
    _reminderDay = _storageService.getInt(
      AppConstants.reminderDayKey,
      defaultValue: 7,
      isSettings: true,
    );
    _notificationsEnabled = _storageService.getBool(
      AppConstants.notificationsEnabledKey,
      defaultValue: true,
      isSettings: true,
    );
    _rotatingModeEnabled = _storageService.getBool(
      AppConstants.rotatingModeEnabledKey,
      defaultValue: false,
      isSettings: true,
    );

    // Load Data (Streak & History)
    _currentStreak = _storageService.getInt(AppConstants.currentStreakKey);
    _longestStreak = _storageService.getInt(AppConstants.longestStreakKey);

    final historyListStr = _storageService.getStringList(
      AppConstants.weeklyHistoryKey,
    );
    _weeklyHistory = historyListStr
        .map((e) => jsonDecode(e) as Map<String, dynamic>)
        .toList();

    // Check if call was completed this week
    _checkWeeklyStatus();

    _isLoading = false;
    notifyListeners();
  }

  void _checkWeeklyStatus() {
    // Basic logic to determine if the call has been made this week.
    // In a real app we'd compare dates more robustly with isoweek.
    // For this minimal MVP, we check the last call date.
    final lastCallStr = _storageService.getString(AppConstants.lastCallDateKey);
    if (lastCallStr == null) {
      _callCompletedThisWeek = false;
      return;
    }

    final lastCallDate = DateTime.parse(lastCallStr);
    final now = DateTime.now();
    final difference = now.difference(lastCallDate).inDays;

    // If it's been less than 7 days and we haven't crossed to the next reminder day strictly...
    // simpler approximation for the utility app:
    if (difference < 7 && now.weekday >= lastCallDate.weekday) {
      _callCompletedThisWeek = true;
    } else {
      _callCompletedThisWeek = false;
      // If we missed it, reset current streak
      if (difference >= 7) {
        _currentStreak = 0;
        _saveStreak();
      }
    }
  }

  // --- Actions ---

  Future<void> markCallCompleted() async {
    if (_callCompletedThisWeek) return;

    _callCompletedThisWeek = true;
    _currentStreak++;

    if (_currentStreak > _longestStreak) {
      _longestStreak = _currentStreak;
    }

    final now = DateTime.now();
    await _storageService.saveString(
      AppConstants.lastCallDateKey,
      now.toIso8601String(),
    );

    // Add to history
    _weeklyHistory.insert(0, {
      'date': now.toIso8601String(),
      'status': 'Completed',
      'contact': currentContactName,
    });

    await _saveStreak();
    await _saveHistory();

    if (_rotatingModeEnabled && _contacts.length > 1) {
      _currentContactIndex = (_currentContactIndex + 1) % _contacts.length;
      await _storageService.saveInt(
        AppConstants.currentContactIndexKey,
        _currentContactIndex,
        isSettings: true,
      );
    }

    notifyListeners();
  }

  Future<void> updateContacts(List<String> newContacts) async {
    _contacts = newContacts;
    if (_currentContactIndex >= _contacts.length) {
      _currentContactIndex = 0;
    }
    await _storageService.saveStringList(
      AppConstants.contactsKey,
      _contacts,
      isSettings: true,
    );
    await _storageService.saveInt(
      AppConstants.currentContactIndexKey,
      _currentContactIndex,
      isSettings: true,
    );
    notifyListeners();
  }

  Future<void> setReminderDay(int day) async {
    _reminderDay = day;
    await _storageService.saveInt(
      AppConstants.reminderDayKey,
      day,
      isSettings: true,
    );
    notifyListeners();
  }

  Future<void> toggleRotatingMode(bool value) async {
    _rotatingModeEnabled = value;
    await _storageService.saveBool(
      AppConstants.rotatingModeEnabledKey,
      value,
      isSettings: true,
    );
    if (!value) {
      // If disabled, snap back to index 0
      _currentContactIndex = 0;
      await _storageService.saveInt(
        AppConstants.currentContactIndexKey,
        0,
        isSettings: true,
      );
    }
    notifyListeners();
  }

  Future<void> toggleNotifications(bool value) async {
    _notificationsEnabled = value;
    await _storageService.saveBool(
      AppConstants.notificationsEnabledKey,
      value,
      isSettings: true,
    );
    notifyListeners();
  }

  Future<void> resetData() async {
    await _storageService.clearAll();
    await _loadData();
  }

  Future<void> _saveStreak() async {
    await _storageService.saveInt(
      AppConstants.currentStreakKey,
      _currentStreak,
    );
    await _storageService.saveInt(
      AppConstants.longestStreakKey,
      _longestStreak,
    );
  }

  Future<void> _saveHistory() async {
    final encodedList = _weeklyHistory.map((e) => jsonEncode(e)).toList();
    await _storageService.saveStringList(
      AppConstants.weeklyHistoryKey,
      encodedList,
    );
  }
}
