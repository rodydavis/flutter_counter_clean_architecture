import 'dart:convert';

import '../filesystem/filesystem.dart';
import 'storage.dart';

class FileStorageImpl extends StorageSource {
  FileStorageImpl(this.fileSystem);
  final FileSystemSource fileSystem;
  late final String _path = '${fileSystem.currentDirectory()}/storage.json';

  @override
  Future<void> clear() async {
    await fileSystem.delete(_path);
  }

  @override
  Future<void> reload() async {}

  Future<Map<String, Object?>> _read() async {
    final contents = await fileSystem.getString(_path);
    if (contents != null) {
      return jsonDecode(contents) as Map<String, Object?>;
    }
    return <String, Object?>{};
  }

  Future<void> _save(Map<String, Object?> data) async {
    final contents = jsonEncode(data);
    await fileSystem.setString(_path, contents);
  }

  @override
  Future<String?> getString(String key, String? fallback) async {
    final prefs = await _read();
    final value = prefs[key];
    if (value != null && value is String) {
      return value;
    } else {
      return fallback;
    }
  }

  @override
  Future<void> setString(String key, String? value) async {
    final prefs = await _read();
    if (value == null) {
      prefs.remove(key);
    } else {
      prefs[key] = value;
    }
    await _save(prefs);
  }

  @override
  Future<bool?> getBool(String key, bool? fallback) async {
    final prefs = await _read();
    final value = prefs[key];
    if (value is bool) {
      return value;
    } else if (value != null && value is bool) {
      return value;
    } else {
      return fallback;
    }
  }

  @override
  Future<void> setBool(String key, bool? value) async {
    final prefs = await _read();
    if (value == null) {
      prefs.remove(key);
    } else {
      prefs[key] = value;
    }
    await _save(prefs);
  }

  @override
  Future<int?> getInt(String key, int? fallback) async {
    final prefs = await _read();
    final value = prefs[key];
    if (value is int) {
      return value;
    } else if (value != null && int.tryParse(value.toString()) != null) {
      return int.parse(value.toString());
    } else {
      return fallback;
    }
  }

  @override
  Future<void> setInt(String key, int? value) async {
    final prefs = await _read();
    if (value == null) {
      prefs.remove(key);
    } else {
      prefs[key] = value;
    }
    await _save(prefs);
  }

  @override
  Future<double?> getDouble(String key, double? fallback) async {
    final prefs = await _read();
    final value = prefs[key];
    if (value is double) {
      return value;
    } else if (value != null && double.tryParse(value.toString()) != null) {
      return double.parse(value.toString());
    } else {
      return fallback;
    }
  }

  @override
  Future<void> setDouble(String key, double? value) async {
    final prefs = await _read();
    if (value == null) {
      prefs.remove(key);
    } else {
      prefs[key] = value;
    }
    await _save(prefs);
  }
}
