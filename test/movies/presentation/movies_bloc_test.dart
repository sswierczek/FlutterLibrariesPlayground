import 'package:flutter_libraries_playground/movies/model/data/movie.dart';
import 'package:flutter_libraries_playground/movies/model/data/movie_response.dart';
import 'package:flutter_libraries_playground/movies/model/movies_repository.dart';
import 'package:flutter_libraries_playground/movies/presentation/movies_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mocks.dart';

void main() {
  final networkClient = MockNetworkClient();
  final repository = MoviesRepository(networkClient);
  final tested = MoviesBloc(repository);
  final movies = [Movie(title: "testMovie"), Movie(title: "testMovie2")];
  final responseJson = MoviesResponse(movies).toJsonString();

  group('When fetching movies', () {
    test("should push them to sink", () async {
      when(networkClient.fetchSampleMovies()).thenAnswer((_) => Future.value(responseJson));

      tested.fetch();

      expectLater(tested.movies, emitsInAnyOrder([movies]));
    });
  });
}
