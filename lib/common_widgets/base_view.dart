import 'package:flutter/material.dart';
import 'package:moviejunction/bloc/base_view_model.dart';
import 'package:moviejunction/locator.dart';
import 'package:provider/provider.dart';


class BaseView<T extends BaseViewModel> extends StatefulWidget {

  final Widget Function(BuildContext context, T value, Widget child) builder;
  final Function(T) initState;

  BaseView({this.builder, this.initState});

  @override
  _BaseViewState createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {

  T model = locator<T>();

  @override
  void initState() {
    super.initState();
    if (this.widget.initState != null) {
      this.widget.initState(model);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => model,
      child: Consumer<T>(
        builder: this.widget.builder,
      ),
    );
  }
}
