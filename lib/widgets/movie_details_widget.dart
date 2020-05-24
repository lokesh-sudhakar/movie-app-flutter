import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviejunction/bloc/movie_details_view_model.dart';
import 'package:moviejunction/enums/view_state.dart';
import 'package:moviejunction/model/genres.dart';
import 'package:provider/provider.dart';
import 'package:moviejunction/locator.dart';
import 'package:moviejunction/model/movie_detail_response.dart';

class MovieDetailsWidget extends StatefulWidget {
  final int id;

  MovieDetailsWidget(this.id);

  @override
  _MovieDetailsWidgetState createState() => _MovieDetailsWidgetState(this.id);
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  final int id;
  MovieDetailsViewModel model = locator<MovieDetailsViewModel>();

  _MovieDetailsWidgetState(this.id);

  @override
  void initState() {
    super.initState();
    model.getMovieDetails(id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MovieDetailsViewModel>(
        create: (context) => model,
        child: Consumer<MovieDetailsViewModel>(
          builder: (BuildContext context, MovieDetailsViewModel model,
              Widget child) {
            return Container(
              child: Center(
                child: model.state == ViewState.Busy
                    ? CircularProgressIndicator()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top:8.0,left: 8.0,right: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                model.response.movieDetail.budget == 0 ? showDetails("BUDGET",
                                    '--' + r"$") : showDetails("BUDGET",
                                    '${model.response.movieDetail.budget}' + r"$"),
                                showDetails("DURATION",
                                    '${model.response.movieDetail.runtime} min'),
                                showDetails("RELEASE DATE",
                                    '${model.response.movieDetail.releaseDate}'),
                              ],
                            ),
                          ),
                          getGenreListWidget(model.response.movieDetail.genres),
                        ],
                      ),
              ),
            );
          },
        ));
  }

  Widget showDetails(String title, String body) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: Theme.of(context).primaryColorLight,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          Text(
            body,
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget getGenreListWidget(List<Genres> genres) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top:8.0, left: 12.0),
          child: Text(
            'GENRES',
            style: TextStyle(
              color: Theme.of(context).primaryColorLight,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
        Container(
          height: 40,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: genres.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top:2.0, left: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(color: Colors.white)),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(genres[index].name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            )),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
