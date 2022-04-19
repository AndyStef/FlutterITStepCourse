import 'package:flutter/material.dart';

import '../models/movie.dart';
import '../services/movies_api_manager.dart';

class FutureBuilderMoviesScreen extends StatefulWidget {
  @override
  _FutureBuilderMoviesScreenState createState() => _FutureBuilderMoviesScreenState();
}

class _FutureBuilderMoviesScreenState extends State<FutureBuilderMoviesScreen> {
  var moviesService = MoviesApiService();
  var query = '';
  var textFieldController = TextEditingController();
  late Future<List<Movie>> movies;

  void _searchMovies() {
    setState(() {
      movies = moviesService.searchMovies(query);
    });
  }

  @override
  void initState() {
    super.initState();
    _searchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildSearchBar(),
        FutureBuilder<List<Movie>>(
          future: movies,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Flexible(child: _buildGridView(snapshot.data ?? []));
            } else if (snapshot.hasError) {
              return Expanded(child: Container(color: Colors.red));
            }

            return Expanded(child: Center(child: CircularProgressIndicator()));
          },
        ),
        // Flexible(child: _buildGridView()),
      ],
    );
  }

  GridView _buildGridView(List<Movie> movies) {
    return GridView.count(
      childAspectRatio: 0.68,
      crossAxisCount: 2,
      padding: const EdgeInsets.all(4.0),
      children: movies.map((movie) {
        return MovieGridCell(movie: movie);
      }).toList(),
    );
  }

  Row buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: textFieldController,
              onChanged: (query) {
                this.query = query;
                print(query);
              },
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            _searchMovies();
          },
          child: const Text('Search'),
        ),
        IconButton(
            onPressed: () {
              query = '';
              textFieldController.clear();
            },
            icon: const Icon(Icons.cancel))
      ],
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
