import 'package:moviejunction/model/cast_response.dart';
import 'package:moviejunction/model/genres_response.dart';
import 'package:moviejunction/model/movie.dart';
import 'package:moviejunction/model/movie_detail_response.dart';
import 'package:moviejunction/model/movie_response.dart';
import 'package:moviejunction/model/persons_response.dart';

abstract class API {
  Future<MovieResponse> getNowPlayingMovies();

  Future<GenresResponse> getGenres();

  Future<MovieResponse> getGenreMovies(String genreId);

  Future<PersonsResponse> getTrendingPersons();

  Future<MovieResponse> getPopularMovies();

  Future<MovieDetailResponse> getMovieDetail(int id);

  Future<CastResponse> getCasts(int id);

  Future<MovieResponse> getSimilarMovies(int id);

  Future<List<Movie>> getAllFavouriteMovies();

  Future<bool> addFavouriteMovie(Movie movie);

  Future<bool> removeMovieFromFavourites(int movieId);

  Future<bool> isFavouriteMovie(int movieId);
}
