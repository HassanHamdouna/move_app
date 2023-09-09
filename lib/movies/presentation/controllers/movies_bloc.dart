import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_app/core/utils/enums.dart';
import 'package:move_app/movies/domain/usecase/get_popular_movies_usecase.dart';
import 'package:move_app/movies/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:move_app/movies/presentation/controllers/movies_event.dart';
import 'package:move_app/movies/presentation/controllers/movies_state.dart';
import 'package:move_app/movies/domain/usecase/get_now_playing_movies_usecase.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetNowPlayingMoviesEvent>(_getPopularMovies);
    on<GetNowPlayingMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMoviesUseCase.execute();
    emit(const MoviesState(nowPlayingState: RequestState.loaded));
    result.fold(
        (l) => emit(MoviesState(
            nowPlayingState: RequestState.error, nowPlayingMessage: l.message)),
        (r) => emit(MoviesState(
            nowPlayingState: RequestState.loaded, nowPlayingMovies: r)));
  }

  FutureOr<void> _getPopularMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {}

  FutureOr<void> _getTopRatedMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {}
}
