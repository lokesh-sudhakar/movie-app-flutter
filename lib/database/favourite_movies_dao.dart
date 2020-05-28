import 'dart:async';
import 'dart:core';
import 'package:moviejunction/database/databae_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../model/movie.dart';

//Responsibility - to perform crud operations on db
class FavouriteMovieDao {
  DatabaseProvider databaseProvider = DatabaseProvider();

  Future<bool> insertMovie(Movie movie) async {
    Database db = await databaseProvider.database;
    int result = await db.insert(databaseProvider.tableName, movie.toJson());
    if (result == 0) {
      return false;
    }
    return true;
  }

  Future<bool> updateMovie(Movie movie) async {
    Database db = await databaseProvider.database;
    int result = await db.update(databaseProvider.tableName, movie.toJson());
    if (result == 0) {
      return false;
    }
    return true;
  }

  Future<bool> deleteMovie(int movieId) async {
    Database db = await databaseProvider.database;
    int result = await db.delete(databaseProvider.tableName,
        where: '${databaseProvider.colId} = ?', whereArgs: ['$movieId']);
    if (result == 0) {
      return false;
    }
    return true;
  }

  Future<List<Movie>> getMoviesFromDB() async {
    Database db = await databaseProvider.database;
    List<Map<String, dynamic>> movies =
        await db.query(databaseProvider.tableName);
    return List.generate(movies.length, (index) {
      return Movie.fromJson(movies[index]);
    });
  }

  Future<bool> isFavouriteMovie(int movieId) async {
    Database db = await databaseProvider.database;
    int count = Sqflite.firstIntValue(await db.rawQuery(
        "SELECT COUNT(*) FROM ${databaseProvider.tableName} WHERE id = ?",
        ['$movieId']));
    if (count == 0) {
      return false;
    }
    return true;
  }
}
