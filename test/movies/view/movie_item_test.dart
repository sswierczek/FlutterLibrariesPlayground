import 'package:flutter_libraries_playground/movies/model/data/movie.dart';
import 'package:flutter_libraries_playground/movies/view/movie_item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final movie = Movie(title: "some title", posterPath: "/path");

  group('When creating from Movie', () {
    test("should push them to sink", () {
      MovieItem item = MovieItem.fromMovie(movie);

      expect(item, MovieItem(
              name: "some title",
              thumbUrl: "https://image.tmdb.org/t/p/w500/path"));
    });
  });
}
