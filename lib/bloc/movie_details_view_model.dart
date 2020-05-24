import 'package:moviejunction/enums/view_state.dart';
import 'package:moviejunction/model/movie_detail_response.dart';

import 'base_view_model.dart';
import '../model/movie.dart';


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

  bool addMovieToFavourite(Movie movie) {
    //todo need to implement favourites functionality
    if (_isFavouriteMovie) {
      _isFavouriteMovie = false;
    } else {
      _isFavouriteMovie = true;
    }
    notifyListeners();
    return _isFavouriteMovie;

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

}