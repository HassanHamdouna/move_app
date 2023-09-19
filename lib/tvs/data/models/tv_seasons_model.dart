import 'package:move_app/tvs/domain/entities/tv_seasons.dart';

class TvSeasonsModel extends TvSeasons {
  const TvSeasonsModel(
      {required super.id,
      required super.episodeCount,
      required super.name,
      required super.overview,
        super.posterPath,
       super.airDate,
      required super.seasonNumber,
      required super.voteAverage});

  factory TvSeasonsModel.formJson(Map<String, dynamic> json) => TvSeasonsModel(
      id: json['id'],
      episodeCount: json['episode_count'],
      name: json['name'],
      overview: json['overview'],
      posterPath: json['poster_path']??'/ryQwRK3f6K06UJuMK9oVH1WhZdA.jpg',
      airDate: json['air_date']??'2009-02-17',
      seasonNumber: json['season_number'],
      voteAverage: json['vote_average']);
}
