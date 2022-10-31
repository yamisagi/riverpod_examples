import 'package:riverpod_examples/basics/basics_provider.dart';
import 'package:riverpod_examples/basics/future_provider.dart';
import 'package:riverpod_examples/pages/home_page.dart';

class Constants {
  // This is the list of all the routes in the application.
  // We can use this list to generate the routes.
  static final List<Map<String, dynamic>> routesList = [
    {
      'title': 'Home',
      'route': '/',
      'page': const HomePage(),
      'subtitle': 'This is the home page',
    },
    {
      'title': 'Basics Provider',
      'route': '/basics_provider',
      'page':  const BasicProviderExample(),
      'subtitle': 'This is the basics provider page returns DateTime',
    },
    {
      'title': 'Future Provider',
      'route': '/future_provider',
      'page': const FutureProviderExample(),
      'subtitle':
          'This is the future provider page simulates network request and returns String',
    },
  ];
}
