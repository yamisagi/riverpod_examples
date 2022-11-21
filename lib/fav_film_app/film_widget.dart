import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_examples/fav_film_app/film_model.dart';
import 'package:riverpod_examples/fav_film_app/providers.dart';

class FilmsWidget extends ConsumerWidget {
  // ALwaysAliveProvider is used to keep the state of the widget. The reason is that we are using this,
  // Is because we will pass it through in home.dart. And we have 3 providers there, and AlwatysAliveProvider is mixin to all of them.
  final AlwaysAliveProviderBase<Iterable<FilmModel>> filmsProvider;
  const FilmsWidget({required this.filmsProvider, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // We are using our provider here, and we are using the watch method to watch the provider.
    final films = ref.watch(filmsProvider);

    return Expanded(
        child: ListView.builder(
      itemBuilder: (context, index) {
        final film = films.elementAt(index);
        return ListTile(
          title: Text(film.title),
          subtitle: Text(film.description),
          trailing: IconButton(
            icon:
                Icon(film.isFavorite ? Icons.favorite : Icons.favorite_border),
            onPressed: () {
              final isFavorite = !film.isFavorite;
              ref.read(allFilmsProvider.notifier).updateFilm(film, isFavorite);
            },
          ),
        );
      },
      itemCount: films.length,
    ));
  }
}
