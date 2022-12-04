import '../model/counter.dart';
import '../repository/counter.dart';
import 'increment_counter.dart';

/// Increments the current [Counter].
class IncrementCounterUseCaseImpl extends IncrementCounterUseCase {
  IncrementCounterUseCaseImpl(this.counterRepository);
  final CounterRepository counterRepository;

  @override
  Future<void> execute() async {
    final counter = await counterRepository.getCounter();
    final newCounter = counter.copyWith(value: counter.value + 1);
    return counterRepository.saveCounter(newCounter);
  }
}
