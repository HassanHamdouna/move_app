import 'package:equatable/equatable.dart';

abstract class TvDetailsEvent extends Equatable {
  const TvDetailsEvent();
}

class GetTvDetailsEvent extends TvDetailsEvent {
  final int id;

  const GetTvDetailsEvent(this.id);

  @override
  List<Object> get props => [id];
}

class GetTvRecommendationEvent extends TvDetailsEvent {
  final int id;

  const GetTvRecommendationEvent(this.id);

  @override
  List<Object> get props => [id];
}
