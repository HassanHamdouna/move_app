import 'package:equatable/equatable.dart';
import 'package:move_app/core/utils/enums.dart';
import 'package:move_app/movies/domain/entities/movie_detali.dart';
import 'package:move_app/movies/domain/entities/movie_recommendation.dart';

class MovieDetailsState extends Equatable {
  final MovieDetail? movieDetail;
  final RequestState movieDetailState;
  final String movieDetailMessage;
  final List<MovieRecommendation> movieRecommendation;
  final RequestState movieRecommendationState;
  final String movieRecommendationMessage;

  const MovieDetailsState({
    this.movieDetail,
    this.movieDetailState = RequestState.loading,
    this.movieDetailMessage = "",
    this.movieRecommendation = const [],
    this.movieRecommendationState = RequestState.loading,
    this.movieRecommendationMessage = "",
  });

  MovieDetailsState copeWith({
    MovieDetail? movieDetail,
    RequestState? movieDetailState,
    String? movieDetailMessage,
    List<MovieRecommendation>? movieRecommendation,
    RequestState? movieRecommendationState,
    String? movieRecommendationMessage,
  }) {
    return MovieDetailsState(
      movieDetail: movieDetail ?? this.movieDetail,
      movieDetailState: movieDetailState ?? this.movieDetailState,
      movieDetailMessage: movieDetailMessage ?? this.movieDetailMessage,
      movieRecommendation: movieRecommendation ?? this.movieRecommendation,
      movieRecommendationState: movieRecommendationState ?? this.movieRecommendationState,
      movieRecommendationMessage: movieRecommendationMessage ?? this.movieRecommendationMessage,
    );
  }

  @override
  List<Object?> get props => [
        movieDetail,
        movieDetailState,
        movieDetailMessage,
        movieRecommendation,
        movieRecommendationState,
        movieRecommendationMessage,
      ];
}
