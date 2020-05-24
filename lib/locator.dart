import 'package:get_it/get_it.dart';
import 'package:moviejunction/bloc/genre_list_view_model.dart';
import 'package:moviejunction/bloc/movie_cast_view_model.dart';
import 'package:moviejunction/bloc/movie_details_view_model.dart';
import 'package:moviejunction/bloc/movie_list_view_model.dart';
import 'package:moviejunction/bloc/trending_person_list_bloc.dart';
import 'package:moviejunction/repository/movie_repository.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => MovieRepository());
  locator.registerFactory(() => MovieDetailsViewModel());
  locator.registerFactory(() => MovieCastViewModel());
  locator.registerFactory(() => MovieListViewModel());
  locator.registerFactory(() => GenreViewModel());
  locator.registerFactory(() => TrendingPersonListViewModel());
}
