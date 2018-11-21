import 'package:flutter_libraries_playground/movies/model/data/movie.dart';

class MoviesRepository {

  // TODO Fetch from server
  Future<List<Movie>> fetchMovies() async {
    return [
      Movie(title: 'Movie 1'),
      Movie(title: 'Movie 2'),
      Movie(title: 'Movie 3'),
    ];
  }
}