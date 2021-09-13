import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:trending_movies/movies/movie_detail.dart';
import '../utils/constants.dart';
import 'movie.dart';

class MovieTile extends StatelessWidget {
  const MovieTile(
    this._movie, {Key? key}
  ) : super(key: key);

  final Movie _movie;

  void _navigateToMovieDetail(context) {
    Navigator.of(context).pushNamed(MovieDetail.routeName, arguments: _movie);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _navigateToMovieDetail(context),
      child: Row(
        children: [
          Expanded(
            flex: 30,
            child: Hero(
              tag: _movie.id,
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: BASE_IMG_URL + _movie.image,
                height: 150,
                fit: BoxFit.cover
              ),
            ),
          ),
          Expanded(
            flex: 70,
            child: ListTile(
              title: Text(
                _movie.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              subtitle: Container(
                child: Text(
                  _movie.overview,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 6,
                ),
              ),
              trailing: const Icon(Icons.chevron_right),
            )
          ),
        ],
      ),
    );
  }
}
