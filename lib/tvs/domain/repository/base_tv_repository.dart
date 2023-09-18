import 'package:dartz/dartz.dart';
import 'package:move_app/tvs/domain/entities/tv_detail.dart';
import 'package:move_app/tvs/domain/entities/tv_recommendation.dart';
import 'package:move_app/tvs/domain/usecaus/get_tv_recommendation_usecase.dart';

import '../../../core/error/failure.dart';
import '../entities/tv.dart';
import '../usecaus/get_tv_details_usecase.dart';

abstract class BaseTvRepository {
  Future<Either<Failure, List<Tv>>> getTvOnTheAir();

  Future<Either<Failure, List<Tv>>> getTvPopular();

  Future<Either<Failure, List<Tv>>> getTvToRated();

  Future<Either<Failure, TvDetail>> getTvDetails(
      TvDetailsParameters parameters);

  Future<Either<Failure, List<TvRecommendation>>> getTvRecommendation(TvRecommendationParameters parameters);
}
