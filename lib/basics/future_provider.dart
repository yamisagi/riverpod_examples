import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// The FutureProvider is a provider that can be used to load data asynchronously.
// It is similar to the AsyncValue class.
// The difference is that the FutureProvider is a provider, and can be used in
// combination with other providers.


enum Cities { newYork, london, paris }

// Defining types for making the code more readable.
typedef WidgetMoji = String;

Future<WidgetMoji> fetchMoji(Cities city) async {
  // Simulate a network request
  // This is a fake network request that takes 2 seconds to complete. And it returns
  // a String like a weather app.
  return Future.delayed(
      const Duration(seconds: 2),
      () =>
          {
            Cities.london: '🌨️',
            Cities.newYork: '☀️',
            Cities.paris: '🌦️',
          }[city] ??
          '🌫️');
}


class FutureProviderExample extends ConsumerWidget {
  const FutureProviderExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Riverpod Examples'),
      ),
      body: const Center(
        child: Text(
          'Future Provider',
        ),
      ),
    );
  }
}
