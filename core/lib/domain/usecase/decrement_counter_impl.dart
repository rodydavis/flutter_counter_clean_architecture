import '../model/counter.dart';
import '../repository/counter.dart';
import 'decrement_counter.dart';

/// Decrements the current [Counter].
class DecrementCounterUseCaseImpl extends DecrementCounterUseCase {
  DecrementCounterUseCaseImpl(this.counterRepository);
  final CounterRepository counterRepository;

  @override
  Future<void> execute() async {
    final counter = await counterRepository.getCounter();
    final newCounter = counter.copyWith(value: counter.value - 1);
    return counterRepository.saveCounter(newCounter);
  }
}
