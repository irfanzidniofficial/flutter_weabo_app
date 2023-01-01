// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  AnimeDao? _animeDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `AnimeEntity` (`imageUrl` TEXT NOT NULL, `id` INTEGER NOT NULL, `title` TEXT NOT NULL, `score` REAL NOT NULL, `status` TEXT NOT NULL, `synopsis` TEXT NOT NULL, PRIMARY KEY (`imageUrl`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  AnimeDao get animeDao {
    return _animeDaoInstance ??= _$AnimeDao(database, changeListener);
  }
}

class _$AnimeDao extends AnimeDao {
  _$AnimeDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _animeEntityInsertionAdapter = InsertionAdapter(
            database,
            'AnimeEntity',
            (AnimeEntity item) => <String, Object?>{
                  'imageUrl': item.imageUrl,
                  'id': item.id,
                  'title': item.title,
                  'score': item.score,
                  'status': item.status,
                  'synopsis': item.synopsis
                }),
        _animeEntityDeletionAdapter = DeletionAdapter(
            database,
            'AnimeEntity',
            ['imageUrl'],
            (AnimeEntity item) => <String, Object?>{
                  'imageUrl': item.imageUrl,
                  'id': item.id,
                  'title': item.title,
                  'score': item.score,
                  'status': item.status,
                  'synopsis': item.synopsis
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<AnimeEntity> _animeEntityInsertionAdapter;

  final DeletionAdapter<AnimeEntity> _animeEntityDeletionAdapter;

  @override
  Future<List<AnimeEntity>> getListFavorite() async {
    return _queryAdapter.queryList('SELECT * FROM AnimeEntity',
        mapper: (Map<String, Object?> row) => AnimeEntity(
            imageUrl: row['imageUrl'] as String,
            id: row['id'] as int,
            title: row['title'] as String,
            score: row['score'] as double,
            status: row['status'] as String,
            synopsis: row['synopsis'] as String));
  }

  @override
  Future<AnimeEntity?> checkIsFavorite(int id) async {
    return _queryAdapter.query('SELECT * FROM AnimeEntity WHERE id= ?1',
        mapper: (Map<String, Object?> row) => AnimeEntity(
            imageUrl: row['imageUrl'] as String,
            id: row['id'] as int,
            title: row['title'] as String,
            score: row['score'] as double,
            status: row['status'] as String,
            synopsis: row['synopsis'] as String),
        arguments: [id]);
  }

  @override
  Future<int> addToFavorite(AnimeEntity animeEntity) {
    return _animeEntityInsertionAdapter.insertAndReturnId(
        animeEntity, OnConflictStrategy.abort);
  }

  @override
  Future<int> removeFromFavorite(AnimeEntity animeEntity) {
    return _animeEntityDeletionAdapter.deleteAndReturnChangedRows(animeEntity);
  }
}
