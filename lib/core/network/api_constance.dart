class ApiConstance {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "?api_key=df79ca9993293c527df3ed29aa55a8c3";

  static const String nowPlayingMoviesPath = "$baseUrl/movie/now_playing$apiKey";
  static const String popularMoviesPath = "$baseUrl/movie/popular$apiKey";
  static const String topRatedMoviesPath = "$baseUrl/movie/top_rated$apiKey";
  static  String detailsMoviesPath (String pathId) => "$baseUrl/movie/$pathId$apiKey";
  static  String recommendationsMoviesPath (String pathId) => "$baseUrl/movie/$pathId/recommendations$apiKey";

  static const String onTheAirTvPath = "$baseUrl/tv/on_the_air$apiKey";
  static const String popularTvPath = "$baseUrl/tv/popular$apiKey";
  static const String topRatedTvPath = "$baseUrl/tv/top_rated$apiKey";

  static  String detailsTvPath (String pathId) => "$baseUrl/tv/$pathId$apiKey";
  static  String recommendationsTVPath (String pathId) => "$baseUrl/tv/$pathId/recommendations$apiKey";



  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";
  static  String imageUrl (String path)=> "$baseImageUrl$path";
}
