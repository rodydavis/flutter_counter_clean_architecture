import '../model/counter.dart';
import '../repository/counter.dart';
import 'reset_counter.dart';

/// Resets the current [Counter].
class ResetCounterUseCaseImpl extends ResetCounterUseCase {
  ResetCounterUseCaseImpl(this.counterRepository);
  final CounterRepository counterRepository;

  @override
  Future<void> execute() async {
    final counter = await counterRepository.getCounter();
    final newCounter = counter.copyWith(value: 0);
    return counterRepository.saveCounter(newCounter);
  }
}
