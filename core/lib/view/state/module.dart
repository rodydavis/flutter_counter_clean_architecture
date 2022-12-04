import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/model/counter.dart';
import '../../domain/usecase/module.dart';
import 'counter.dart';

part 'module.g.dart';

@riverpod
CounterState counterState(CounterStateRef ref) {
  return CounterState(
    getCounter: ref.watch(getCounterProvider),
    resetCounter: ref.watch(resetCounterProvider),
    incrementCounter: ref.watch(incrementCounterProvider),
    decrementCounter: ref.watch(decrementCounterProvider),
    setCounter: ref.watch(setCounterProvider),
  );
}

final counterProvider =
    StateNotifierProvider.autoDispose<CounterState, Counter>((ref) {
  return ref.watch(counterStateProvider);
});
