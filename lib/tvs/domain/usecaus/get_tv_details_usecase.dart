import 'package:animate_do/animate_do.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:move_app/core/error/failure.dart';
import 'package:move_app/core/usecase/base_usecase.dart';
import 'package:move_app/tvs/domain/entities/tv_detail.dart';
import 'package:move_app/tvs/domain/repository/base_tv_repository.dart';

class GetTvDetailsUseCase extends BaseUseCase<TvDetail, TvDetailsParameters> {
  BaseTvRepository baseTvRepository;

  GetTvDetailsUseCase(this.baseTvRepository);

  @override
  Future<Either<Failure, TvDetail>> call(TvDetailsParameters parameters) async {
    return await baseTvRepository.getTvDetails(parameters);
  }
}

class TvDetailsParameters extends Equatable {
  final int idTv;

  const TvDetailsParameters({required this.idTv});

  @override
  List<Object> get props => [idTv];
}
