import '../../domain/model/counter.dart';
import '../../domain/repository/counter.dart';
import '../source/storage/storage.dart';

class CounterRepositoryImpl extends CounterRepository {
  CounterRepositoryImpl(this.storage);
  final StorageSource storage;
  final String counterKey = 'counter';

  @override
  Future<Counter> getCounter() async {
    final value = await storage.getInt(counterKey, null);
    return Counter(value: value ?? 0);
  }

  @override
  Future<void> saveCounter(Counter counter) async {
    await storage.setInt(counterKey, counter.value);
  }
}
