import 'package:flutter_weabo_app/model/anime_model.dart';

class AnimeDetailModel {
  AnimeModel? data;
  AnimeDetailModel({this.data});

  AnimeDetailModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? AnimeModel.fromJson(json['data']) : null;
  }
}
