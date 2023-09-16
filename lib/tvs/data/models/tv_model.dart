import 'package:move_app/tvs/domain/entities/tv.dart';

class TvModel extends Tv {
  const TvModel(
      {required super.id,
      required super.name,
      required super.overview,
      required super.genreIds,
      required super.backdropPath,
      required super.firstAirDate,
      required super.voteAverage,
      required super.voteCount});

  factory TvModel.formJson(Map<String, dynamic> json) => TvModel(
      id: json['id'],
      name: json['name'],
      overview: json['overview'],
      genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
      backdropPath: json['backdrop_path'],
      firstAirDate: json['first_air_date'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count']);
}
