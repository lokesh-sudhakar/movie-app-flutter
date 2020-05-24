import 'known_for.dart';

class Person {
  bool adult;
  int gender;
  String name;
  int id;
  String knownForDepartment;
  String profilePath;
  double popularity;
  String mediaType;

  Person(
      {this.adult,
        this.gender,
        this.name,
        this.id,
        this.knownForDepartment,
        this.profilePath,
        this.popularity,
        this.mediaType});

  Person.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    gender = json['gender'];
    name = json['name'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    profilePath = json['profile_path'];
    popularity = json['popularity'];
    mediaType = json['media_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult;
    data['gender'] = this.gender;
    data['name'] = this.name;
    data['id'] = this.id;
    data['known_for_department'] = this.knownForDepartment;
    data['profile_path'] = this.profilePath;
    data['popularity'] = this.popularity;
    data['media_type'] = this.mediaType;
    return data;
  }
}
