
import 'package:moviejunction/bloc/base_view_model.dart';
import 'package:moviejunction/enums/view_state.dart';
import 'package:moviejunction/locator.dart';
import 'package:moviejunction/model/cast_response.dart';
import 'package:moviejunction/model/movie_response.dart';
import 'package:moviejunction/repository/movie_repository.dart';

class MovieCastViewModel extends BaseViewModel{

  CastResponse _castResponse;

  CastResponse get castResponse => this._castResponse;

  void getCastsOfMovie(int movieId) async{
    setState(ViewState.Busy);
    CastResponse response = await repository.getCasts(movieId);
    this._castResponse = response;
    setState(ViewState.Idle);
  }
}