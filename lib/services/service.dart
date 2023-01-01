import 'package:dio/dio.dart';
import 'package:flutter_weabo_app/model/anime_detail_model.dart';
import 'package:flutter_weabo_app/model/anime_response_modal.dart';

class Service {
  static const String baseUrl = "https://api.jikan.moe/v4/anime";

  Future<AnimeResponseModel> getAnimeList() async {
    try {
      final Response response = await Dio().get(
        baseUrl,
        queryParameters: {
          "page": 1,
          "limit": 10,
          "sort": "asc",
          "order_by": "popularity",
          "min_score": 7,
        },
      );

      return AnimeResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<AnimeDetailModel> getDetail(int id) async {
    try {
      final Response response = await Dio().get("$baseUrl/$id");
      return AnimeDetailModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<AnimeResponseModel> searchAnime(String keyword) async {
    try {
      final Response response = await Dio().get(
        baseUrl,
        queryParameters: {
          "page": 1,
          "limit": 10,
          "sort": "asc",
          "order_by": "popularity",
          "min_score": 7,
          "q": keyword,
        },
      );

      return AnimeResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
