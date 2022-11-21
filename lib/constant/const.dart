import 'package:riverpod_examples/basics/basics_provider.dart';
import 'package:riverpod_examples/basics/future_provider.dart';
import 'package:riverpod_examples/basics/stream_provider.dart';
import 'package:riverpod_examples/fav_film_app/home.dart';
import 'package:riverpod_examples/pages/home_page.dart';
import 'package:riverpod_examples/person_list_app/person_list.dart';

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
      'page': const BasicProviderExample(),
      'subtitle': 'This is the basics provider page returns DateTime',
    },
    {
      'title': 'Future Provider',
      'route': '/future_provider',
      'page': const FutureProviderExample(),
      'subtitle':
          'This is the future provider page simulates network request and returns String',
    },
    {
      'title': 'Stream Provider',
      'route': '/stream_provider',
      'page': const StreamProviderExample(),
      'subtitle':
          'This is the stream provider page simulates network request and returns String',
    },
    {
      'title': 'Person List App',
      'route': '/person_list_app',
      'page': const PersonList(),
      'subtitle':
          'This is the person list app page with basic update functionality',
    },
    {
      'title': 'Fav Film App',
      'route': '/fav_film_app',
      'page': const FavFilmApp(),
      'subtitle':
          'This is the StateNotifierProvider page with basic update functionality',
    }
  ];
}
