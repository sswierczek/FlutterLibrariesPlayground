import 'package:flutter_libraries_playground/movies/model/data/movie.dart';
import 'package:flutter_libraries_playground/movies/model/data/movie_response.dart';
import 'package:flutter_libraries_playground/network/network_client.dart';

class MoviesRepository {
  final NetworkClient _client;

  MoviesRepository(this._client);

  Future<List<Movie>> fetchMovies() async {
    String responseJson = await _client.fetchSampleMovies();
    return MoviesResponse.fromJsonString(responseJson).movies;
  }
}
