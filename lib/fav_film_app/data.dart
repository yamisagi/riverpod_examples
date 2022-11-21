import 'package:flutter/material.dart';
import 'package:riverpod_examples/fav_film_app/film_model.dart';

enum FavoriteFilmStatus {
  notFavorite,
  all,
  favorite,
}

@immutable
class MockData {
  static const List<FilmModel> films = [
    // Create a list of films.

    FilmModel(
      id: '1',
      title: 'The Godfather',
      description:
          'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.',
      isFavorite: false,
    ),
    FilmModel(
      id: '2',
      title: 'The Dark Knight',
      description:
          'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, the caped crusader must come to terms with one of the greatest psychological tests of his ability to fight injustice.',
      isFavorite: false,
    ),
    FilmModel(
      id: '3',
      title: 'The Superman',
      description:
          'An alien orphan is sent from his dying planet to Earth, where he grows up to become his adoptive home\'s first and greatest superhero.',
      isFavorite: false,
    ),
    FilmModel(
      id: '4',
      title: 'The Hobbit',
      description:
          'A reluctant hobbit, Bilbo Baggins, sets out to the Lonely Mountain with a spirited group of dwarves to reclaim their mountain home, and the gold within it from the dragon Smaug.',
      isFavorite: false,
    ),
    FilmModel(
      id: '5',
      title: 'The Lord of the Rings',
      description:
          'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.',
      isFavorite: false,
    ),
    FilmModel(
      id: '6',
      title: 'The Matrix',
      description:
          'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.',
      isFavorite: false,
    ),
  ];
}
