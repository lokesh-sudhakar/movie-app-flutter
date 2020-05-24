
import 'package:flutter/material.dart';
import 'package:moviejunction/bloc/base_view_model.dart';
import 'package:moviejunction/enums/view_state.dart';
import 'package:moviejunction/model/genres_response.dart';


class GenreViewModel extends BaseViewModel {

  GenresResponse _genreResponse;
  TabController tabController;

  GenresResponse get genreResponse => this._genreResponse;

  Future<GenresResponse> getGenres() async{
    setState(ViewState.Busy);
    GenresResponse response = await repository.getGenres();
    this._genreResponse = response;
    setState(ViewState.Idle);
    return response;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}