import 'package:flutter/material.dart';

@immutable
class FilmModel {
  final String id;
  final String title;
  final String description;
  final bool isFavorite;

  const FilmModel({
    required this.id,
    required this.title,
    required this.description,
    required this.isFavorite,
  });

  FilmModel copyWith({required bool isFavorite}) => FilmModel(
        id: id,
        title: title,
        description: description,
        isFavorite: isFavorite,
      );

  @override
  String toString() {
    // TIP: If we use quotes like this in the long strings, it will be easier to read and still be valid.
    return 'FilmModel(id: $id,'
        ' title: $title,'
        ' description: $description,'
        ' isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(covariant FilmModel other) =>
      id == other.id && isFavorite == other.isFavorite;

  @override
  int get hashCode => Object.hashAll(
        [
          id,
          isFavorite,
        ],
      );
}
