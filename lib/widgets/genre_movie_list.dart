import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:moviejunction/bloc/genre_movie_list_bloc.dart';
import 'package:moviejunction/model/movie.dart';
import 'package:moviejunction/model/movie_response.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'error.dart';

class GenreMovieList extends StatefulWidget {
  final int _genreId;

  GenreMovieList(this._genreId);

  @override
  _GenreMovieListState createState() => _GenreMovieListState(_genreId);
}

class _GenreMovieListState extends State<GenreMovieList> {
  final int _genreId;

  GenreMovieListBloc genreMovieListBloc;

  _GenreMovieListState(this._genreId);

  @override
  void initState() {
    super.initState();
    genreMovieListBloc = GenreMovieListBloc();
    genreMovieListBloc.getMoviesByGenre(_genreId.toString());
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
              return _getContentWidget(snapshot.data);
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

  Widget _getContentWidget(MovieResponse response) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: response.results.length,
        itemBuilder: (context, index) {
          return _getMovieCardWidget(response.results[index]);
        });
  }

  Widget _getMovieCardWidget(Movie movie) {
    return Container(
      height: 250,
      width: 150,
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 200,
            width: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3.0)),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    'https://image.tmdb.org/t/p/w200/' + movie.posterPath),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
            child: Text(
              movie.title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  movie.voteAverage.toString(),
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: RatingBar(
                    direction: Axis.horizontal,
                    maxRating: 5,
                    initialRating: movie.voteAverage / 2,
                    glowColor: Theme.of(context).accentColor,
                    unratedColor: Colors.white,
                    allowHalfRating: true,
                    onRatingUpdate: (rating) {
                      debugPrint(rating.toString());
                    },
                    itemSize: 10,
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
