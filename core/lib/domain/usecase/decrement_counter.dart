import '../model/counter.dart';

/// Decrements the current [Counter].
abstract class DecrementCounterUseCase {
  Future<void> execute();
}
