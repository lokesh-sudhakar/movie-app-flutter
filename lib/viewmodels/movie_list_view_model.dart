import 'package:moviejunction/enums/view_state.dart';
import 'package:moviejunction/model/movie_response.dart';
import 'package:moviejunction/viewmodels/base_view_model.dart';

class MovieListViewModel extends BaseViewModel {
  MovieResponse _response;
  int _currentPageIndex;

  MovieResponse get response => this._response;

  int get currentPageIndex => _currentPageIndex;

  setCurrentPageIndex(int index) {
    this._currentPageIndex = index;
    notifyListeners();
  }

  void getMoviesByGenre(String genreId) async {
    setState(ViewState.Busy);
    MovieResponse response = await repository.getGenreMovies(genreId);
    this._response = response;
    setState(ViewState.Idle);
  }

  void getMoviesByPopularity() async {
    setState(ViewState.Busy);
    MovieResponse response = await repository.getPopularMovies();
    this._response = response;
    setState(ViewState.Idle);
  }

  void fetchSimilarMovies(int movieId) async {
    setState(ViewState.Busy);
    MovieResponse response = await repository.getSimilarMovies(movieId);
    this._response = response;
    setState(ViewState.Idle);
  }

  void fetchNowPlayingMovies() async {
    setState(ViewState.Busy);
    MovieResponse response = await repository.getNowPlayingMovies();
    this._response = response;
    setState(ViewState.Idle);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
