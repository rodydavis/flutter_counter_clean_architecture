import '../model/counter.dart';
import '../repository/counter.dart';
import 'set_counter.dart';

/// Sets the current [Counter].
class SetCounterUseCaseImpl extends SetCounterUseCase {
  SetCounterUseCaseImpl(this.counterRepository);
  final CounterRepository counterRepository;

  @override
  Future<void> execute(int value) async {
    final counter = await counterRepository.getCounter();
    final newCounter = counter.copyWith(value: value);
    return counterRepository.saveCounter(newCounter);
  }
}
