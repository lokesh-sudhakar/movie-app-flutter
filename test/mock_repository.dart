import 'package:flutter_test/flutter_test.dart';
import 'package:moviejunction/model/cast_response.dart';
import 'package:moviejunction/model/genres_response.dart';
import 'package:moviejunction/model/movie.dart';
import 'package:moviejunction/model/movie_detail_response.dart';
import 'package:moviejunction/model/movie_response.dart';
import 'package:moviejunction/model/persons_response.dart';
import 'package:moviejunction/repository/api.dart';

class MockApi extends API {
  @override
  Future<bool> addFavouriteMovie(Movie movie) {
    // TODO: implement addFavouriteMovie
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getAllFavouriteMovies() {
    // TODO: implement getAllFavouriteMovies
    throw UnimplementedError();
  }

  @override
  Future<CastResponse> getCasts(int id) {
    // TODO: implement getCasts
    throw UnimplementedError();
  }
  @override
  Future<MovieResponse> getGenreMovies(String genreId) {
    // TODO: implement getGenreMovies
    throw UnimplementedError();
  }

  @override
  Future<GenresResponse> getGenres() {
    // TODO: implement getGenres
    throw UnimplementedError();
  }

 @override
  Future<MovieDetailResponse> getMovieDetail(int id) {
    // TODO: implement getMovieDetail
    throw UnimplementedError();
  }
  @override
  Future<MovieResponse> getNowPlayingMovies() {
    // TODO: implement getNowPlayingMovies
    throw UnimplementedError();
  }

  @override
  Future<MovieResponse> getPopularMovies() {
    // TODO: implement getPopularMovies
    throw UnimplementedError();
  }

 @override
  Future<MovieResponse> getSimilarMovies(int id) async {

    List<Movie> movie = await  Future.value([
      Movie(voteCount: 9,posterPath: "93939",backdropPath: "292929",title: "The Quiet",
            voteAverage: 9,overview: "This is Over view",releaseDate: "26-0401998"),
      Movie(voteCount: 98,posterPath: "jnsdjnjadw",backdropPath: "wda",title: "Harry potter",
          voteAverage: 3,overview: "This is Harrypotter Over view",releaseDate: "26-12-1948")
    ]);
    return MovieResponse(results: movie);
  }
  @override
  Future<PersonsResponse> getTrendingPersons() {
    // TODO: implement getTrendingPersons
    throw UnimplementedError();
  }

  @override
  Future<bool> isFavouriteMovie(int movieId) {
    // TODO: implement isFavouriteMovie
    throw UnimplementedError();
  }

  @override
  Future<bool> removeMovieFromFavourites(int movieId) {
    // TODO: implement removeMovieFromFavourites
    throw UnimplementedError();
  }

}