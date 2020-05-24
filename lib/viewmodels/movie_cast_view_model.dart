import 'package:moviejunction/viewmodels//base_view_model.dart';
import 'package:moviejunction/enums/view_state.dart';
import 'package:moviejunction/model/cast_response.dart';

class MovieCastViewModel extends BaseViewModel {
  CastResponse _castResponse;

  CastResponse get castResponse => this._castResponse;

  void getCastsOfMovie(int movieId) async {
    setState(ViewState.Busy);
    CastResponse response = await repository.getCasts(movieId);
    this._castResponse = response;
    setState(ViewState.Idle);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
