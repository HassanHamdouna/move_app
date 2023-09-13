import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:move_app/core/error/failure.dart';
import 'package:move_app/core/usecase/base_usecase.dart';
import 'package:move_app/movies/domain/entities/movie_recommendation.dart';

import '../repository/base_movie_repository.dart';

class GetMovieRecommendationUseCase extends BaseUseCase<
    List<MovieRecommendation>, MovieRecommendationParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieRecommendationUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<MovieRecommendation>>> call(MovieRecommendationParameters parameters) async {
    return await baseMoviesRepository.getRecommendationMovie(parameters);
  }
}

class MovieRecommendationParameters extends Equatable {
  final int id;

  const MovieRecommendationParameters({required this.id});

  @override
  List<Object> get props => [id];
}
