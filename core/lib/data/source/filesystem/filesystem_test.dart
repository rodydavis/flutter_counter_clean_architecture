// ignore_for_file: depend_on_referenced_packages
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';

import '../filesystem/filesystem_impl_memory.dart';
import 'filesystem.dart';

void main() {
  final FileSystemSource filesystem = FileSystemSourceImpl();
  group('${filesystem.runtimeType} storage tests', () {
    test('String tests', () async {
      const path = 'test.txt';
      const content = 'Hello world!';

      final value = await filesystem.getString(path);

      expect(value, null);

      await filesystem.setString(path, content);
      final newValue = await filesystem.getString(path);

      expect(newValue, content);

      await filesystem.delete(path);
      final deletedValue = await filesystem.getString(path);

      expect(deletedValue, null);
    });

    test('Bytes test', () async {
      const path = 'test.txt';
      final content = Uint8List.fromList([1, 2, 3, 4, 5]);

      final value = await filesystem.getBytes(path);

      expect(value, null);

      await filesystem.setBytes(path, content);
      final newValue = await filesystem.getBytes(path);

      expect(newValue, content);

      await filesystem.delete(path);
      final deletedValue = await filesystem.getBytes(path);

      expect(deletedValue, null);
    });
  });
}
