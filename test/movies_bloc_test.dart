import 'package:flutter_libraries_playground/movies/model/data/movie.dart';
import 'package:flutter_libraries_playground/movies/presentation/movies_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'mocks.dart';

void main() {
  final repository = MockMoviesRepository();
  final tested = MoviesBloc(repository);
  final testMovies = [Movie(title: "testMovie"), Movie(title: "testMovie")];

  group('When fetching movies List Middleware', () {
    test("should push them to sink", () async {
      when(repository.fetchMovies()).thenAnswer((_) => Future.value(testMovies));

      tested.fetch();

      expectLater(tested.movies, emitsInAnyOrder([testMovies]));
    });
  });
}
