import 'package:counter_core/data/repository/module.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'decrement_counter.dart';
import 'decrement_counter_impl.dart';
import 'get_counter.dart';
import 'get_counter_impl.dart';
import 'increment_counter.dart';
import 'increment_counter_impl.dart';
import 'reset_counter.dart';
import 'reset_counter_impl.dart';
import 'set_counter.dart';
import 'set_counter_impl.dart';

part 'module.g.dart';

@riverpod
GetCounterUseCase getCounter(GetCounterRef ref) {
  return GetCounterUseCaseImpl(ref.watch(counterRepositoryProvider));
}

@riverpod
SetCounterUseCase setCounter(SetCounterRef ref) {
  return SetCounterUseCaseImpl(ref.watch(counterRepositoryProvider));
}

@riverpod
ResetCounterUseCase resetCounter(ResetCounterRef ref) {
  return ResetCounterUseCaseImpl(ref.watch(counterRepositoryProvider));
}

@riverpod
IncrementCounterUseCase incrementCounter(IncrementCounterRef ref) {
  return IncrementCounterUseCaseImpl(ref.watch(counterRepositoryProvider));
}

@riverpod
DecrementCounterUseCase decrementCounter(DecrementCounterRef ref) {
  return DecrementCounterUseCaseImpl(ref.watch(counterRepositoryProvider));
}
