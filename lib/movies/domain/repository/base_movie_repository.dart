import 'package:dartz/dartz.dart';
import 'package:move_app/movies/domain/entities/movie_detali.dart';
import 'package:move_app/movies/domain/entities/recommendation.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure,List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure,List<Movie>>> getPopularMovies();

  Future<Either<Failure,List<Movie>>> getTopRateMovies();

  Future<Either<Failure,MovieDetail>> getMovieDetail();

  Future<Either<Failure,List<Recommendation>>> getRecommendation();
}
