class Movie {

  Movie({
    required this.id,
    required this.title,
    required this.image,
    required this.overview,
    required this.releaseDate,
    required this.rating,
  });

  final int id;
  final String title;
  final String image;
  final String overview;
  final String releaseDate;
  final double rating;
}