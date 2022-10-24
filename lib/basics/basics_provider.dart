import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Our first provider is a simple provider that returns DateTime.
final dateTimeProvider = Provider<DateTime>((ref) {
  return DateTime.now();
});

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // We can read the value of the provider using the ref.watch method.
    // When we use ref.watch, the widget will rebuild when the value changes.
    // And it returns the value of the provider. Not the provider itself, or Stream or anything else.
    final dateTime = ref.watch(dateTimeProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Riverpod Examples'),
      ),
      body: Center(
        child: Text(dateTime.toIso8601String()),
      ),
    );
  }
}
