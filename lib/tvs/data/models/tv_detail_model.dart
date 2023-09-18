import 'dart:math';

import 'package:move_app/tvs/data/models/tv_genres_model.dart';
import 'package:move_app/tvs/data/models/tv_seasons_model.dart';
import 'package:move_app/tvs/domain/entities/tv_detail.dart';
import 'package:move_app/tvs/domain/entities/tv_genres.dart';

class TvDetailModel extends TvDetail {
  const TvDetailModel({required super.id,
    required super.name,
    required super.overview,
    required super.backdropPath,
    required super.firstAirDate,
    required super.voteAverage,
    required super.voteCount,
    required super.numberOfSeasons,
    required super.numberOfEpisodes,
    required super.episodeRunTime,
    required super.seasons,
    required super.genres
  });

  factory TvDetailModel.fromJson(Map<String, dynamic> json){
    List<int> episodeRunTime = List<int>.from(json['episode_run_time']);
    int firstRunTime =episodeRunTime.isNotEmpty ? episodeRunTime[0]:30;
    return TvDetailModel(
      id: json['id'],
      name: json['name'],
      overview: json['overview'],
      backdropPath: json['backdrop_path'],
      firstAirDate: json['first_air_date'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
      numberOfSeasons: json['number_of_seasons'],
      numberOfEpisodes: json['number_of_episodes'],
      episodeRunTime: firstRunTime  ,
      seasons: List<TvSeasonsModel>.from(
          json['seasons'].map((e) => TvSeasonsModel.formJson(e))),
      genres: List<TvGenresModel>.from(
          json['genres'].map((e) => TvGenresModel.fromJson(e))),
    );
  }
}
