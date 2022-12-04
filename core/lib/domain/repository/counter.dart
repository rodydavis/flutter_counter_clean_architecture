import '../model/counter.dart';

/// A repository for [Counter]
abstract class CounterRepository {
  /// Returns the current [Counter].
  Future<Counter> getCounter();

  /// Saves the current [Counter].
  Future<void> saveCounter(Counter counter);
}
