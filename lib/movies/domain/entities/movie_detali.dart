import 'package:equatable/equatable.dart';
import 'package:move_app/movies/domain/entities/genres.dart';

class MovieDetail extends Equatable {
  final int id;

  final String backdropPath;
  final List<Genres> genres;
  final String title;
  final String overview;
  final String releaseDate;
  final int runtime;
  final double voteAverage;

  const MovieDetail(
      {required this.id,
      required this.backdropPath,
      required this.genres,
      required this.title,
      required this.overview,
      required this.releaseDate,
      required this.runtime,
      required this.voteAverage});

  @override
  List<Object> get props => [
        id,
        backdropPath,
        genres,
        title,
        overview,
        releaseDate,
        runtime,
        voteAverage,
      ];
}
