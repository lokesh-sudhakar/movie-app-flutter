import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviejunction/bloc/movie_list_bloc.dart';
import 'package:moviejunction/model/movie_response.dart';
import 'package:moviejunction/widgets/movie_list.dart';

import 'error.dart';

class GenreMovieList extends StatefulWidget {
  final int _genreId;

  GenreMovieList(this._genreId);

  @override
  _GenreMovieListState createState() => _GenreMovieListState(_genreId);
}

class _GenreMovieListState extends State<GenreMovieList> {
  final int _genreId;

  MovieListBloc genreMovieListBloc;

  _GenreMovieListState(this._genreId);

  @override
  void initState() {
    super.initState();
    genreMovieListBloc = MovieListBloc();
    genreMovieListBloc.getMoviesByGenre(_genreId.toString());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    genreMovieListBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Center(
        child: StreamBuilder<MovieResponse>(
          stream: genreMovieListBloc.getMovieStream,
          builder:
              (BuildContext context, AsyncSnapshot<MovieResponse> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.error != null &&
                  snapshot.data.error.isNotEmpty) {
                return CustomErrorWidget(snapshot.data.error);
              }
              return MovieList(snapshot.data);
            } else if (snapshot.hasError) {
              return CustomErrorWidget(snapshot.data.error);
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
