import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:move_app/core/error/failure.dart';
import 'package:move_app/core/usecase/base_usecase.dart';
import 'package:move_app/tvs/domain/entities/tv_recommendation.dart';
import 'package:move_app/tvs/domain/repository/base_tv_repository.dart';

class GetTvRecommendationUseCase extends BaseUseCase<List<TvRecommendation>, TvRecommendationParameters> {
  BaseTvRepository baseTvRepository;

  GetTvRecommendationUseCase(this.baseTvRepository);

  @override
  Future<Either<Failure, List<TvRecommendation>>> call(TvRecommendationParameters parameters) async{
    return await  baseTvRepository.getTvRecommendation(parameters);
  }
}

class TvRecommendationParameters extends Equatable {
  final int id;

  const TvRecommendationParameters({required this.id});

  @override
  List<Object> get props => [id];
}