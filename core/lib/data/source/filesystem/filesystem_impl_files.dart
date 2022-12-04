import 'dart:typed_data';

import 'package:file/file.dart';

import 'filesystem.dart';

class FileSystemSourceImpl extends FileSystemSource {
  FileSystemSourceImpl(this.source);
  final FileSystem source;

  @override
  Future<bool> exists(String path) async {
    return source.file(path).exists();
  }

  @override
  Future<void> delete(String path) async {
    if (await exists(path)) {
      await source.file(path).delete();
    }
  }

  @override
  Future<Uint8List?> getBytes(String path) async {
    if (await exists(path)) {
      return source.file(path).readAsBytes();
    }
    return null;
  }

  @override
  Future<String?> getString(String path) async {
    if (await exists(path)) {
      return source.file(path).readAsString();
    }
    return null;
  }

  @override
  Future<void> setBytes(String path, Uint8List value) async {
    final file = source.file(path);
    await file.create(recursive: true);
    await file.writeAsBytes(value);
  }

  @override
  Future<void> setString(String path, String value) async {
    final file = source.file(path);
    await file.create(recursive: true);
    await file.writeAsString(value);
  }

  @override
  String currentDirectory() {
    return source.currentDirectory.path;
  }
}
