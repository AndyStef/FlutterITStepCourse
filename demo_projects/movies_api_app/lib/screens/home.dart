import 'package:flutter/material.dart';
import 'package:movies_api_app/screens/future_list_builder.dart';
import 'package:movies_api_app/screens/popular_movies.dart';
import 'package:movies_api_app/screens/search_movies_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          bottomNavigationBar: buildBottomTabs(),
          appBar: AppBar(
            title: const Text('Movies App'),
            backgroundColor: Colors.pink,
          ),
          body: TabBarView(
            children: [
              PopularMoviesListScreen(),
              SearchMoviesScreen(),
              FutureBuilderMoviesScreen(),
            ],
          )),
    );
  }

  Container buildBottomTabs() {
    return Container(
      color: Colors.pink,
      child: const TabBar(
        indicator: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.black,
              width: 7.0,
            ),
          ),
        ),
        padding: EdgeInsets.only(bottom: 8.0),
        indicatorWeight: 5.0,
        indicatorColor: Colors.black,
        tabs: [
          Tab(
            icon: Icon(Icons.star),
            text: 'Popular',
          ),
          Tab(
            icon: Icon(Icons.search),
            text: 'Search',
          ),
          Tab(
            icon: Icon(Icons.free_breakfast_rounded),
            text: 'Future Builder',
          ),
        ],
      ),
    );
  }
}
