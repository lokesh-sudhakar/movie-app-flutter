import 'persons.dart';

class PersonsResponse {
  int page;
  List<Person> results;
  int totalPages;
  int totalResults;
  String error;

  PersonsResponse(
      {this.page, this.results, this.totalPages, this.totalResults});

  PersonsResponse.withError(this.error);

  PersonsResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = new List<Person>();
      json['results'].forEach((v) {
        results.add(new Person.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = this.totalPages;
    data['total_results'] = this.totalResults;
    return data;
  }
}