import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_examples/fav_film_app/data.dart';
import 'package:riverpod_examples/fav_film_app/film_model.dart';

class FilmNotifier extends StateNotifier<List<FilmModel>> {
  FilmNotifier() : super(MockData.films);

  void updateFilm(FilmModel film, bool isFavorite) {
    state = state
        .map((selectedFilm) => selectedFilm.id == film.id //
            ? selectedFilm.copyWith(isFavorite: isFavorite)
            : selectedFilm)
        .toList();
  }
}
