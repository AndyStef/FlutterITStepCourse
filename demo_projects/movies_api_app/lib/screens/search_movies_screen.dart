import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../services/movies_api_manager.dart';

class SearchMoviesScreen extends StatefulWidget {
  @override
  _SearchMoviesScreenState createState() => _SearchMoviesScreenState();
}

class _SearchMoviesScreenState extends State<SearchMoviesScreen> {
  var moviesService = MoviesApiService();
  var query = '';
  var textFieldController = TextEditingController();
  List<Movie> movies = [];
  var isLoading = false;

  void _searchMovies() async {
    setState(() {
      movies = [];
      isLoading = true;
    });

    try {
      var results = await moviesService.searchMovies(query);
      setState(() {
        isLoading = false;
        movies.addAll(results);
      });
    } on DioError catch (e) {
      setState(() {
        isLoading = false;
      });
      showErrorMessage(e);
    }
  }

  void showErrorMessage(DioError error) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: Text('Something went wrong'),
            content: Text(error.message),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Okay'),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : Column(
            children: [
              buildSearchBar(),
              moviesList(),
            ],
          );
  }

  Widget moviesList() {
    if (movies.isNotEmpty) {
      return Flexible(child: _buildGridView());
    } else {
      return const Expanded(
        child: Center(
          child: Text('Search for some movies'),
        ),
      );
    }
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
