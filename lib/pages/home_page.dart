import 'package:flutter/material.dart';
import 'package:riverpod_examples/constant/const.dart';
import 'package:riverpod_examples/widgets/router_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Examples'),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: Constants.routesList.length,
        itemBuilder: (context, index) {
          final route = Constants.routesList[index];
          // To prevent show the first item <HomePage>
          if (index == 0) return const SizedBox();
          return RouterButton(
            title: route['title'],
            routeName: route['route'],
            subtitle: route['subtitle'],
          );
        },
      ),
    );
  }
}
