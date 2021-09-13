import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'movie.dart';
import '../utils/constants.dart';


class MovieDetail extends StatelessWidget {
  static const routeName = '/movie_detail';

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        height: deviceSize.height-50,
        child: ListView(
          shrinkWrap: true,
          children: [
            Hero(
              tag: movie.id,
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: BASE_IMG_URL + movie.image,
                fit: BoxFit.contain,
                height: 400,
              ),
            ),
            const SizedBox(height: 20,),
            Text(
              'Release Date: ${movie.releaseDate}',
              textAlign: TextAlign.center
            ),
          ],
        ),
      )
    );
  }
}
