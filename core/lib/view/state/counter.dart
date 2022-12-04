import 'package:riverpod/riverpod.dart';

import '../../domain/model/counter.dart';
import '../../domain/usecase/decrement_counter.dart';
import '../../domain/usecase/get_counter.dart';
import '../../domain/usecase/increment_counter.dart';
import '../../domain/usecase/reset_counter.dart';
import '../../domain/usecase/set_counter.dart';

class CounterState extends StateNotifier<Counter> {
  CounterState({
    required this.getCounter,
    required this.resetCounter,
    required this.incrementCounter,
    required this.decrementCounter,
    required this.setCounter,
    int initialValue = 0,
  }) : super(Counter(value: initialValue));

  final GetCounterUseCase getCounter;
  final ResetCounterUseCase resetCounter;
  final IncrementCounterUseCase incrementCounter;
  final DecrementCounterUseCase decrementCounter;
  final SetCounterUseCase setCounter;

  Future<void> reset() async {
    await load();
    await resetCounter.execute();
    state = await getCounter.execute();
  }

  Future<void> increment() async {
    await load();
    await incrementCounter.execute();
    state = await getCounter.execute();
  }

  Future<void> decrement() async {
    await load();
    await decrementCounter.execute();
    state = await getCounter.execute();
  }

  Future<void> set(int value) async {
    await load();
    await setCounter.execute(value);
    state = await getCounter.execute();
  }

  Future<void> load() async {
    state = await getCounter.execute();
  }

  Counter get() {
    return state;
  }
}
