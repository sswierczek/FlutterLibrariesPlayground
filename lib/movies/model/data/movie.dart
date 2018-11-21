import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable(nullable: true)
class MoviesResponse {
  @JsonKey(name: "results")
  final List<Movie> movies;

  MoviesResponse({this.movies});

  factory MoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$MoviesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesResponseToJson(this);
}

@JsonSerializable(nullable: true)
class Movie {
  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'poster_path')
  final String posterPath;

  Movie({this.title, this.posterPath});

  String imagePath() {
    return "https://image.tmdb.org/t/p/w500$posterPath";
  }

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
