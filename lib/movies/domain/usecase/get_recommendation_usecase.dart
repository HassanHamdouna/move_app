import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:move_app/core/error/failure.dart';
import 'package:move_app/core/usecase/base_usecase.dart';
import 'package:move_app/movies/domain/entities/recommendation.dart';

import '../repository/base_movie_repository.dart';

class GetRecommendationUseCase
    extends BaseUseCase<List<Recommendation>, MovieRecommendationParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetRecommendationUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(
      MovieRecommendationParameters parameters) async {
    return await baseMoviesRepository.getRecommendation();
  }
}

class MovieRecommendationParameters extends Equatable {
  final int id;

  const MovieRecommendationParameters(this.id);

  @override
  List<Object> get props => [id];
}
