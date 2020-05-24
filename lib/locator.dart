import 'package:get_it/get_it.dart';
import 'package:moviejunction/bloc/movie_cast_view_model.dart';
import 'package:moviejunction/bloc/movie_details_view_model.dart';
import 'package:moviejunction/bloc/similar_movie_view_model.dart';
import 'package:moviejunction/repository/movie_repository.dart';


GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory(() => MovieDetailsViewModel());
  locator.registerLazySingleton(() => MovieRepository());
  locator.registerFactory(() => MovieCastViewModel());
  locator.registerFactory(() => SimilarMovieViewModel());
}