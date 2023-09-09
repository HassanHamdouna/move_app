import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String backPath;
  final List<int> genreIds;
  final String overview;
  final double voteAverage;

  const Movie(
      {required this.id,
      required this.title,
      required this.backPath,
      required this.genreIds,
      required this.overview,
      required this.voteAverage});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, title, backPath, genreIds, overview, voteAverage];
}
