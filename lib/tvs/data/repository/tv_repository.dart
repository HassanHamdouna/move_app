import 'package:dartz/dartz.dart';
import 'package:move_app/core/error/exceptions.dart';

import 'package:move_app/core/error/failure.dart';
import 'package:move_app/tvs/data/datasource/tv_remote_data_source.dart';

import 'package:move_app/tvs/domain/entities/tv.dart';

import 'package:move_app/tvs/domain/entities/tv_detail.dart';

import 'package:move_app/tvs/domain/entities/tv_recommendation.dart';

import 'package:move_app/tvs/domain/usecaus/get_tv_details_usecase.dart';

import 'package:move_app/tvs/domain/usecaus/get_tv_recommendation_usecase.dart';

import '../../domain/repository/base_tv_repository.dart';

class TvRepository  extends BaseTvRepository{
  TvRemoteDataSource remoteDataSource;

  TvRepository(this.remoteDataSource);

  @override
  Future<Either<Failure, List<TvRecommendation>>> getTVRecommendation(TvRecommendationParameters parameters) {
    // TODO: implement getTVRecommendation
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TvDetail>> getTvDetails(TvDetailsParameters parameters)async {
    final respones = await remoteDataSource.getTVDetail(parameters);
    try{
      return Right(respones);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));

    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getTvOnTheAir() async{
   final respones = await remoteDataSource.getTVOnTheAir();
   try{
     return Right(respones);
   }on ServerException catch(failure){
     return Left(ServerFailure(failure.errorMessageModel.statusMessage));
   }
  }

  @override
  Future<Either<Failure, List<Tv>>> getTvPopular() async{
  final respones = await remoteDataSource.getTVPopular();
  try{
    return Right(respones);
  }on ServerException catch(failure){
    return Left(ServerFailure(failure.errorMessageModel.statusMessage));
  }
  }

  @override
  Future<Either<Failure, List<Tv>>> getTvToRated() async{
    final respones = await remoteDataSource.getTVTopRated();
    try{
      return Right(respones);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

}