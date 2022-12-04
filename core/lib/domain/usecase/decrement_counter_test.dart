// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';

import '../../data/repository/counter_impl.dart';
import '../../data/source/filesystem/filesystem_impl_memory.dart';
import '../../data/source/storage/storage.dart';
import '../../data/source/storage/storage_impl_file.dart';
import '../repository/counter.dart';
import 'get_counter.dart';
import 'get_counter_impl.dart';
import 'decrement_counter.dart';
import 'decrement_counter_impl.dart';

void main() {
  test('Decrement counter test', () async {
    final StorageSource storage = FileStorageImpl(FileSystemSourceImpl());
    final CounterRepository repository = CounterRepositoryImpl(storage);
    final GetCounterUseCase getCounter = GetCounterUseCaseImpl(repository);
    final DecrementCounterUseCase usecase =
        DecrementCounterUseCaseImpl(repository);

    final counter = await getCounter.execute();

    expect(counter.value, 0);

    await usecase.execute();
    final newCounter = await getCounter.execute();

    expect(newCounter.value, -1);
  });
}
