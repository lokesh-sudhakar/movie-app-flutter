import 'package:flutter/cupertino.dart';
import 'package:moviejunction/enums/view_state.dart';
import 'package:moviejunction/locator.dart';
import 'package:moviejunction/repository/movie_repository.dart';

class BaseViewModel extends ChangeNotifier {
  MovieRepository repository = locator<MovieRepository>();

  ViewState _state;

  ViewState get state => this._state;

  void setState(ViewState state) {
    this._state = state;
    notifyListeners();
  }
}
