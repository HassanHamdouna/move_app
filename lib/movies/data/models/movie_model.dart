import 'package:move_app/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel(
      {required super.id,
      required super.title,
      required super.backPath,
      required super.genreIds,
      required super.overview,
      required super.voteAverage,
      required super.releaseData});

  factory MovieModel.formJson(Map<String, dynamic> json) {
    return MovieModel(
        id: json["id"],
        title: json["title"],
        backPath: json["id"],
        genreIds: List<int>.from(json["genre_ids"].map((e) => e)),
        overview: json["overview"], 
        /// re toDouble : vote_average
        voteAverage: json["vote_average"].toDouble(),
        releaseData: json["release_date"]);
  }
}
