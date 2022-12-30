import 'aired_model.dart';
import 'image_anime_modal.dart';

class AnimeModel {
  int? malId;
  String? url;
  Images? images;
  String? title;
  int? episodes;
  String? status;
  Aired? aired;
  String? duration;
  double? score;
  String? synopsis;

  AnimeModel({
    this.malId,
    this.url,
    this.images,
    this.title,
    this.episodes,
    this.status,
    this.aired,
    this.duration,
    this.score,
    this.synopsis,
  });

  AnimeModel.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    url = json['url'];
    images =
        json['images'] != null ? new Images.fromJson(json['images']) : null;
    title = json['title'];
    episodes = json['episodes'];
    status = json['status'];
    aired = json['aired'] != null ? new Aired.fromJson(json['aired']) : null;
    duration = json['duration'];
    score = json['score'];
    synopsis = json['synopsis'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mal_id'] = this.malId;
    data['url'] = this.url;
    if (this.images != null) {
      data['images'] = this.images!.toJson();
    }
    data['title'] = this.title;
    data['episodes'] = this.episodes;
    data['status'] = this.status;
    if (this.aired != null) {
      data['aired'] = this.aired!.toJson();
    }
    data['duration'] = this.duration;
    data['score'] = this.score;
    data['synopsis'] = this.synopsis;
    return data;
  }
}