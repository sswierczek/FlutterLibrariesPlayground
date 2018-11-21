import 'package:flutter_libraries_playground/movies/model/movie.dart.dart';
import 'package:flutter_libraries_playground/movies/model/movies_repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc {
  Observable<List<Movie>> get movies => _moviesFetcher.stream;

  final MoviesRepository _moviesRepository;
  final _moviesFetcher = BehaviorSubject<List<Movie>>();

  MoviesBloc(this._moviesRepository);

  void fetch() async {
    List<Movie> movies = await _moviesRepository.fetchMovies();
    _moviesFetcher.sink.add(movies);
  }
}