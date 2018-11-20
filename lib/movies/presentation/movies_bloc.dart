import 'package:flutter_libraries_playground/movies/model/movie.dart.dart';
import 'package:flutter_libraries_playground/movies/model/movies_repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc {
  final _moviesRepository = MoviesRepository(); // TODO DI
  final _moviesFetcher = BehaviorSubject<List<Movie>>();

  Observable<List<Movie>> get movies => _moviesFetcher.stream;

  void fetch() async {
    List<Movie> movies = await _moviesRepository.fetchMovies();
    _moviesFetcher.sink.add(movies);
  }
}
