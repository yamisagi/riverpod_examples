import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_examples/basics/basics_provider.dart';

// The ProviderScope is the root of the application.
// It is used to provide providers to the entire application.
// It is also used to override providers for the entire application.
// We need to use ProviderScope at the root of the application.
void main() => runApp(
      const ProviderScope(
        child: MainApp(),
      ),
    );

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      title: 'Riverpod Examples',
      home: const HomePage(),
    );
  }
}