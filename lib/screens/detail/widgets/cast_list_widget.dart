import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviejunction/enums/view_state.dart';
import 'package:moviejunction/locator.dart';
import 'package:moviejunction/model/cast.dart';
import 'package:moviejunction/common_widgets/profile_widget.dart';
import 'package:provider/provider.dart';
import '../../../viewmodels/movie_cast_view_model.dart';

class CastListWidget extends StatefulWidget {
  final int movieId;

  CastListWidget(this.movieId);

  @override
  _CastListWidgetState createState() => _CastListWidgetState(this.movieId);
}

class _CastListWidgetState extends State<CastListWidget> {
  final int movieId;

  _CastListWidgetState(this.movieId);

  MovieCastViewModel _castViewModel = locator<MovieCastViewModel>();

  @override
  void initState() {
    super.initState();
    _castViewModel.getCastsOfMovie(movieId);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MovieCastViewModel>(
        create: (context) => _castViewModel,
        child: Consumer<MovieCastViewModel>(
          builder: (context, model, widget) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                    child: Text(
                      "CASTS",
                      style: TextStyle(
                        color: Color(0xFF5a606b),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 130,
                      child: model.state == ViewState.Busy
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: model.castResponse.casts.length,
                              itemBuilder: (context, index) {
                                Cast cast = model.castResponse.casts[index];
                                return (cast.img == null || cast.img.isEmpty)
                                    ? _getEmptyWidget()
                                    : _getProfileWidget(cast);
                              }),
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }

  Widget _getEmptyWidget() {
    return Container(
      width: 0,
      height: 0,
    );
  }

  Widget _getProfileWidget(Cast cast) {
    String profile = 'https://image.tmdb.org/t/p/w300/' + cast.img;
    return ProfileWidget(cast.name, cast.character, profile);
  }
}
