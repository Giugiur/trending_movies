import 'package:flutter/material.dart';
import 'movie.dart';

class MovieTile extends StatelessWidget {
  MovieTile(
    this._movie
  );

  final Movie _movie;

  @override
  Widget build(BuildContext context) {
    //TODO: add inkwell, tap and navigate to movie detail
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 30,
            child: Hero(
              tag: _movie.id,
              child: Image.network(
                'https://image.tmdb.org/t/p/w500/${_movie.image}',
                height: 150,
                fit: BoxFit.contain
              ),
            )
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
