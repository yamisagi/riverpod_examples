import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_examples/fav_film_app/data.dart';
import 'package:riverpod_examples/fav_film_app/film_model.dart';
import 'package:riverpod_examples/fav_film_app/state_notifier.dart';

final favoriteStatusProvider =
    StateProvider<FavoriteFilmStatus>((_) => FavoriteFilmStatus.all);

// All films provider

final allFilmsProvider =
    StateNotifierProvider<FilmNotifier, List<FilmModel>>((_) {
  return FilmNotifier();
});

// Favorite films provider based on the all films provider

final favoriteFilmsProvider = Provider<Iterable<FilmModel>>((ref) {
  return ref.watch(allFilmsProvider).where(
        (film) => film.isFavorite,
      );
});

// Not favorite films provider based on the all films provider

final notFavoriteFilmsProvider = Provider<Iterable<FilmModel>>((ref) {
  return ref.watch(allFilmsProvider).where(
        (film) => !film.isFavorite,
      );
});
