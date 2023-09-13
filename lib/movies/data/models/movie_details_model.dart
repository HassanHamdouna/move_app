import 'package:move_app/movies/data/models/genres_model.dart';
import 'package:move_app/movies/domain/entities/movie_detali.dart';

class MovieDetailsModel extends MovieDetail {
  const MovieDetailsModel(
      {required super.id,
      required super.backdropPath,
      required super.genres,
      required super.title,
      required super.overview,
      required super.releaseDate,
      required super.runtime,
      required super.voteAverage});

  factory MovieDetailsModel.json(Map<String, dynamic> json) =>
      MovieDetailsModel(
          id: json['id'],
          backdropPath: json['backdrop_path'],
          genres: List<GenresModel>.from(json['genres']
              .map((indexObjects) => GenresModel.json(indexObjects))),
          title: json['title'],
          overview: json[''],
          releaseDate: json['release_date'],
          runtime: json['runtime'],
          voteAverage: json['vote_average']);
}
