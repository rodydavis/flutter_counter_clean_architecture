import 'package:args/args.dart';
import 'package:counter_core/counter_core.dart';
import 'package:riverpod/riverpod.dart';

void main(List<String> arguments) async {
  final parser = ArgParser();
  final container = ProviderContainer();

  // Counter arguments
  parser.addFlag('get', abbr: 'g', help: 'Get the current counter value');
  parser.addFlag('increment', abbr: 'i', help: 'Increment the counter value');
  parser.addFlag('decrement', abbr: 'd', help: 'Decrement the counter value');
  parser.addFlag('reset', abbr: 'r', help: 'Reset the counter value');
  parser.addOption('set', abbr: 's', help: 'Set the counter value');

  // Parse the arguments
  final results = parser.parse(arguments);
  final model = container.read(counterStateProvider);
  await model.load();

  // Increment the counter value
  if (results['increment'] == true) {
    await model.increment();
    final value = model.get().value;
    print('Incremented counter value from $value to ${value + 1}');
  }
  // Decrement the counter value
  else if (results['decrement'] == true) {
    await model.decrement();
    final value = model.get().value;
    print('Decremented counter value from $value to ${value - 1}');
  }
  // Reset the counter value
  else if (results['reset'] == true) {
    await model.reset();
    final value = model.get().value;
    print('Reset counter value from $value to 0');
  }
  // Set the counter value
  else if (results['set'] != null) {
    final newValue = int.parse(results['set']);
    await model.set(newValue);
    final value = model.get().value;
    print('Set counter value from $value to $newValue');
  }
  // Get the current counter value
  else if (results['get'] == true) {
    final value = model.get().value;
    print('Current counter value: $value');
  }
  // No arguments provided
  else {
    print('No arguments provided');
  }
}
