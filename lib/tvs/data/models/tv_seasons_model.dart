import 'package:move_app/tvs/domain/entities/tv_seasons.dart';

class TvSeasonsModel extends TvSeasons {
  const TvSeasonsModel(
      {required super.id,
      required super.episodeCount,
      required super.name,
      required super.overview,
      required super.posterPath,
      required super.airDate,
      required super.seasonNumber,
      required super.voteAverage});

  factory TvSeasonsModel.formJson(Map<String, dynamic> json) => TvSeasonsModel(
      id: json['id'],
      episodeCount: json['episode_count'],
      name: json['name'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      airDate: json['air_date'],
      seasonNumber: json['season_number'],
      voteAverage: json['vote_average']);
}
