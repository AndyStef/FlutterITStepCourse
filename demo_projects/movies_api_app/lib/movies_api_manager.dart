import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:movies_api_app/movie.dart';

class MoviesApiService {
  final _apiKey = 'ce3cd8066ffeb2051aff2fbe418b11b8';
  final _dio = Dio();

  MoviesApiService() {
    _dio.options.baseUrl = 'https://api.themoviedb.org/3';
  }

  Future<List<Movie>> getPopularMovies() async {
    final response = await _dio.get(
      '/movie/popular',
      queryParameters: {
        'api_key': _apiKey,
        'language': 'en-US',
        'page': 1,
      },
    );

    final results = List<Map<String, dynamic>>.from(response.data['results']);
    List<Movie> movies =
        results.map((movieData) => Movie.fromJson(movieData)).toList(growable: false);
    return movies;
  }

  Future<List<Movie>> searchMovies(String query) async {
    final response = await _dio.get(
        'https://api.themoviedb.org/3/search/movie?api_key=ce3cd8066ffeb2051aff2fbe418b11b8&language=en-US&query=$query&page=1&include_adult=false');

    final results = List<Map<String, dynamic>>.from(response.data['results']);
    List<Movie> movies =
        results.map((movieData) => Movie.fromJson(movieData)).toList(growable: false);
    return movies;
  }
}
