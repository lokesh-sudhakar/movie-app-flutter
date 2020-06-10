import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moviejunction/locator.dart';
import 'package:moviejunction/model/movie.dart';
import 'package:moviejunction/repository/movie_repository.dart';
import 'package:moviejunction/viewmodels/movie_details_view_model.dart';
import 'package:moviejunction/viewmodels/movie_list_view_model.dart';
import 'mock_repository.dart';




void main(){

  setupLocator();

  //mocking api
  group("Given Similar movies display", ()  {
    test("The page should load similar movies", ()  async {
      MovieListViewModel viewModel = locator<MovieListViewModel>();
      viewModel.repository = MockApi();

      await viewModel.fetchSimilarMovies(2);
      expect(viewModel.response.results.length, 2);
      expect(viewModel.response.results[0].title, "The Quiet");

    });
  });


  //testing favourite db functionality
  group("Favourite testing", () {
    test("The favourite added/removed successfully", () async{
      WidgetsFlutterBinding.ensureInitialized();
      MovieDetailsViewModel viewModel = locator<MovieDetailsViewModel>();
      MovieListViewModel listViewModel = locator<MovieListViewModel>();
      listViewModel.repository = MovieRepository();
      viewModel.repository = MovieRepository();
      Movie movie = Movie(voteCount: 9,posterPath: "93939",backdropPath: "292929",title: "The Quiet",
          voteAverage: 9,overview: "This is Over view",releaseDate: "26-0401998");
      await viewModel.onFavouriteFabClicked(movie);
      expect(viewModel.isFavouriteMovie, true);

      await viewModel.onFavouriteFabClicked(movie);
      expect(viewModel.isFavouriteMovie, false);

    });
  });

}