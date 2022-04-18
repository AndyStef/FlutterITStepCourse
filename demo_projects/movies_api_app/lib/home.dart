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
  var moviesService = MoviesApiService();
  var counter = 0;
  List<Movie> movies = [];

  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  void _loadMovies() async {
    var popularMovies = await moviesService.getPopularMovies();
    setState(() {
      movies.addAll(popularMovies);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies App'),
        backgroundColor: Colors.pink,
      ),
      body: _buildGridView(),
    );
  }

  GridView _buildGridView() {
    return GridView.count(
      childAspectRatio: 0.68,
      crossAxisCount: 2,
      padding: const EdgeInsets.all(4.0),
      children: movies.map((movie) {
        return _MovieGridCell(movie: movie);
      }).toList(),
    );
  }
}

class _MovieGridCell extends StatelessWidget {
  const _MovieGridCell({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          clipBehavior: Clip.hardEdge,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
          elevation: 8.0,
          child: Image.network(movie.fullImageUrl),
        ),
      ],
    );
  }
}
