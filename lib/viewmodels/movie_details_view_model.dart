import 'package:moviejunction/enums/view_state.dart';
import 'package:moviejunction/model/movie_detail_response.dart';

import '../model/movie.dart';
import 'base_view_model.dart';

class MovieDetailsViewModel extends BaseViewModel {

  MovieDetailResponse _response;
  bool _isFavouriteMovie = false;

  MovieDetailResponse get response => _response;

  bool get isFavouriteMovie => this._isFavouriteMovie;

  void getMovieDetails(int id) async {
    setState(ViewState.Busy);
    MovieDetailResponse response = await repository.getMovieDetail(id);
    this._response = response;
    setState(ViewState.Idle);
  }

  void checkIfMovieIsInFavouriteList(int movieId) async {
    _isFavouriteMovie = await repository.isFavouriteMovie(movieId);
    notifyListeners();
  }

  void onFavouriteFabClicked(Movie movie) {
    if (_isFavouriteMovie) {
      repository.removeMovieFromFavourites(movie.id);
      _isFavouriteMovie = false;
    } else {
      repository.addFavouriteMovie(movie);
      _isFavouriteMovie = true;
    }
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
