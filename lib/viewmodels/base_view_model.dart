import 'package:flutter/cupertino.dart';
import 'package:moviejunction/enums/view_state.dart';
import 'package:moviejunction/locator.dart';
import 'package:moviejunction/repository/api.dart';

class BaseViewModel extends ChangeNotifier {
  API repository = locator<API>();

  ViewState _state;

  ViewState get state => this._state;

  void setState(ViewState state) {
    this._state = state;
    notifyListeners();
  }
}
