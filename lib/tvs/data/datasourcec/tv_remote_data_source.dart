import 'package:dio/dio.dart';
import 'package:move_app/core/error/exceptions.dart';
import 'package:move_app/core/network/api_constance.dart';
import 'package:move_app/core/network/error_message_model.dart';
import 'package:move_app/tvs/data/models/tv_detail_model.dart';
import 'package:move_app/tvs/data/models/tv_model.dart';
import 'package:move_app/tvs/data/models/tv_recommendation_model.dart';
import 'package:move_app/tvs/domain/usecaus/get_tv_details_usecase.dart';
import 'package:move_app/tvs/domain/usecaus/get_tv_recommendation_usecase.dart';

abstract class BaseTvsRemoteDataSource {
  Future<List<TvModel>> getTvOnTheAir();

  Future<List<TvModel>> getTvPopular();

  Future<List<TvModel>> getTvTopRated();

  Future<List<TvRecommendationModel>> getTvRecommendation(TvRecommendationParameters parameters);

  Future<TvDetailModel> getTvDetail(TvDetailsParameters parameters);
}

class TvsRemoteDataSource extends BaseTvsRemoteDataSource {
  @override
  Future<List<TvModel>> getTvOnTheAir() async {
    final response = await Dio().get(ApiConstance.onTheAirTvPath);
    if (response.statusCode == 200) {
      return List<TvModel>.from((response.data["results"] as List).map(
        (e) => TvModel.formJson(e),
      ));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.formJson(response.data));
    }
  }

  @override
  Future<List<TvModel>> getTvPopular() async {
    final respones = await Dio().get(ApiConstance.popularTvPath);
    if (respones.statusCode == 200) {
      return List<TvModel>.from((respones.data["results"] as List).map(
        (e) => TvModel.formJson(e),
      ));
    } else {
      throw ErrorMessageModel.formJson(respones.data);
    }
  }

  @override
  Future<List<TvModel>> getTvTopRated() async {
    final respones = await Dio().get(ApiConstance.topRatedTvPath);
    if (respones.statusCode == 200) {
      return List<TvModel>.from(
          (respones.data["results"] as List).map((e) => TvModel.formJson(e)));
    } else {
      throw ErrorMessageModel.formJson(respones.data);
    }
  }

  @override
  Future<TvDetailModel> getTvDetail(TvDetailsParameters parameters) async {
    final respones = await Dio().get(ApiConstance.detailsTvPath(parameters.idTv.toString()));
    if (respones.statusCode == 200) {
      return TvDetailModel.fromJson(respones.data);

    } else {
      throw ErrorMessageModel.formJson(respones.data);
    }
  }

  @override
  Future<List<TvRecommendationModel>> getTvRecommendation(
      TvRecommendationParameters parameters) async {
    final respones = await Dio().get(ApiConstance.recommendationsTVPath(parameters.id.toString()));
    if (respones.statusCode == 200) {
      return List<TvRecommendationModel>.from((respones.data["results"] as List)
          .map((e) => TvRecommendationModel.formJson(e)));
    } else {
      throw ErrorMessageModel.formJson(respones.data);
    }
  }
}
