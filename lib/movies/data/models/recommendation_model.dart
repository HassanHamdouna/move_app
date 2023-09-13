import 'package:move_app/movies/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({required super.id, required super.backdropPath});

  factory RecommendationModel.json(Map<String, dynamic> json) =>
      RecommendationModel(id: json['id'], backdropPath: json['backdrop_path']);
}
