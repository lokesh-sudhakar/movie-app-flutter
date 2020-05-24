
import 'dart:async';

import 'package:moviejunction/bloc/base_view_model.dart';
import 'package:moviejunction/enums/view_state.dart';
import 'package:moviejunction/model/persons_response.dart';
import 'package:moviejunction/repository/movie_repository.dart';

class TrendingPersonListViewModel extends BaseViewModel {

  PersonsResponse _response;

  PersonsResponse get response => this._response;

  void getTrendingPersons() async {
    setState(ViewState.Busy);
    PersonsResponse response = await repository.getTrendingPersons();
    this._response = response;
    setState(ViewState.Idle);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}