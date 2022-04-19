import 'package:flutter/material.dart';

import '../models/movie.dart';
import '../services/movies_api_manager.dart';

class PopularMoviesListScreen extends StatefulWidget {
  @override
  _PopularMoviesListScreenState createState() => _PopularMoviesListScreenState();
}

class _PopularMoviesListScreenState extends State<PopularMoviesListScreen>
    with AutomaticKeepAliveClientMixin<PopularMoviesListScreen> {
  @override
  get wantKeepAlive => true;

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
    return _buildGridView();
  }

  GridView _buildGridView() {
    return GridView.count(
      childAspectRatio: 0.68,
      crossAxisCount: 2,
      padding: const EdgeInsets.all(4.0),
      children: movies.map((movie) {
        return MovieGridCell(movie: movie);
      }).toList(),
    );
  }
}

class MovieGridCell extends StatelessWidget {
  const MovieGridCell({
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
