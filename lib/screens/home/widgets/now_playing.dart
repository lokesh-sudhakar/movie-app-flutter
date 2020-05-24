import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviejunction/bloc/movie_list_view_model.dart';
import 'package:moviejunction/enums/view_state.dart';
import 'package:moviejunction/common_widgets/base_view.dart';

import 'dots_indicator_widget.dart';

class NowPlaying extends StatefulWidget {

  @override
  _NowPlayingState createState() => _NowPlayingState();

}

class _NowPlayingState extends State<NowPlaying> {

  PageController pageController;

  @override
  Widget build(BuildContext context) {
    return BaseView<MovieListViewModel>(
      initState: (model) {
        pageController = PageController();
        model.fetchNowPlayingMovies();
        model.setCurrentPageIndex(0);
      },
      builder: (context,model,widget) => Container(
          color: Theme.of(context).primaryColorLight,
          width: double.infinity,
          height: 220,
          child: Center(
            child: model.state == ViewState.Busy
                ? CircularProgressIndicator()
                : Container(
              child: Stack(
                children: <Widget>[
                  PageView.builder(
                    controller: pageController,
                    itemCount: 5,
                    onPageChanged: (position) {
                      model.setCurrentPageIndex(position);
                    },
                    itemBuilder: (context, position) {
                      return Stack(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://image.tmdb.org/t/p/original/" +
                                          model.response
                                              .results[position].backdropPath),
                                  fit: BoxFit.fill,
                                )),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: FractionalOffset.topCenter,
                                end: FractionalOffset.bottomCenter,
                                colors: [
                                  Theme
                                      .of(context)
                                      .primaryColor
                                      .withOpacity(0.0),
                                  Theme
                                      .of(context)
                                      .primaryColor
                                      .withOpacity(0.8),
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: Icon(
                              Icons.play_circle_outline,
                              size: 60.0,
                              color: Theme
                                  .of(context)
                                  .accentColor,
                            ),
                          ),
                          Positioned(
                            left: 20,
                            bottom: 20,
                            right: 20,
                            child: Text(
                              model.response.results[position].title,
                              maxLines: 2,
                              textScaleFactor: 1,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20.0),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    heightFactor: 14,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CustomDotsIndicator(5, model.currentPageIndex.toDouble()),
                      ],
                    ),
                  ),
                ],),
            ),
          )
      ),
    ) ;
  }
}
