import 'package:intl/intl.dart';
import '../movies/movie.dart';

Movie buildMovie(movie) {
  return Movie(
    id: movie['id'],
    title: movie['title'],
    image: movie['poster_path'],
    overview: movie['overview'],
    releaseDate: DateFormat.yMMMMd('en_US').format(DateTime.parse(movie['release_date']))
  );
}