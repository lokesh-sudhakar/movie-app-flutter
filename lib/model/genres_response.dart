import 'genres.dart';

class GenresResponse {
  List<Genres> genres;
  String error = "";

  GenresResponse({this.genres}) {
    this.error = "";
  }

  GenresResponse.withError(String exception) {
    this.genres = List();
    this.error = exception;
  }

  GenresResponse.fromJson(Map<String, dynamic> json) {
    if (json['genres'] != null) {
      genres = new List<Genres>();
      json['genres'].forEach((v) {
        genres.add(new Genres.fromJson(v));
      });
    }
    error = "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.genres != null) {
      data['genres'] = this.genres.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
