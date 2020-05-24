import 'movie.dart';
import 'dates.dart';

class MovieResponse {
  List<Movie> results;
  int page;
  int totalResults;
  Dates dates;
  int totalPages;
  String error = "";

  MovieResponse(
      {this.results,
      this.page,
      this.totalResults,
      this.dates,
      this.totalPages});

  MovieResponse.withError(String errorValue) {
    results = List();
    error = errorValue;
  }

  MovieResponse.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = new List<Movie>();
      json['results'].forEach((v) {
        results.add(new Movie.fromJson(v));
      });
    }
    page = json['page'];
    totalResults = json['total_results'];
    dates = json['dates'] != null ? new Dates.fromJson(json['dates']) : null;
    totalPages = json['total_pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    data['page'] = this.page;
    data['total_results'] = this.totalResults;
    if (this.dates != null) {
      data['dates'] = this.dates.toJson();
    }
    data['total_pages'] = this.totalPages;
    return data;
  }
}
