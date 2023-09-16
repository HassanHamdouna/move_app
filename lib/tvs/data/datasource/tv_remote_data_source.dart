import 'package:dio/dio.dart';
import 'package:move_app/core/error/exceptions.dart';
import 'package:move_app/core/network/api_constance.dart';
import 'package:move_app/core/network/error_message_model.dart';
import 'package:move_app/tvs/data/models/tv_detail_model.dart';
import 'package:move_app/tvs/data/models/tv_model.dart';
import 'package:move_app/tvs/data/models/tv_recommendation_model.dart';
import 'package:move_app/tvs/domain/usecaus/get_tv_details_usecase.dart';
import 'package:move_app/tvs/domain/usecaus/get_tv_recommendation_usecase.dart';

abstract class BaseTvRemoteDataSource {
  Future<List<TvModel>> getTVOnTheAir();

  Future<List<TvModel>> getTVPopular();

  Future<List<TvModel>> getTVTopRated();

  Future<List<TvRecommendationModel>> getTVRecommendation(
      TvRecommendationParameters parameters);

  Future<TvDetailModel> getTVDetail(TvDetailsParameters parameters);
}

class TvRemoteDataSource extends BaseTvRemoteDataSource {
  @override
  Future<List<TvModel>> getTVOnTheAir() async {
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
  Future<List<TvModel>> getTVPopular() async {
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
  Future<List<TvModel>> getTVTopRated() async {
    final respones = await Dio().get(ApiConstance.topRatedTvPath);
    if (respones.statusCode == 200) {
      return List<TvModel>.from(
          (respones.data["results"] as List).map((e) => TvModel.formJson(e)));
    } else {
      throw ErrorMessageModel.formJson(respones.data);
    }
  }

  @override
  Future<TvDetailModel> getTVDetail(TvDetailsParameters parameters) async {
    final respones =
        await Dio().get(ApiConstance.detailsTvPath(parameters.idTv.toString()));
    if (respones.statusCode == 200) {
      return respones.data;
    } else {
      throw ErrorMessageModel.formJson(respones.data);
    }
  }

  @override
  Future<List<TvRecommendationModel>> getTVRecommendation(
      TvRecommendationParameters parameters) async {
    final respones = await Dio()
        .get(ApiConstance.recommendationsTVPath(parameters.id.toString()));
    if (respones.statusCode == 200) {
      return List<TvRecommendationModel>.from((respones.data["results"] as List)
          .map((e) => TvRecommendationModel.formJson(e)));
    } else {
      throw ErrorMessageModel.formJson(respones.data);
    }
  }
}
