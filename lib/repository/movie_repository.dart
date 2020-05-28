import 'package:flutter/cupertino.dart';
import 'package:moviejunction/database/favourite_movies_dao.dart';
import 'package:moviejunction/model/genres_response.dart';
import 'package:moviejunction/model/movie.dart';
import 'package:moviejunction/model/movie_response.dart';
import 'package:moviejunction/repository/repository.dart';
import '../model/persons_response.dart';
import 'package:dio/dio.dart';
import 'dart:async';
import '../model/movie_detail_response.dart';
import '../model/cast_response.dart';
import 'movie_urls.dart';

class MovieRepository extends Repository {

  Dio _dio = Dio();
  FavouriteMovieDao favouriteMovieDao = FavouriteMovieDao();

  Future<MovieResponse> getNowPlayingMovies() async {
    Map<String, dynamic> params = {
      "api_key": ApiUrl.API_KEY,
      "language": "en-US",
      "page": 1
    };
    try {
      Response response = await _dio.get(ApiUrl.NOW_PLAYING_MOVIES_URL,
          queryParameters: params);
      MovieResponse movieResponse = MovieResponse.fromJson(response.data);
      debugPrint('results  count ${movieResponse.results.length}');
      return movieResponse;
    } catch (error, stackTrace) {
      debugPrint(
          'Request failed with status: -> $error and stack trace -> $stackTrace.');
      return MovieResponse.withError(error);
    }
  }

  Future<GenresResponse> getGenres() async {
    Map<String, dynamic> params = {
      "api_key": ApiUrl.API_KEY,
      "language": "en-US"
    };
    try {
      Response response =
          await _dio.get(ApiUrl.GENRE_LIST_URL, queryParameters: params);
      GenresResponse genresResponse = GenresResponse.fromJson(response.data);
      debugPrint('genres  count ${genresResponse.genres.length}');
      return genresResponse;
    } catch (error, stackTrace) {
      debugPrint(
          'Request failed with status: -> $error and stack trace -> $stackTrace.');
      return GenresResponse.withError(error);
    }
  }

  Future<MovieResponse> getGenreMovies(String genreId) async {
    Map<String, dynamic> params = {
      "api_key": ApiUrl.API_KEY,
      "language": "en-US",
      "with_genres": genreId,
    };
    try {
      Response response =
          await _dio.get(ApiUrl.GENRE_MOVIES_URL, queryParameters: params);
      MovieResponse movieResponse = MovieResponse.fromJson(response.data);
      debugPrint(
          'movie for genre id $genreId count ${movieResponse.results.length}');
      return movieResponse;
    } catch (error, stackTrace) {
      debugPrint(
          'Request failed with status: -> $error and stack trace -> $stackTrace.');
      return MovieResponse.withError(error);
    }
  }

  Future<PersonsResponse> getTrendingPersons() async {
    Map<String, dynamic> params = {
      "api_key": ApiUrl.API_KEY,
    };
    try {
      Response response =
          await _dio.get(ApiUrl.TRENDING_PERSONS_URL, queryParameters: params);
      PersonsResponse personsResponse = PersonsResponse.fromJson(response.data);
      debugPrint('trending person count ${personsResponse.results.length}');
      return personsResponse;
    } catch (error, stackTrace) {
      debugPrint(
          'Request failed with status: -> $error and stack trace -> $stackTrace.');
      return PersonsResponse.withError(error.toString());
    }
  }

  Future<MovieResponse> getPopularMovies() async {
    var params = {"api_key": ApiUrl.API_KEY, "language": "en-US", "page": 1};
    try {
      Response response =
          await _dio.get(ApiUrl.POPULAR_MOVIES_URL, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print(
          "Request failed with status: ->  $error and stack trace -> $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<MovieDetailResponse> getMovieDetail(int id) async {
    var params = {"api_key": ApiUrl.API_KEY, "language": "en-US"};
    try {
      Response response = await _dio.get(ApiUrl.MOVIE_INFO_URL + "/$id",
          queryParameters: params);
      return MovieDetailResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieDetailResponse.withError("$error");
    }
  }

  Future<CastResponse> getCasts(int id) async {
    var params = {"api_key": ApiUrl.API_KEY, "language": "en-US"};
    try {
      Response response = await _dio.get(
          ApiUrl.MOVIE_INFO_URL + "/$id" + "/credits",
          queryParameters: params);
      return CastResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return CastResponse.withError("$error");
    }
  }

  Future<MovieResponse> getSimilarMovies(int id) async {
    var params = {"api_key": ApiUrl.API_KEY, "language": "en-US"};
    try {
      Response response = await _dio.get(
          ApiUrl.MOVIE_INFO_URL + "/$id" + "/similar",
          queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  @override
  Future<bool> addFavouriteMovie(Movie movie) async {
    bool isSuccessful = await favouriteMovieDao.insertMovie(movie);
    return isSuccessful;
  }

  @override
  Future<List<Movie>> getAllFavouriteMovies() async {
    List<Movie> favMovies = await favouriteMovieDao.getMoviesFromDB();
    return favMovies;
  }

  @override
  Future<bool> removeMovieFromFavourites(int movieId) async {
    bool isDeleteSuccessful = await favouriteMovieDao.deleteMovie(movieId);
    return isDeleteSuccessful;
  }

  @override
  Future<bool> isFavouriteMovie(int movieId) async {
    bool isFavouriteMovie =  await favouriteMovieDao.isFavouriteMovie(movieId);
    return isFavouriteMovie;
  }

}
