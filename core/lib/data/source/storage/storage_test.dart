// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../filesystem/filesystem_impl_memory.dart';
import 'storage.dart';
import 'storage_impl_file.dart';
import 'storage_impl_preferences.dart';

void main() {
  final implementations = <StorageSource>[
    PreferencesStorageImpl(),
    FileStorageImpl(FileSystemSourceImpl()),
  ];
  for (final settings in implementations) {
    if (settings is PreferencesStorageImpl) {
      // ignore: invalid_use_of_visible_for_testing_member
      SharedPreferences.setMockInitialValues({});
    }
    group('${settings.runtimeType} storage tests', () {
      test('String value retrieve', () async {
        final value = await settings.getString('test', 'N/A');

        expect(value, 'N/A');
      });

      test('Bool value retrieve', () async {
        final value = await settings.getBool('test', false);

        expect(value, false);
      });

      test('Int value retrieve', () async {
        final value = await settings.getInt('test', 0);

        expect(value, 0);
      });

      test('Double value retrieve', () async {
        final value = await settings.getDouble('test', 0);

        expect(value, 0);
      });
    });
  }
}
