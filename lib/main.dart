import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trending_movies/movies/movie_detail.dart';
import '../movies/movies_screen.dart';
import '../movies/movies_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Movies(),
      child: MaterialApp(
        title: 'Trending Movies',
        theme: ThemeData(
          primarySwatch: Colors.amber,
          brightness: Brightness.dark,
        ),
        home: MoviesScreen(),
        routes: {
          MovieDetail.routeName: (ctx) => MovieDetail(),
        }
      ),
    );
  }
}