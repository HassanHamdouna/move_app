import 'package:equatable/equatable.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();
}

class GetDetailsMovieEvent extends MovieDetailsEvent {
  final int id;

  const GetDetailsMovieEvent(this.id);

  @override
  List<Object> get props => [id];
}

class GetRecommendationMovieEvent extends MovieDetailsEvent {
  final int id;

  const GetRecommendationMovieEvent(this.id);

  @override
  List<Object> get props => [id];
}
