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
    on<GetTvOnTheAirEvent>(_getOnTheAirTv);
    on<GetTvPopularEvent>(_getPopularTv);
    on<GetTvTopRatedEvent>(_getTopRatedTv);
  }

  FutureOr<void> _getOnTheAirTv(
      GetTvOnTheAirEvent event, Emitter<TvState> emit) async {
    final result = await getTvOnTheAirUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
              onTheAirMessage: l.message,
          onTheAirState: RequestState.error,
            )),
        (r) => emit(state.copyWith(
          onTheAirTv: r,
          onTheAirState: RequestState.loaded,
            )));
  }

  FutureOr<void> _getPopularTv(
      GetTvPopularEvent event, Emitter<TvState> emit) async {
    final result = await getTVPopularUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
              popularMessage: l.message,
          popularState: RequestState.error,
            )),
        (r) => emit(state.copyWith(
          popularTv: r,
          popularState: RequestState.loaded,
            )));
  }

  FutureOr<void> _getTopRatedTv(GetTvTopRatedEvent event, Emitter<TvState> emit) async {
    final result = await getTvTopRatedUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
              topRatedMessage: l.message,
              topRatedState: RequestState.error,
            )),
        (r) => emit(state.copyWith(
              topRatedTv: r,
              topRatedState: RequestState.loaded,
            )));
  }
}
