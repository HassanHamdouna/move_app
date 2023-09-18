import 'package:move_app/tvs/domain/entities/tv_genres.dart';

class TvGenresModel extends TvGenres {
  const TvGenresModel({required super.id, required super.name});

  factory TvGenresModel.fromJson(Map<String, dynamic> json) =>
      TvGenresModel(
          id: json['id'],
          name: json['name']);
}
