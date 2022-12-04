import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter.freezed.dart';
part 'counter.g.dart';

/// Counter model with a value.
@freezed
class Counter with _$Counter {
  const factory Counter({
    required int value,
  }) = _Counter;

  factory Counter.fromJson(Map<String, Object?> json) =>
      _$CounterFromJson(json);
}
