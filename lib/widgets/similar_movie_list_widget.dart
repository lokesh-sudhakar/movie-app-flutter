import 'package:flutter/material.dart';
import 'package:moviejunction/bloc/similar_movie_view_model.dart';
import 'package:moviejunction/enums/view_state.dart';
import 'package:moviejunction/locator.dart';
import 'package:provider/provider.dart';
import 'movie_list.dart';
import 'empty_widget.dart';


class SimilarMovieListWidget extends StatefulWidget {

  final int _movieId;

  SimilarMovieListWidget(this._movieId);

  @override
  _SimilarMovieListWidgetState createState() => _SimilarMovieListWidgetState(this._movieId);
}

class _SimilarMovieListWidgetState extends State<SimilarMovieListWidget> {


  final int _movieId;

  _SimilarMovieListWidgetState(this._movieId);

  SimilarMovieViewModel _similarMovieViewModel = locator<SimilarMovieViewModel>();


  @override
  void initState() {
    super.initState();
    _similarMovieViewModel.fetchSimilarMovies(_movieId);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SimilarMovieViewModel>(
      create: (context) => _similarMovieViewModel,
      child: Consumer<SimilarMovieViewModel>(
        builder: (context,model,widget){
          return  model.state == ViewState.Busy || model.response.results.isEmpty ? EmptyWidget() : Container(
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("SIMILAR MOVIES",
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
                    child: model.state == ViewState.Busy ? CircularProgressIndicator() :
                    MovieList(model.response),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }


}

