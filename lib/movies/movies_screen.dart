import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'movie.dart';
import 'movie_tile.dart';
import 'movies_provider.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  List<Movie> _movies = [];
  final ScrollController _scrollController = ScrollController();

  void _addMoreMovies() async {
    var moviesProvider = Provider.of<Movies>(context, listen: false);
    if (moviesProvider.currentPage < moviesProvider.maxPages) {
      moviesProvider.fetchMovies().then((response) {
        setState(() {
          _movies.addAll(response);
        });
      }).catchError((error) {
        //TODO: Handle error
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _addMoreMovies();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _addMoreMovies();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var moviesProvider = Provider.of<Movies>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Trending Movies'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          shrinkWrap: true,
          controller: _scrollController,
          itemBuilder: (ctx, index) => Container(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 0),
            child: index == _movies.length && moviesProvider.currentPage < moviesProvider.maxPages
              ? const Center(child: CircularProgressIndicator(),)
              : MovieTile(_movies[index])
          ),
          itemCount: _movies.length + 1,
        ),
      ),
    );
  }
}
