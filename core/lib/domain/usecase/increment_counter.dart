import '../model/counter.dart';

/// Increments the current [Counter].
abstract class IncrementCounterUseCase {
  Future<void> execute();
}
