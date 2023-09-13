import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_app/core/utils/enums.dart';
import 'package:move_app/movies/domain/usecase/get_movie_recommendation_usecase.dart';
import 'package:move_app/movies/presentation/controllers/movie_details_event.dart';
import 'package:move_app/movies/presentation/controllers/movie_details_state.dart';

import '../../domain/usecase/get_movie_details_usecase.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetMovieRecommendationUseCase getMovieRecommendationUseCase;

  MovieDetailsBloc(
      this.getMovieDetailsUseCase, this.getMovieRecommendationUseCase)
      : super(const MovieDetailsState()) {
    on<GetDetailsMovieEvent>(_getMovieDetails);
    on<GetRecommendationMovieEvent>(_getRecommendationMovie);
  }

  FutureOr<void> _getMovieDetails(
      GetDetailsMovieEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getMovieDetailsUseCase(MovieDetailsParameters(movieId: event.id));
    result.fold(
        (l) => emit(state.copeWith(
              movieDetailState: RequestState.error,
              movieDetailMessage: l.message,
            )),
        (r) => emit(state.copeWith(
            movieDetailState: RequestState.loaded, movieDetail: r)));
  }

  FutureOr<void> _getRecommendationMovie(GetRecommendationMovieEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result = await getMovieRecommendationUseCase(
        MovieRecommendationParameters(id: event.id));

    result.fold(
      (l) => emit(state.copeWith(
        movieRecommendationState: RequestState.error,
        movieRecommendationMessage: l.message,
      )),
      (r) => emit(state.copeWith(
          movieRecommendationState: RequestState.loaded,
          movieRecommendation: r)),
    );
  }
}
