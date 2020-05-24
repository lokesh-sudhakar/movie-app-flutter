import 'package:moviejunction/bloc/base_view_model.dart';
import 'package:moviejunction/enums/view_state.dart';
import 'package:moviejunction/model/movie_response.dart';

class SimilarMovieViewModel extends BaseViewModel {

  MovieResponse _response;

  MovieResponse get response => this._response;

  void fetchSimilarMovies(int movieId) async{
    setState(ViewState.Busy);
    MovieResponse response = await repository.getSimilarMovies(movieId);
    this._response = response;
    setState(ViewState.Idle);
  }
}