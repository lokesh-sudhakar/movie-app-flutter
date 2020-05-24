import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../model/movie.dart';
import '../model/movie_response.dart';
import '../screens/detail/movie_detail_screen.dart';

class MovieList extends StatefulWidget {
  final MovieResponse _movieResponse;

  MovieList(this._movieResponse);

  @override
  _MovieListState createState() => _MovieListState(_movieResponse);
}

class _MovieListState extends State<MovieList> {
  final MovieResponse _movieResponse;

  _MovieListState(this._movieResponse);

  @override
  Widget build(BuildContext context) {
    return _getContentWidget(_movieResponse);
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
    return !shouldShowMovieCard(movie)
        ? _getEmptyWidget()
        : GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetailScreen(movie),
                  ));
            },
            child: Container(
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
                        image: NetworkImage('https://image.tmdb.org/t/p/w200/' +
                            movie.posterPath),
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
            ),
          );
  }

  bool shouldShowMovieCard(Movie movie) {
    if ((movie.posterPath == null || movie.posterPath.isEmpty) ||
        (movie.backdropPath == null || movie.backdropPath.isEmpty)) {
      return false;
    } else {
      return true;
    }
  }

  Widget _getEmptyWidget() {
    return Container(
      width: 0,
      height: 0,
    );
  }
}
