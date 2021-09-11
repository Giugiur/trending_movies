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
  static const routeName = '/movies';
  List<Movie> _movies = [];
  bool _isLoading = false;

  @override
  void didChangeDependencies () {
    super.didChangeDependencies();
    if (_movies.isEmpty) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Movies>(context, listen: false).fetchMovies().then((response) {
        setState(() {
          _movies = response;
        });
      }).catchError((error) {
        //TODO: Handle error
      }).whenComplete(() => setState(() {
        _isLoading = false;
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trending Movies')
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: _isLoading ? const Center(child: CircularProgressIndicator(),)
        : SingleChildScrollView(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (ctx, index) => Container(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 0),
              child: MovieTile(_movies[index])
            ),
            itemCount: _movies.length,
          ),
        )
        ,
      ),
    );
  }
}
