import 'package:flutter_libraries_playground/movies/model/data/movie.dart';

class MovieItem {
  final String name;
  final String thumbUrl;

  MovieItem({this.name, this.thumbUrl});

  factory MovieItem.fromMovie(Movie movie) {
    return MovieItem(name: movie.title, thumbUrl: movie.imagePath());
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieItem &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          thumbUrl == other.thumbUrl;

  @override
  int get hashCode => name.hashCode ^ thumbUrl.hashCode;
}
