import 'package:flutter_libraries_playground/movies/model/data/movie.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'movie_response.g.dart';

@JsonSerializable()
class MoviesResponse {
  @JsonKey(name: "results")
  final List<Movie> movies;

  MoviesResponse(this.movies);

  factory MoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$MoviesResponseFromJson(json);

  factory MoviesResponse.fromJsonString(String jsonString) =>
      MoviesResponse.fromJson(json.decode(jsonString));

  Map<String, dynamic> toJson() => _$MoviesResponseToJson(this);
}
