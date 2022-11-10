import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const List<String> names = [
  'John',
  'Paul',
  'George',
  'Ringo',
  'Alex',
  'Pete',
  'Stuart',
  'Mick',
  'Kurt',
  'Dave',
  'Chris',
  'Matt',
  'Tom',
  'Mike',
  'Dave',
  'Ian',
];

final tickerProvider = StreamProvider<int>((ref) {
  // We are using the Stream.periodic method to create a stream that emits
  // a value every 1 second.
  return Stream.periodic(
    const Duration(seconds: 1),
    (number) {
      // We will control the count of the stream because we don't want it to bigger than the length of the names list.
      // If it is bigger than the length of the names list it will throw error, we will reset it to 0 or stop it at lenght of names list.
      number = number >= names.length ? names.length : number;
      return number;
    },
  );
});

final nameProvider = StreamProvider((ref) {
  // This is important - we need to watch the tickerProviders stream not just the tickerProvider.
  // Because if we don't watch the stream, we will just watch AsyncValue and not the actual value.
  final ourStream = ref.watch(tickerProvider.stream);
  return ourStream.map((count) => names.getRange(0, count));
});

//? So we created 2 providers, one is the StreamProvider and the other is dependent on the first one.
//? The first one is the tickerProvider and it is a StreamProvider that emits a value every 1 second.
//? The second one is the nameProvider and it is a StreamProvider that depends on the tickerProvider.
//? With this way we are packaging the tickerProvider and the nameProvider together.


class StreamProviderExample extends ConsumerWidget {
  const StreamProviderExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameList = ref.watch(nameProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Stream Provider Example'),
      ),
      body: nameList.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final name = data.toList()[index];
              return ListTile(
                title: Text(name),
              );
            },
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => const Center(
          child: Text('Something went wrong'),
        ),
      ),
    );
  }
}
