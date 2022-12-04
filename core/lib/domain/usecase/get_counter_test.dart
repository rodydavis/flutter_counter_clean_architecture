// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';

import '../../data/repository/counter_impl.dart';
import '../../data/source/filesystem/filesystem_impl_memory.dart';
import '../../data/source/storage/storage.dart';
import '../../data/source/storage/storage_impl_file.dart';
import '../repository/counter.dart';
import 'get_counter.dart';
import 'get_counter_impl.dart';

void main() {
  test('Get counter test', () async {
    final StorageSource storage = FileStorageImpl(FileSystemSourceImpl());
    final CounterRepository repository = CounterRepositoryImpl(storage);
    final GetCounterUseCase getCounter = GetCounterUseCaseImpl(repository);

    final counter = await getCounter.execute();

    expect(counter.value, 0);
  });
}
