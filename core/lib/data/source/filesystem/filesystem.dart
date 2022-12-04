import 'dart:typed_data';

/// A source of files.
abstract class FileSystemSource {
  /// Returns String contents of the file at [path].
  Future<String?> getString(String path);

  /// Sets String contents of the file at [path].
  Future<void> setString(String path, String value);

  /// Returns Uint8List contents of the file at [path].
  Future<Uint8List?> getBytes(String path);

  /// Sets Uint8List contents of the file at [path].
  Future<void> setBytes(String path, Uint8List value);

  /// Deletes the file at [path].
  Future<void> delete(String path);

  /// Returns true if the file at [path] exists.
  Future<bool> exists(String path);

  /// Returns the path to the current directory.
  String currentDirectory();
}
