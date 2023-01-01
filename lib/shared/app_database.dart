import 'dart:async';
import 'package:floor/floor.dart';
import 'package:flutter_weabo_app/model/local/anime_entity.dart';
import 'package:flutter_weabo_app/services/db_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [AnimeEntity])
abstract class AppDatabase extends FloorDatabase {
  AnimeDao get animeDao;
}
