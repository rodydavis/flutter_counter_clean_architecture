import '../model/counter.dart';
import '../repository/counter.dart';
import 'get_counter.dart';

/// Gets the current [Counter].
class GetCounterUseCaseImpl extends GetCounterUseCase {
  GetCounterUseCaseImpl(this.counterRepository);
  final CounterRepository counterRepository;

  @override
  Future<Counter> execute() async {
    return counterRepository.getCounter();
  }
}
