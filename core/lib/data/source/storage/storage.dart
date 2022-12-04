import 'dart:convert';

/// Storage to be saved by key/value.
abstract class StorageSource {
  /// Remove all settings
  Future<void> clear();

  /// Reload all settings
  Future<void> reload();

  /// Get a string by key
  Future<String?> getString(
    final String key,
    final String? fallback,
  );

  /// Set a string by key
  Future<void> setString(
    final String key,
    final String? value,
  );

  /// Get a bool by key
  Future<bool?> getBool(
    final String key,
    final bool? fallback,
  );

  /// Set a bool by key
  Future<void> setBool(
    final String key,
    final bool? value,
  );

  /// Get a int by key
  Future<int?> getInt(
    final String key,
    final int? fallback,
  );

  /// Set a int by key
  Future<void> setInt(
    final String key,
    final int? value,
  );

  /// Get a double by key
  Future<double?> getDouble(
    final String key,
    final double? fallback,
  );

  /// Set a double by key
  Future<void> setDouble(
    final String key,
    final double? value,
  );

  /// Get a date by key
  Future<DateTime?> getDateTime(
    final String key,
    final DateTime? fallback,
  ) async {
    final value = await getString(key, null);
    if (value == null) {
      return fallback;
    } else {
      return DateTime.parse(value);
    }
  }

  /// Set a date by key
  Future<void> setDateTime(
    final String key,
    final DateTime? value,
  ) async {
    if (value == null) {
      await setString(key, null);
    } else {
      await setString(key, value.toIso8601String());
    }
  }

  /// Get json by key
  Future<Map<String, Object?>?> getJson(
    final String key,
    final Map<String, Object?>? fallback,
  ) async {
    final value = await getString(key, null);
    if (value == null || value.isEmpty) {
      return fallback;
    } else {
      return jsonDecode(value);
    }
  }

  /// Set json by key
  Future<void> setJson(
    final String key,
    final Map<String, Object?>? value,
  ) async {
    if (value == null || value.isEmpty) {
      await setString(key, null);
    } else {
      await setString(key, jsonEncode(value));
    }
  }
}
