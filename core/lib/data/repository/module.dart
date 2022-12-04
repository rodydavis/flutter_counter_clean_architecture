import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/repository/counter.dart';
import '../source/module.dart';
import 'counter_impl.dart';

part 'module.g.dart';

@riverpod
CounterRepository counterRepository(CounterRepositoryRef ref) {
  return CounterRepositoryImpl(ref.watch(storageProvider));
}
