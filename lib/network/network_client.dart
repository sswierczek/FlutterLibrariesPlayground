import 'package:dio/dio.dart';
import 'package:flutter_libraries_playground/network/api_config.dart';

const TIMEOUT_IN_SECONDS = 5000;

class NetworkClient {
  final ApiConfig _apiConfig;
  final _dio = Dio();

  NetworkClient(this._apiConfig) {
    _dio.options.baseUrl = _apiConfig.baseUrl;
    _dio.options.connectTimeout = TIMEOUT_IN_SECONDS;
  }

  Future<Response<String>> fetchSampleMovies() async {
    return await _dio.get("/sample_movies.json");
  }
}
