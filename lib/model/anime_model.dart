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
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
    title = json['title'];
    episodes = json['episodes'];
    status = json['status'];
    aired = json['aired'] != null ? Aired.fromJson(json['aired']) : null;
    duration = json['duration'];
    score = json['score'];
    synopsis = json['synopsis'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mal_id'] = malId;
    data['url'] = url;
    if (images != null) {
      data['images'] = images!.toJson();
    }
    data['title'] = title;
    data['episodes'] = episodes;
    data['status'] = status;
    if (aired != null) {
      data['aired'] = aired!.toJson();
    }
    data['duration'] = duration;
    data['score'] = score;
    data['synopsis'] = synopsis;
    return data;
  }
}
