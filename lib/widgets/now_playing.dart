import 'package:flutter/material.dart';
import 'package:moviejunction/model/movie_response.dart';
import 'package:moviejunction/repository/movie_repository.dart';
import 'dart:async';


class NowPlaying extends StatefulWidget {
  @override
  _NowPlayingState createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {

  MovieRepository movieRepository = MovieRepository();
  MovieResponse movieResponse;
  PageController pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
    getMovieResponse();
  }

   getMovieResponse() async {
    movieResponse = await movieRepository.getNowPlayingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return movieResponse == null ? CircularProgressIndicator() : Container(
      width: double.infinity,
      height: 220,
      child: PageView.builder(
        controller: pageController,
        itemCount: 5,
        itemBuilder: (context, position) {
          return Container(
            decoration: BoxDecoration(

              image : DecorationImage(
                image: NetworkImage("https://image.tmdb.org/t/p/original/" + movieResponse.results[position].backdropPath),
              )
            ),
          );
        },
      ),
    );
  }
}
