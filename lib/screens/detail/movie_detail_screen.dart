import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:moviejunction/bloc/movie_details_view_model.dart';
import 'package:moviejunction/common_widgets/base_view.dart';
import 'widgets/cast_list_widget.dart';
import 'widgets/movie_details_widget.dart';
import 'widgets/similar_movie_list_widget.dart';

import '../../model/movie.dart';

class MovieDetailScreen extends StatefulWidget {
  final Movie _movie;

  MovieDetailScreen(this._movie);

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState(this._movie);
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  final Movie _movie;

  _MovieDetailScreenState(this._movie);

  @override
  Widget build(BuildContext context) {
    return BaseView<MovieDetailsViewModel>(
        builder: (context, model, child) => Scaffold(
              backgroundColor: Theme.of(context).primaryColor,
              body: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    pinned: true,
                    expandedHeight: 230,
                    floating: true,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text(
                        _movie.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      collapseMode: CollapseMode.parallax,
                      titlePadding: EdgeInsets.only(left: 50, bottom: 16),
                      background: Container(
                        child: Stack(
                          fit: StackFit.expand,
                          overflow: Overflow.visible,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          "https://image.tmdb.org/t/p/original/" +
                                              _movie.backdropPath))),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: FractionalOffset.topCenter,
                                      end: FractionalOffset.bottomCenter,
                                      colors: [
                                    Colors.black.withOpacity(0.0),
                                    Colors.black.withOpacity(0.9)
                                  ])),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(<Widget>[
                      _getRatingWidget(),
                      _getOverviewDescriptionWidget(_movie.overview),
                      MovieDetailsWidget(_movie.id),
                      CastListWidget(_movie.id),
                      SimilarMovieListWidget(_movie.id),
                    ]),
                  )
                ],
              ),
              floatingActionButton: _getFloatingActionButton(model),
            ));
  }

  Widget _getRatingWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            _movie.voteAverage.toString(),
            style: TextStyle(
                fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: RatingBar(
              direction: Axis.horizontal,
              maxRating: 5,
              initialRating: _movie.voteAverage / 2,
              glowColor: Theme.of(context).accentColor,
              unratedColor: Colors.white,
              allowHalfRating: true,
              onRatingUpdate: (rating) {
                debugPrint(rating.toString());
              },
              itemSize: 15,
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Theme.of(context).accentColor,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _getOverviewDescriptionWidget(String description) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 16.0, right: 12.0),
          child: Text(
            "Overview".toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).primaryColorLight,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 16.0, right: 12.0),
          child: Text(
            description,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        )
      ],
    );
  }

  Widget _getFloatingActionButton(MovieDetailsViewModel model) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).accentColor,
      child: model.isFavouriteMovie == true
          ? Icon(
              Icons.favorite,
              color: Colors.red,
            )
          : Icon(Icons.favorite_border),
      onPressed: () {
        model.addMovieToFavourite(_movie);
      },
    );
  }
}
