import 'package:shared_preferences/shared_preferences.dart';

import 'storage.dart';

class PreferencesStorageImpl extends StorageSource {
  SharedPreferences? prefs;

  Future<SharedPreferences> check() async {
    prefs ??= await SharedPreferences.getInstance();
    return prefs!;
  }

  @override
  Future<void> clear() async {
    final prefs = await check();
    prefs.clear();
  }

  @override
  Future<void> reload() async {
    final prefs = await check();
    prefs.reload();
  }

  @override
  Future<String?> getString(String key, String? fallback) async {
    final prefs = await check();
    final value = prefs.getString(key);
    if (value != null && value.isNotEmpty) {
      return value;
    } else {
      return fallback;
    }
  }

  @override
  Future<void> setString(String key, String? value) async {
    final prefs = await check();
    if (value == null) {
      await prefs.remove(key);
    } else {
      await prefs.setString(key, value);
    }
  }

  @override
  Future<bool?> getBool(String key, bool? fallback) async {
    final prefs = await check();
    final value = prefs.getBool(key);
    if (value != null) {
      return value;
    } else {
      return fallback;
    }
  }

  @override
  Future<void> setBool(String key, bool? value) async {
    final prefs = await check();
    if (value == null) {
      await prefs.remove(key);
    } else {
      await prefs.setBool(key, value);
    }
  }

  @override
  Future<int?> getInt(String key, int? fallback) async {
    final prefs = await check();
    final value = prefs.getInt(key);
    if (value != null) {
      return value;
    } else {
      return fallback;
    }
  }

  @override
  Future<void> setInt(String key, int? value) async {
    final prefs = await check();
    if (value == null) {
      await prefs.remove(key);
    } else {
      await prefs.setInt(key, value);
    }
  }

  @override
  Future<double?> getDouble(String key, double? fallback) async {
    final prefs = await check();
    final value = prefs.getDouble(key);
    if (value != null) {
      return value;
    } else {
      return fallback;
    }
  }

  @override
  Future<void> setDouble(String key, double? value) async {
    final prefs = await check();
    if (value == null) {
      await prefs.remove(key);
    } else {
      await prefs.setDouble(key, value);
    }
  }
}
