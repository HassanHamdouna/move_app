import 'package:dartz/dartz.dart';
import 'package:move_app/core/error/exceptions.dart';
import 'package:move_app/core/error/failure.dart';
import 'package:move_app/movies/data/datasourec/movie_remote_data_source.dart';
import 'package:move_app/movies/domain/entities/movie.dart';
import 'package:move_app/movies/domain/entities/movie_detali.dart';
import 'package:move_app/movies/domain/entities/movie_recommendation.dart';
import 'package:move_app/movies/domain/repository/base_movie_repository.dart';
import 'package:move_app/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:move_app/movies/domain/usecase/get_movie_recommendation_usecase.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMovieRemoteDataSource baseRemoteDataSource;

  MoviesRepository(this.baseRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final result = await baseRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRateMovies() async {
    final result = await baseRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getDetailMovie(
      MovieDetailsParameters parameters) async {
    final result = await baseRemoteDataSource.getMovieDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieRecommendation>>> getRecommendationMovie(
      MovieRecommendationParameters parameters) async {
    final result =
        await baseRemoteDataSource.getRecommendationMovies(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
