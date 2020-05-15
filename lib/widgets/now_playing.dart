import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviejunction/model/movie_response.dart';
import 'package:moviejunction/repository/movie_repository.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'dart:async';

class NowPlaying extends StatefulWidget {
  @override
  _NowPlayingState createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  MovieRepository movieRepository = MovieRepository();
  MovieResponse movieResponse;
  PageController pageController;
  int _currentPageIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
    getMovieResponse();
    _currentPageIndex = 0;
  }

  getMovieResponse() async {
    MovieResponse response = await movieRepository.getNowPlayingMovies();
    setState(() {
      movieResponse = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 220,
        child: Center(
          child: movieResponse == null
              ? CircularProgressIndicator()
              : Container(
            child: Stack(
              children: <Widget>[
                PageView.builder(
                  controller: pageController,
                  itemCount: 5,
                  onPageChanged: (position) {
                    setState(() {
                      _currentPageIndex = position;
                    });
                  },
                  itemBuilder: (context, position) {
                    return Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://image.tmdb.org/t/p/original/" +
                                        movieResponse
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
                            movieResponse.results[position].title,
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
                        _dotsIndicator(5, _currentPageIndex.toDouble()),
                      ],
                  ),
                ),

          ],),
        ),
        )
    );
  }

  Widget _dotsIndicator(int pageLength, double currentIndex) {
    return new DotsIndicator(
      dotsCount: pageLength,
      position: currentIndex,
      decorator: DotsDecorator(
        activeColor: Theme
            .of(context)
            .accentColor,
        spacing: EdgeInsets.all(5)
      ),
    );
  }
}
