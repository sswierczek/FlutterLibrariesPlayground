import 'package:flutter_libraries_playground/movies/model/movie.dart.dart';

class MovieItem {
  final String name;
  final String thumbUrl;

  MovieItem({this.name, this.thumbUrl});
}

MovieItem fromMovie(Movie movie) {
  return MovieItem(name: movie.title, thumbUrl: "");
}