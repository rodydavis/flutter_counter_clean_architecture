import '../model/counter.dart';

/// Sets the current [Counter].
abstract class SetCounterUseCase {
  Future<void> execute(int value);
}
