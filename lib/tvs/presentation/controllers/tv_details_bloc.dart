import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_app/core/utils/enums.dart';
import 'package:move_app/tvs/domain/usecaus/get_tv_details_usecase.dart';
import 'package:move_app/tvs/presentation/controllers/tv_details_event.dart';
import 'package:move_app/tvs/presentation/controllers/tv_details_state.dart';

import '../../domain/usecaus/get_tv_recommendation_usecase.dart';

class TvDetailsBloc extends Bloc<TvDetailsEvent, TvDetailsState> {
  final GetTvDetailsUseCase getTvDetailsUseCase;
  final GetTvRecommendationUseCase getTvRecommendationUseCase;

  TvDetailsBloc(this.getTvDetailsUseCase, this.getTvRecommendationUseCase)
      : super(const TvDetailsState()) {
    on<GetTvDetailsEvent>(_getTvDetails);
    on<GetTvRecommendationEvent>(_getTvRecommendation);
  }

  FutureOr<void> _getTvDetails(
      GetTvDetailsEvent event, Emitter<TvDetailsState> emit) async {
    final result = await getTvDetailsUseCase(TvDetailsParameters(idTv: event.id));
    result.fold(
        (l) => emit(state.copeWith(
              detailMessages: l.message,
              detailState: RequestState.error,
            )),
        (r) => emit(state.copeWith(
              tvDetail: r,
              detailState: RequestState.loaded,
            )));
  }

  FutureOr<void> _getTvRecommendation(
      GetTvRecommendationEvent event, Emitter<TvDetailsState> emit) async {
    final result = await getTvRecommendationUseCase(TvRecommendationParameters(id: event.id));

    result.fold(
        (l) => emit(state.copeWith(
            recommendationMessages: l.message,
            recommendationState: RequestState.error)),
        (r) => emit(state.copeWith(
            tvRecommendation: r, recommendationState: RequestState.loaded)));
  }
}
