import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'movie.dart';
import 'movie_tile.dart';
import 'movies_provider.dart';

class MoviesScreen extends StatefulWidget {
  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  List<Movie> _movies = [];
  final ScrollController _scrollController = ScrollController();

  void _addMoreMovies() async {
    //TODO: Don't make the request if we are standing on the last page
    Provider.of<Movies>(context, listen: false).fetchMovies().then((response) {
      setState(() {
        _movies.addAll(response);
      });
    }).catchError((error) {
      //TODO: Handle error
    });
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
            child: index == _movies.length //TODO: && we are not standing on last page
              ? const Center(child: CircularProgressIndicator(),)
              : MovieTile(_movies[index])
          ),
          itemCount: _movies.length + 1,
        ),
      ),
    );
  }
}
