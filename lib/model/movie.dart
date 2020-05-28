class Movie {
  int voteCount;
  String posterPath;
  int id;
  String backdropPath;
  String title;
  double voteAverage;
  String overview;
  String releaseDate;

  Movie(
      {this.voteCount,
      this.posterPath,
      this.id,
      this.backdropPath,
      this.title,
      this.voteAverage,
      this.overview,
      this.releaseDate});

  Movie.fromJson(Map<String, dynamic> json) {
    voteCount = json['vote_count'];
    posterPath = json['poster_path'];
    id = json['id'];
    backdropPath = json['backdrop_path'];
    title = json['title'];
    voteAverage = json['vote_average'] is int
        ? (json['vote_average'] as int).toDouble()
        : json['vote_average'];
    overview = json['overview'];
    releaseDate = json['release_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['vote_count'] = this.voteCount;
    data['vote_average'] = this.voteAverage;
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    data['poster_path'] = this.posterPath;
    data['backdrop_path'] = this.backdropPath;
    return data;
  }
}
