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
        } //
            [city] //
        ??
        'Unknown',
  );
}

// We are basically creating a provider for UI to read the data.
final currentCityProvider = StateProvider<Cities?>((ref) => null);

// This is the provider that will be used to load the data asynchronously.
// And it will be used in combination with the currentCityProvider.
final weatherProvider = FutureProvider<WidgetMoji>((ref) {
  final city = ref.watch(currentCityProvider);
  if (city != null) {
    return fetchMoji(city);
  } else {
    return Future.value('Unknown');
  }
});

class FutureProviderExample extends ConsumerWidget {
  const FutureProviderExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentWeather = ref.watch(weatherProvider);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Future Provider Example'),
        ),
        body: Column(
          children: [
            // This is the UI that will be used to select the city.
            // When the user selects a city, the currentCityProvider will be updated.
            // And the weatherProvider will be updated.
            // This AsyncValue is when getting the data from the weatherProvider.
            // It will return us a Widget that will be used to display the data. That is why we are using the AsyncValue.when() as Widget.
            currentWeather.when(
              data: (data) => Text(
                data.toString(),
                style: Theme.of(context).textTheme.headline2,
              ),
              loading: () => const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              ),
              error: (_, __) => const Text('Error'),
            ),
            Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    final city = Cities.values[index];
                    final isSelected = city == ref.watch(currentCityProvider);
                    return ListTile(
                      title: Text(city.name),
                      trailing: isSelected
                          ? const Icon(Icons.check)
                          : const SizedBox.shrink(),
                      onTap: () => isSelected
                          ? ref.read(currentCityProvider.notifier).state = null
                          : ref.read(currentCityProvider.notifier).state = city,
                    );
                  },
                  itemCount: Cities.values.length),
            )
          ],
        ));
  }
}
