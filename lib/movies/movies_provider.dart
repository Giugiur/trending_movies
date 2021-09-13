import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:trending_movies/utils/constants.dart';
import 'movie.dart';
import '../utils/helpers.dart';
import '../utils/keys.dart';

class Movies with ChangeNotifier {

  int _page = 1;

  Future<List<Movie>> fetchMovies() async {
    final url = Uri.parse(BASE_API_URL + API_KEY +'&page=$_page');
    List<Movie> movies = [];
    try {
      final response = await http.get(url);
      final Map<String, dynamic> extractedData = json.decode(response.body);
      extractedData['results'].forEach((value) {
        movies.add(buildMovie(value));
      });
      _page++;
      return movies;
    } catch (error) {
      throw Exception('Failed to fetch movies');
    }
  }
}