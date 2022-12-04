import 'dart:html';

import 'package:counter_core/counter_core.dart';
import 'package:riverpod/riverpod.dart';

void main() async {
  final container = ProviderContainer();
  final model = container.read(counterStateProvider);
  final output = querySelector('#counter')!;

  model.addListener((counter) {
    final value = model.get().value;
    output.text = "Counter value: $value";
  });

  await model.load();

  final incrementButton = querySelector('#increment')!;
  incrementButton.onClick.listen((_) async {
    await model.increment();
  });

  final decrementButton = querySelector('#decrement')!;
  decrementButton.onClick.listen((_) async {
    await model.decrement();
  });
}
