import 'package:get_it/get_it.dart';
import 'package:moviejunction/repository/api.dart';
import 'package:moviejunction/viewmodels/genre_list_view_model.dart';
import 'package:moviejunction/viewmodels/movie_cast_view_model.dart';
import 'package:moviejunction/viewmodels/movie_details_view_model.dart';
import 'package:moviejunction/viewmodels/movie_list_view_model.dart';
import 'package:moviejunction/viewmodels/trending_person_list_bloc.dart';
import 'package:moviejunction/repository/movie_repository.dart';

GetIt locator = GetIt.instance;

const bool USE_FAKE_IMPLEMENTATION = false;

void setupLocator() {
  locator.registerLazySingleton<API>(() => MovieRepository());
  locator.registerFactory(() => MovieDetailsViewModel());
  locator.registerFactory(() => MovieCastViewModel());
  locator.registerFactory(() => MovieListViewModel());
  locator.registerFactory(() => GenreViewModel());
  locator.registerFactory(() => TrendingPersonListViewModel());
}
