import 'package:dio/dio.dart';
import 'package:move_app/core/error/exceptions.dart';
import 'package:move_app/core/network/api_constance.dart';
import 'package:move_app/core/network/error_message_model.dart';
import 'package:move_app/movies/data/models/movie_details_model.dart';
import 'package:move_app/movies/data/models/movie_model.dart';
import 'package:move_app/movies/data/models/movie_recommendation_model.dart';
import 'package:move_app/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:move_app/movies/domain/usecase/get_movie_recommendation_usecase.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);

  Future<List<MovieRecommendationModel>> getRecommendationMovies(
      MovieRecommendationParameters parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstance.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List).map(
        (e) => MovieModel.formJson(e),
      ));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.formJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.popularMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List).map(
        (e) => MovieModel.formJson(e),
      ));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.formJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstance.topRatedMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List).map(
        (e) => MovieModel.formJson(e),
      ));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.formJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final respones = await Dio()
        .get(ApiConstance.detailsMoviesPath(parameters.movieId.toString()));
    if (respones.statusCode == 200) {
      return MovieDetailsModel.fromJson(respones.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.formJson(respones.data));
    }
  }

  @override
  Future<List<MovieRecommendationModel>> getRecommendationMovies(
      MovieRecommendationParameters parameters) async {
    final respones = await Dio()
        .get(ApiConstance.recommendationsMoviesPath(parameters.id.toString()));
    if (respones.statusCode == 200) {
      return List<MovieRecommendationModel>.from((respones.data['results'] as List)
          .map((e) => MovieRecommendationModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.formJson(respones.data));
    }
  }
}
