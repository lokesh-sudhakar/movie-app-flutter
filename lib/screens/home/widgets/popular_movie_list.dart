import 'package:flutter/material.dart';
import 'package:moviejunction/enums/view_state.dart';
import 'package:moviejunction/common_widgets/base_view.dart';
import 'package:moviejunction/common_widgets/movie_list.dart';

import '../../../bloc/movie_list_view_model.dart';
import '../../../model/movie_response.dart';
import '../../../common_widgets/error.dart';

class PopularMovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<MovieListViewModel>(
      initState: (model) {
        model.getMoviesByPopularity();
      },
      builder: (context, model, child) => Container(
        width: double.infinity,
        color: Theme.of(context).primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "BEST POPULAR MOVIES",
                style: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                  fontSize: 12,
                ),
              ),
            ),
            Container(
              height: 280,
              color: Theme.of(context).primaryColor,
              child: Center(
                child: model.state == ViewState.Busy
                    ? CircularProgressIndicator()
                    : model.response.error.isNotEmpty
                        ? CustomErrorWidget(model.response.error)
                        : MovieList(model.response),
              ),
            )
          ],
        ),
      ),
    );
  }
}
