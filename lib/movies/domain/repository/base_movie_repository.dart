import 'package:dartz/dartz.dart';
import 'package:move_app/movies/domain/entities/movie_detali.dart';
import 'package:move_app/movies/domain/entities/movie_recommendation.dart';
import 'package:move_app/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:move_app/movies/domain/usecase/get_movie_recommendation_usecase.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure,List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure,List<Movie>>> getPopularMovies();

  Future<Either<Failure,List<Movie>>> getTopRateMovies();

  Future<Either<Failure,MovieDetail>> getDetailMovie(MovieDetailsParameters parameters);

  Future<Either<Failure,List<MovieRecommendation>>> getRecommendationMovie(MovieRecommendationParameters parameters);
}
