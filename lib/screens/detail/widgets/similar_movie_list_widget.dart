import 'package:flutter/material.dart';
import 'package:moviejunction/bloc/movie_list_view_model.dart';
import 'package:moviejunction/enums/view_state.dart';
import 'package:moviejunction/common_widgets/base_view.dart';

import '../../../common_widgets/empty_widget.dart';
import '../../../common_widgets/movie_list.dart';

class SimilarMovieListWidget extends StatelessWidget {
  final int _movieId;

  SimilarMovieListWidget(this._movieId);

  @override
  Widget build(BuildContext context) {
    return BaseView<MovieListViewModel>(
      initState: (model) {
        model.fetchSimilarMovies(_movieId);
      },
      builder: (context, model, child) =>
          model.state == ViewState.Busy || model.response.results.isEmpty
              ? EmptyWidget()
              : Container(
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
                          "SIMILAR MOVIES",
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
                              : MovieList(model.response),
                        ),
                      )
                    ],
                  ),
                ),
    );
  }
}
