import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../constants/app_constants.dart';

class StorageService {
  late Box<String> _settingsBox;
  late Box<String> _dataBox;

  Future<void> init() async {
    await Hive.initFlutter();
    _settingsBox = await Hive.openBox<String>(AppConstants.settingsBox);
    _dataBox = await Hive.openBox<String>(AppConstants.dataBox);
  }

  // --- Generic Helpers ---
  String? getString(String key, {bool isSettings = false}) {
    return isSettings ? _settingsBox.get(key) : _dataBox.get(key);
  }

  Future<void> saveString(
    String key,
    String value, {
    bool isSettings = false,
  }) async {
    isSettings
        ? await _settingsBox.put(key, value)
        : await _dataBox.put(key, value);
  }

  bool getBool(
    String key, {
    bool defaultValue = false,
    bool isSettings = false,
  }) {
    final val = isSettings ? _settingsBox.get(key) : _dataBox.get(key);
    return val != null ? val == 'true' : defaultValue;
  }

  Future<void> saveBool(
    String key,
    bool value, {
    bool isSettings = false,
  }) async {
    isSettings
        ? await _settingsBox.put(key, value.toString())
        : await _dataBox.put(key, value.toString());
  }

  int getInt(String key, {int defaultValue = 0, bool isSettings = false}) {
    final val = isSettings ? _settingsBox.get(key) : _dataBox.get(key);
    return val != null ? int.tryParse(val) ?? defaultValue : defaultValue;
  }

  Future<void> saveInt(String key, int value, {bool isSettings = false}) async {
    isSettings
        ? await _settingsBox.put(key, value.toString())
        : await _dataBox.put(key, value.toString());
  }

  List<String> getStringList(String key, {bool isSettings = false}) {
    final val = isSettings ? _settingsBox.get(key) : _dataBox.get(key);
    if (val == null) return [];
    try {
      final decoded = jsonDecode(val) as List;
      return decoded.map((e) => e.toString()).toList();
    } catch (e) {
      debugPrint('Error decoding string list: $e');
      return [];
    }
  }

  Future<void> saveStringList(
    String key,
    List<String> value, {
    bool isSettings = false,
  }) async {
    final encoded = jsonEncode(value);
    isSettings
        ? await _settingsBox.put(key, encoded)
        : await _dataBox.put(key, encoded);
  }

  Future<void> clearAll() async {
    await _settingsBox.clear();
    await _dataBox.clear();
  }
}
