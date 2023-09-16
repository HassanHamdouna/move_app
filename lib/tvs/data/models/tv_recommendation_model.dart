import 'package:move_app/tvs/domain/entities/tv_recommendation.dart';

class TvRecommendationModel extends TvRecommendation {
  const TvRecommendationModel({required super.id, super.backdropPath});

  factory TvRecommendationModel.formJson(Map<String, dynamic> json) =>
      TvRecommendationModel(
          id: json['id'],
          backdropPath:
              json['backdrop_path'] ?? "/9faGSFi5jam6pDWGNd0p8JcJgXQ.jpg");
}
