class ApiConstance {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "?api_key=df79ca9993293c527df3ed29aa55a8c3";

  static const String nowPlayingMoviesPath = "$baseUrl/movie/now_playing$apiKey";
  static const String popularMoviesPath = "$baseUrl/movie/popular$apiKey";
  static const String topRatedMoviesPath = "$baseUrl/movie/top_rated$apiKey";
}
