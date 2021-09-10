import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../movies/movies_screen.dart';
import '../movies/movies_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Movies()),
      ],
      child: MaterialApp(
        title: 'Trending Movies',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
          brightness: Brightness.dark
        ),
        home: MoviesScreen(),
      ),
    );
  }
}