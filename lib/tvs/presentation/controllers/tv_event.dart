import 'package:equatable/equatable.dart';

abstract class TvEvent extends Equatable {
  const TvEvent();

  @override
  List<Object> get props => [];
}

class GetTVOnTheAirEvent extends TvEvent {}
class GetTVPopularEvent extends TvEvent {}
class GetTVTopRatedEvent extends TvEvent {}
