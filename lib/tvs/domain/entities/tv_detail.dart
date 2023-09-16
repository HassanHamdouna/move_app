import 'package:equatable/equatable.dart';
import 'package:move_app/tvs/domain/entities/tv_genres.dart';
import 'package:move_app/tvs/domain/entities/tv_seasons.dart';

class TvDetail extends Equatable {
  final int id;
  final String name;
  final String overview;
  final String backdropPath;
  final String firstAirDate;
  final double voteAverage;
  final int voteCount;
  final int numberOfSeasons;
  final int numberOfEpisodes;
  final List<TvSeasons> seasons;
  final List<TvGenres> genres;

  const TvDetail({
    required this.id,
    required this.name,
    required this.overview,
    required this.backdropPath,
    required this.firstAirDate,
    required this.voteAverage,
    required this.voteCount,
    required this.numberOfSeasons,
    required this.numberOfEpisodes,
    required this.seasons,
    required this.genres
  });

  @override
  List<Object> get props =>
      [
        id,
        name,
        overview,
        backdropPath,
        firstAirDate,
        voteAverage,
        voteCount,
        numberOfSeasons,
        numberOfEpisodes,
        seasons,
        genres,
      ];
}