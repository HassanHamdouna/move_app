import 'package:dartz/dartz.dart';
import 'package:move_app/core/error/exceptions.dart';

import 'package:move_app/core/error/failure.dart';
import 'package:move_app/tvs/data/datasourcec/tv_remote_data_source.dart';

import 'package:move_app/tvs/domain/entities/tv.dart';

import 'package:move_app/tvs/domain/entities/tv_detail.dart';

import 'package:move_app/tvs/domain/entities/tv_recommendation.dart';

import 'package:move_app/tvs/domain/usecaus/get_tv_details_usecase.dart';

import 'package:move_app/tvs/domain/usecaus/get_tv_recommendation_usecase.dart';

import '../../domain/repository/base_tv_repository.dart';

class TvRepository extends BaseTvRepository {
  final BaseTvsRemoteDataSource baseRemoteDataSource;

  TvRepository(this.baseRemoteDataSource);

  @override
  Future<Either<Failure, List<TvRecommendation>>> getTvRecommendation(
      TvRecommendationParameters parameters) async {
    final respones = await baseRemoteDataSource.getTvRecommendation(parameters);

    try {
      return Right(respones);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, TvDetail>> getTvDetails(
      TvDetailsParameters parameters) async {
    final respones = await baseRemoteDataSource.getTvDetail(parameters);
    try {
      return Right(respones);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getTvOnTheAir() async {
    final respones = await baseRemoteDataSource.getTvOnTheAir();
    try {
      return Right(respones);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getTvPopular() async {
    final respones = await baseRemoteDataSource.getTvPopular();
    try {
      return Right(respones);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getTvToRated() async {
    final respones = await baseRemoteDataSource.getTvTopRated();
    try {
      return Right(respones);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
