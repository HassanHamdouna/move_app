import 'package:move_app/movies/domain/entities/genres.dart';

class GenresModel extends Genres {
  const GenresModel({required super.id, required super.name});

  factory GenresModel.json(Map<String, dynamic> json) =>
      GenresModel(
          id: json['id'],
          name: json['name']);
}
