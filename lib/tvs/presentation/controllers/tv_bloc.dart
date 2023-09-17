import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_app/core/usecase/base_usecase.dart';
import 'package:move_app/core/utils/enums.dart';
import 'package:move_app/tvs/presentation/controllers/tv_event.dart';
import 'package:move_app/tvs/presentation/controllers/tv_state.dart';

import '../../domain/usecaus/get_tv_on_the_air_usecase.dart';
import '../../domain/usecaus/get_tv_popular_usecase.dart';
import '../../domain/usecaus/get_tv_top_rated_usecase.dart';

class TvBloc extends Bloc<TvEvent, TvState> {
  final GetTvOnTheAirUseCase getTvOnTheAirUseCase;
  final GetTvPopularUseCase getTVPopularUseCase;
  final GetTvTopRatedUseCase getTvTopRatedUseCase;

  TvBloc(this.getTvOnTheAirUseCase, this.getTVPopularUseCase,
      this.getTvTopRatedUseCase)
      : super(const TvState()) {
    on<GetTVOnTheAirEvent>(_getOnTheAirTv);
    on<GetTVPopularEvent>(_getPopularTv);
    on<GetTVTopRatedEvent>(_getTopRatedTv);
  }

  FutureOr<void> _getOnTheAirTv(
      GetTVOnTheAirEvent event, Emitter<TvState> emit) async {
    final result = await getTvOnTheAirUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
              topRatedMessage: l.message,
              topRatedState: RequestState.error,
            )),
        (r) => state.copyWith(
              topRatedTv: r,
              topRatedState: RequestState.loaded,
            ));
  }

  FutureOr<void> _getPopularTv(
      GetTVPopularEvent event, Emitter<TvState> emit) async {
    final result = await getTVPopularUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
              topRatedMessage: l.message,
              topRatedState: RequestState.error,
            )),
        (r) => state.copyWith(
              topRatedTv: r,
              topRatedState: RequestState.loaded,
            ));
  }

  FutureOr<void> _getTopRatedTv(
      GetTVTopRatedEvent event, Emitter<TvState> emit) async {
    final result = await getTvTopRatedUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
              topRatedMessage: l.message,
              topRatedState: RequestState.error,
            )),
        (r) => state.copyWith(
              topRatedTv: r,
              topRatedState: RequestState.loaded,
            ));
  }
}