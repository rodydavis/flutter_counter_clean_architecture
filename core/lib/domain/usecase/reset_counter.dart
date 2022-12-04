import '../model/counter.dart';

/// Resets the current [Counter].
abstract class ResetCounterUseCase {
  Future<void> execute();
}
