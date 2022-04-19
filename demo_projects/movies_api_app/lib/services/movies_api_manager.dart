import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:movies_api_app/models/movie.dart';

class MoviesApiService {
  final _apiKey = 'ce3cd8066ffeb2051aff2fbe418b11b8';
  final _dio = Dio();

  MoviesApiService() {
    _dio.options.baseUrl = 'https://api.themoviedb.org/3';
    _dio.options.queryParameters = {
      'api_key': _apiKey,
      'language': 'en-US',
    };
  }

  Future<List<Movie>> getPopularMovies() async {
    final response = await _dio.get(
      '/movie/popular',
      queryParameters: {
        'page': 1,
      },
    );

    return parseMovies(response);
  }

  Future<List<Movie>> searchMovies(String query) async {
    final response = await _dio.get(
      '/search/movie',
      queryParameters: {
        'query': query,
        'page': 1,
      },
    );

    return parseMovies(response);
  }

  List<Movie> parseMovies(dynamic response) {
    final results = List<Map<String, dynamic>>.from(response.data['results']);
    List<Movie> movies =
        results.map((movieData) => Movie.fromJson(movieData)).toList(growable: false);
    return movies;
  }
}
