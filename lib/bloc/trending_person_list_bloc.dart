
import 'dart:async';

import 'package:moviejunction/model/persons_response.dart';
import 'package:moviejunction/repository/movie_repository.dart';

class TrendingPersonListBloc {

  MovieRepository repository = new MovieRepository();
  StreamController<PersonsResponse> streamController = StreamController<PersonsResponse>();

  Stream<PersonsResponse> get personStream => streamController.stream;

  StreamSink<PersonsResponse> get personSink => streamController.sink;

  void getTrendingPersons() async {
    PersonsResponse response = await repository.getTrendingPersons();
    personSink.add(response);
  }

  dispose() {
    streamController.close();
  }

}