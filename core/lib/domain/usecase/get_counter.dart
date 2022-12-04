import '../model/counter.dart';

/// Gets the current [Counter].
abstract class GetCounterUseCase {
  Future<Counter> execute();
}
