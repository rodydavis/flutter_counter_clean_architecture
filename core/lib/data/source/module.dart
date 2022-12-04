import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'filesystem/filesystem_auto.dart';
import 'filesystem/filesystem.dart';
import 'storage/storage.dart';
import 'storage/storage_impl_file.dart';

part 'module.g.dart';

@riverpod
FileSystemSource files(FilesRef ref) {
  return FileSystemSourceImpl();
}

@riverpod
StorageSource storage(StorageRef ref) {
  return FileStorageImpl(ref.watch(filesProvider));
}
