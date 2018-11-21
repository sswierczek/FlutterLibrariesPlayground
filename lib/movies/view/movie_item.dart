import 'package:flutter_libraries_playground/movies/model/data/movie.dart';

class MovieItem {
  final String name;
  final String thumbUrl;

  MovieItem({this.name, this.thumbUrl});
}

MovieItem fromMovie(Movie movie) {
  return MovieItem(name: movie.title, thumbUrl: movie.imagePath());
}
