import 'package:flutter/material.dart';
import 'package:moviejunction/model/movie_response.dart';
import 'package:moviejunction/repository/movie_repository.dart';
import 'dart:async';
import '../model/movie.dart';


class GenreMovieListBloc {

  final MovieRepository repository =  MovieRepository();

  StreamController<MovieResponse> movieStreamController = StreamController();

  Stream<MovieResponse> get getMovieStream => movieStreamController.stream;

  StreamSink<MovieResponse> get getMovieSink => movieStreamController.sink;


  getMoviesByGenre(String genreId) async {
      MovieResponse response = await repository.getGenreMovies(genreId);
      if (response.error.isEmpty) {
        movieStreamController.sink.add(response);
      }
  }

  dispose() {
    movieStreamController.close();
  }

}