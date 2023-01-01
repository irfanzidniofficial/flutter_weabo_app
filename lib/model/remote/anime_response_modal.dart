import 'anime_model.dart';

class AnimeResponseModel {
  List<AnimeModel>? data;

  AnimeResponseModel({this.data});

  AnimeResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <AnimeModel>[];
      json['data'].forEach((v) {
        data!.add(AnimeModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
