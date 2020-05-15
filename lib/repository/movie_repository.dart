import 'package:flutter/cupertino.dart';
import 'package:moviejunction/model/movie_response.dart';
import 'package:dio/dio.dart';
import 'dart:async';

class MovieRepository {

  final String apiKey = "8a1227b5735a7322c4a43a461953d4ff";
  static final String mainUrl = "https://api.themoviedb.org/3";
  String _getPlayingUrl = '$mainUrl/movie/now_playing';
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
}