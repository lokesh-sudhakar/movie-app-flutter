import 'package:flutter/material.dart';
import 'package:moviejunction/bloc/trending_person_list_bloc.dart';
import 'package:moviejunction/enums/view_state.dart';
import 'package:moviejunction/common_widgets/base_view.dart';
import 'package:moviejunction/common_widgets/error.dart';
import 'profiles_list_widget.dart';

class TrendingPersons extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BaseView<TrendingPersonListViewModel>(
      initState: (model) {
        model.getTrendingPersons();
      },
      builder: (context, model, child) => Container(
        width: double.infinity,
        color: Theme.of(context).primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Trending Persons on this week".toUpperCase(),
                style: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                  fontSize: 12,
                ),
              ),
            ),
            model.state == ViewState.Busy
                ? Container(
                    height: 120,
                    child: Center(child: CircularProgressIndicator()))
                : model.response.error.isNotEmpty
                    ? CustomErrorWidget(model.response.error)
                    : ProfileList(model.response.results),
          ],
        ),
      ),
    );
  }
}
