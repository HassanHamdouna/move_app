import 'package:equatable/equatable.dart';

class Tv extends Equatable {
  final int id;
  final String name;
  final String overview;
  final List<int> genreIds;
  final String backdropPath;
  final String firstAirDate;
  final double voteAverage;
  final int voteCount;

  const Tv({required this.id,
    required this.name,
    required this.overview,
    required this.genreIds,
    required this.backdropPath,
    required this.firstAirDate,
    required this.voteAverage,
    required this.voteCount});

  @override
  List<Object> get props =>
      [
        id,
        name,
        overview,
        genreIds,
        backdropPath,
        firstAirDate,
        voteAverage,
        voteCount,
      ];
}
