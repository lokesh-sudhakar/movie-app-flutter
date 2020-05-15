import 'package:flutter/cupertino.dart';
import 'package:moviejunction/model/genres_response.dart';
import 'package:moviejunction/model/movie_response.dart';
import 'package:dio/dio.dart';
import 'dart:async';

class MovieRepository {

  final String apiKey = "8a1227b5735a7322c4a43a461953d4ff";
  static final String mainUrl = "https://api.themoviedb.org/3";
  String _getPlayingUrl = '$mainUrl/movie/now_playing';
  String _getGenresUrl = '$mainUrl/genre/movie/list';
  Dio _dio = Dio();

  Future<MovieResponse> getNowPlayingMovies() async {
    Map<String,dynamic> params = {
      "api_key": apiKey,
      "language": "en-US",
      "page": 1
    };
    try {
      Response response = await _dio.get(_getPlayingUrl,queryParameters: params);
      MovieResponse movieResponse = MovieResponse.fromJson(response.data);
      debugPrint('results  count ${movieResponse.results.length}');
      return movieResponse;
    } catch (error, stackTrace) {
      debugPrint('Request failed with status: -> $error and stack trace -> $stackTrace.');
      return MovieResponse.withError(error);
    }
  }

  Future<GenresResponse> getGenres() async {
    Map<String, dynamic> params = {
      "api_key":apiKey,
      "language" : "en-US"
    };
    try {
      Response response = await _dio.get(_getGenresUrl,queryParameters: params);
      GenresResponse genresResponse = GenresResponse.fromJson(response.data);
      debugPrint('genres  count ${genresResponse.genres.length}');
      return genresResponse;
    } catch(error, stackTrace) {
      debugPrint('Request failed with status: -> $error and stack trace -> $stackTrace.');
      return GenresResponse.withError(error);
    }
  }


}