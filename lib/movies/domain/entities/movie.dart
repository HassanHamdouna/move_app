class Movie {
  final int id;
  final String title;
  final String backPath;
  final List<int> genreIds;
  final String overview;
  final double voteAverage;

  Movie(
      {required this.id,
      required this.title,
      required this.backPath,
      required this.genreIds,
      required this.overview,
      required this.voteAverage});
}
