import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviejunction/bloc/movie_list_view_model.dart';
import 'package:moviejunction/enums/view_state.dart';
import 'package:moviejunction/common_widgets/base_view.dart';
import 'package:moviejunction/common_widgets/movie_list.dart';

import '../../../common_widgets/error.dart';

class GenreMovieList extends StatefulWidget {

  final int _genreId;

  GenreMovieList(this._genreId);

  @override
  _GenreMovieListState createState() => _GenreMovieListState(_genreId);
}

class _GenreMovieListState extends State<GenreMovieList> {

  final int _genreId;

  _GenreMovieListState(this._genreId);

  @override
  Widget build(BuildContext context) {

    return BaseView<MovieListViewModel>(
      initState: (model) {
        model.getMoviesByGenre(_genreId.toString());
      },
      builder: (context, model, child) => Container(
        color: Theme.of(context).primaryColor,
        child: Center(
          child: model.state == ViewState.Busy ? CircularProgressIndicator() :
              model.response.error.isNotEmpty ? CustomErrorWidget(model.response.error) :
          MovieList(model.response),
        ),
      ),
    );

  }
}
