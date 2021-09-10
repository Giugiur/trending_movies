import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'movie.dart';
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
        _movies = response;
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
        padding: const EdgeInsets.all(20),
        child: _isLoading ? const Center(child: CircularProgressIndicator(),) : const Text('Hello'),
      ),
    );
  }
}
