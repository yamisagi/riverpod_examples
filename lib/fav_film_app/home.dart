import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_examples/fav_film_app/data.dart';
import 'package:riverpod_examples/fav_film_app/film_widget.dart';
import 'package:riverpod_examples/fav_film_app/providers.dart';

class FavFilmApp extends ConsumerWidget {
  const FavFilmApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Film App'),
      ),
      body: Column(
        children: [
          const Center(child: FilterWidget()),
          // Here is a tip about when to use Consumer.
          // If we don't use Consumer, we will have to use ref.watch to watch the provider above.
          // And this will cause the widget to rebuild when the provider changes. But we don't want that.
          // We don't want the FilterWidget to rebuild when the provider changes. We only want the FilmsWidget to rebuild.
          // So we use Consumer here.
          Consumer(builder: (context, ref, child) {
            final status = ref.watch(favoriteStatusProvider.state).state;
            switch (status) {
              case FavoriteFilmStatus.all:
                return FilmsWidget(filmsProvider: allFilmsProvider);
              case FavoriteFilmStatus.favorite:
                return FilmsWidget(filmsProvider: favoriteFilmsProvider);
              case FavoriteFilmStatus.notFavorite:
                return FilmsWidget(filmsProvider: notFavoriteFilmsProvider);
            }
          }),
        ],
      ),
    );
  }
}

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final filter = ref.watch(favoriteStatusProvider);
      return DropdownButton<FavoriteFilmStatus>(
        value: filter,
        items: FavoriteFilmStatus.values
            .map(
              (status) => DropdownMenuItem(
                value: status,
                child: Text(status.name),
              ),
            )
            .toList(),
        onChanged: (value) {
          ref.read(favoriteStatusProvider.state).state = value!;
        },
      );
    });
  }
}
