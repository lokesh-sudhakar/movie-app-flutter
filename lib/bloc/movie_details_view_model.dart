import 'package:moviejunction/enums/view_state.dart';
import 'package:moviejunction/model/movie_detail_response.dart';

import 'base_view_model.dart';


class MovieDetailsViewModel extends BaseViewModel {


  MovieDetailResponse _response ;

  MovieDetailResponse get response => _response;


  Future<MovieDetailResponse> getMovieDetails(int id) async {
    setState(ViewState.Busy);
    MovieDetailResponse response = await repository.getMovieDetail(id);
    this._response = response;
    setState(ViewState.Idle);
    return response;
  }

}