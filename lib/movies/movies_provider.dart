import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'movie.dart';
import '../utils/keys.dart';

class Movies with ChangeNotifier {

  Future<List<Movie>> fetchMovies() async {
    final url = Uri.parse('https://api.themoviedb.org/3/trending/all/day?api_key=$API_KEY');
    try {
      final response = await http.get(url);
      print(response.body);
      return [];
    } catch (error) {
      throw error;
    }
  }
}