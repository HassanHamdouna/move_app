import 'package:equatable/equatable.dart';
import 'package:move_app/core/utils/enums.dart';
import 'package:move_app/tvs/domain/entities/tv_detail.dart';

import '../../domain/entities/tv_recommendation.dart';

class TvDetailsState extends Equatable {
  final TvDetail? tvDetail;
  final RequestState detailState;
  final String detailMessages;
  final List<TvRecommendation> tvRecommendation;
  final RequestState recommendationState;
  final String recommendationMessages;

  const TvDetailsState({
    this.tvDetail ,
    this.detailState = RequestState.loading,
    this.detailMessages = '',
    this.tvRecommendation = const [],
    this.recommendationState = RequestState.loading,
    this.recommendationMessages = '',
  });

  TvDetailsState copeWith({
    TvDetail? tvDetail,
    RequestState? detailState,
    String? detailMessages,
    List<TvRecommendation>? tvRecommendation,
    RequestState? recommendationState,
    String? recommendationMessages,
  }) {
    return TvDetailsState(
        tvDetail: tvDetail ?? this.tvDetail,
        detailState: detailState ?? this.detailState,
        detailMessages: detailMessages ?? this.detailMessages,
        tvRecommendation: tvRecommendation ?? this.tvRecommendation,
        recommendationState: recommendationState ?? this.recommendationState,
        recommendationMessages:
            recommendationMessages ?? this.recommendationMessages);
  }

  @override
  List<Object?> get props => [
        tvDetail,
        detailState,
        detailMessages,
        tvRecommendation,
        recommendationState,
        recommendationMessages,
      ];
}
