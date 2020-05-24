import 'package:flutter/material.dart';
import 'package:moviejunction/widgets/movie_list.dart';

import '../bloc/movie_list_bloc.dart';
import '../model/movie_response.dart';
import '../widgets/error.dart';

class PopularMovieList extends StatefulWidget {
  @override
  _PopularMovieListState createState() => _PopularMovieListState();
}

class _PopularMovieListState extends State<PopularMovieList> {

  MovieListBloc _movieListBloc;


  @override
  void initState() {
    super.initState();
    _movieListBloc = MovieListBloc();
    _movieListBloc.getMoviesByPopularity();
  }


  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("BEST POPULAR MOVIES",
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
              child: StreamBuilder<MovieResponse> (
                stream: _movieListBloc.getMovieStream,
                builder: (BuildContext context, AsyncSnapshot<MovieResponse> snapshot)  {
                  if (snapshot.hasData) {
                    if (snapshot.data.error != null && snapshot.data.error.isNotEmpty) {
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
          )
        ],
      ),
    );
  }
}

