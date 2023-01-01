import 'package:floor/floor.dart';

@entity
class AnimeEntity {
  @primaryKey
  final String imageUrl;
  final int id;
  final String title;
  final double score;
  final String status;
  final String synopsis;

  AnimeEntity(
      {required this.imageUrl,
      required this.id,
      required this.title,
      required this.score,
      required this.status,
      required this.synopsis});
}
