import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'movie.dart';
import '../utils/helpers.dart';
import '../utils/keys.dart';

class Movies with ChangeNotifier {

  Future<List<Movie>> fetchMovies() async {
    final url = Uri.parse('https://api.themoviedb.org/3/trending/movie/week?api_key=$API_KEY');
    List<Movie> movies = [];
    try {
      final response = await http.get(url);
      final Map<String, dynamic> extractedData = json.decode(response.body);
      //TODO: make infinite scroll through extractedData['page']
      extractedData['results'].forEach((value) {
        movies.add(buildMovie(value));
      });
      return movies;
    } catch (error) {
      throw error;
    }
  }
}