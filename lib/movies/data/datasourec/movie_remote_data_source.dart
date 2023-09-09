import 'package:dio/dio.dart';
import 'package:move_app/movies/data/models/movie_model.dart';

class MovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=df79ca9993293c527df3ed29aa55a8c3');
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List).map(
        (e) => MovieModel.formJson(e),
      ));
    } else {
      return [];
    }
  }
}
