import 'package:equatable/equatable.dart';
import 'package:move_app/core/utils/enums.dart';
import 'package:move_app/tvs/domain/entities/tv.dart';

class TvState extends Equatable {
  final List<Tv> onTheAirTv;
  final RequestState onTheAirState;
  final String onTheAirMessage;
  final List<Tv> popularTv;
  final RequestState popularState;
  final String popularMessage;
  final List<Tv> topRatedTv;
  final RequestState topRatedState;
  final String topRatedMessage;

  const TvState({
    this.onTheAirTv = const [],
    this.onTheAirState = RequestState.loading,
    this.onTheAirMessage = "",
    this.popularTv = const [],
    this.popularState = RequestState.loading,
    this.popularMessage = "",
    this.topRatedTv = const [],
    this.topRatedState = RequestState.loading,
    this.topRatedMessage = "",
  });

  @override
  List<Object> get props => [
        onTheAirTv,
        onTheAirState,
        onTheAirMessage,
        popularTv,
        popularState,
        popularMessage,
        topRatedTv,
        topRatedState,
        topRatedMessage,
      ];
}
