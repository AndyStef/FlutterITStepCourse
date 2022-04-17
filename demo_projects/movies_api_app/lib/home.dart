import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movies_api_app/movie.dart';
import 'package:movies_api_app/movies_api_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var moviesServies = MoviesApiService();
  var counter = 0;
  List<Movie> movies = [];

  @override
  void initState() {
    super.initState();
    print('Init method');
    _loadMovies();
  }

  void _loadMovies() async {
    // Network request
    var popularMovies = await moviesServies.getPopularMovies();

    setState(() {
      movies.addAll(popularMovies);
    });

    print('Movies are here');
  }

  @override
  Widget build(BuildContext context) {
    print('Build method');
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies App $counter'),
      ),
      body: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            var movie = movies[index];
            return Column(
              children: [
                Image.network(movie.fullImageUrl),
                Text(movie.name),
              ],
            );
          }),
    );
  }
}
