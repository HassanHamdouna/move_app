import 'package:equatable/equatable.dart';

class TvSeasons extends Equatable {
  final int id;
  final int episodeCount;
  final String name;
  final String overview;
  final String posterPath;
  final String airDate;
  final int seasonNumber;
  final double voteAverage;

  const TvSeasons({required this.id,
    required this.episodeCount,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.airDate,
    required this.seasonNumber,
    required this.voteAverage});

  @override
  List<Object> get props =>
      [
        id,
        episodeCount,
        name,
        overview,
        posterPath,
        airDate,
        seasonNumber,
        voteAverage,
      ];

}
