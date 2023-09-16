import 'package:dartz/dartz.dart';
import 'package:move_app/core/error/failure.dart';
import 'package:move_app/core/usecase/base_usecase.dart';
import 'package:move_app/tvs/domain/entities/tv.dart';
import 'package:move_app/tvs/domain/repository/base_tv_repository.dart';

class GetTvOnTheAirUseCase extends BaseUseCase<List<Tv>,NoParameters>{
  BaseTvRepository baseTvRepository;

  GetTvOnTheAirUseCase(this.baseTvRepository);

  @override
  Future<Either<Failure, List<Tv>>> call(NoParameters parameters) async{
    return await baseTvRepository.getTvOnTheAir();
  }

}