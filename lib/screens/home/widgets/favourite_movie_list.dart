import 'package:flutter/material.dart';
import 'package:moviejunction/common_widgets/base_view.dart';
import 'package:moviejunction/common_widgets/movie_list.dart';
import 'package:moviejunction/enums/view_state.dart';
import '../../../common_widgets/empty_widget.dart';
import '../../../viewmodels/movie_list_view_model.dart';

class FavouriteMovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<MovieListViewModel>(
      initState: (model) {
        model.fetchFavouriteMovies();
      },
      builder: (context, model, child) => Container(
        width: double.infinity,
        color: Theme.of(context).primaryColor,
        child: model.state == ViewState.Busy ? EmptyWidget() :
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "FAVOURITE MOVIES",
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
                child: MovieList(model.response),
              ),
            )
          ],
        ),
      ),
    );
  }
}
