import 'dart:async';
import 'package:moviejunction/bloc/base_view_model.dart';

import '../model/movie.dart';

class MovieDetailBloc {

  bool _isFavouriteMovie = false;

  StreamController<Movie> _movieStreamController = StreamController<Movie>.broadcast();

  Stream<Movie> get outputMovieStream => _movieStreamController.stream;

  Sink<Movie> get inputMovieSink => _movieStreamController.sink;

  Stream<bool> get  outputIsFavMovie => _movieStreamController.stream
      .map((movie) => _addMovieToFavourite(movie));

  bool _addMovieToFavourite(Movie movie) {
    if (_isFavouriteMovie) {
      _isFavouriteMovie = false;
      return _isFavouriteMovie;
    } else {
      _isFavouriteMovie = true;
      return _isFavouriteMovie;
    }
  }

  dispose() {
    _movieStreamController.close();
  }
}