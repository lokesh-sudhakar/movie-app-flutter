import 'dart:async';
import 'dart:core';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

//Responsibility - to provide single instance of db
class DatabaseProvider {

  static DatabaseProvider _databaseHelper;

  Database _database;
  String tableName = "movie";
  String colId = "id";
  String colTitle = "title";
  String colVoteAverage = "vote_average";
  String colVoteCount = "vote_count";
  String colReleaseDate = "release_date";
  String colOverView = "overview";
  String colPosterPath = "poster_path";
  String colBackdropPath = "backdrop_path";


  DatabaseProvider.getInstance();

  factory DatabaseProvider() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseProvider.getInstance();
    }
    return _databaseHelper;
  }

  Future<String> _getDatabasePath() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'favourite_movies.db');
    return path;
  }

  Future<Database> _initializeDatabase() async {
    String path = await _getDatabasePath();
    Database database = await openDatabase(path, version: 1, onCreate:
        (Database db, int version) async {
      db.execute("CREATE TABLE $tableName ($colId INTEGER PRIMARY KEY," +
          " $colTitle TEXT, $colVoteAverage DECIMAL , $colVoteCount INTEGER, $colReleaseDate TEXT," +
          "$colOverView TEXT, $colPosterPath TEXT, $colBackdropPath TEXT)");
    });
    return database;
  }

  Future<Database> get database async {
    if (this._database == null) {
      this._database = await _initializeDatabase();
    }
    return this._database;
  }
}