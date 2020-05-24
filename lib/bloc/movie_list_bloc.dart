import 'dart:async';

import 'package:moviejunction/model/movie_response.dart';
import 'package:moviejunction/repository/movie_repository.dart';


class MovieListBloc {

  final MovieRepository repository =  MovieRepository();

  StreamController<MovieResponse> movieStreamController = StreamController();

  Stream<MovieResponse> get getMovieStream => movieStreamController.stream;

  StreamSink<MovieResponse> get getMovieSink => movieStreamController.sink;


  getMoviesByGenre(String genreId) async {
      MovieResponse response = await repository.getGenreMovies(genreId);
      movieStreamController.sink.add(response);
  }

  getMoviesByPopularity() async {
    MovieResponse response = await repository.getPopularMovies();
    movieStreamController.sink.add(response);
  }

  dispose() {
    movieStreamController.close();
  }

}