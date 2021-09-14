// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:trending_movies/main.dart';
import 'package:trending_movies/movies/movie.dart';
import 'package:trending_movies/movies/movies_provider.dart';
import 'widget_test.mocks.dart';

@GenerateMocks([Movies])
void main() {
  group('Testing Movies Provider', () {
    var moviesProvider = Movies();

    test('Increase the current page', () async {
      expect(moviesProvider.currentPage, 1);
      await moviesProvider.fetchMovies();
      expect(moviesProvider.currentPage, 2);
    });

    test('Set the max pages', () async {
      await moviesProvider.fetchMovies();
      expect(moviesProvider.currentPage, isNot(null));
    });

    test('Add movies to the list', () async {
      var mock = MockMovies();
      when(mock.fetchMovies())
        .thenAnswer((_) async => [
          Movie(
            id: 1,
            title: 'Foo',
            image: '/some_string.jpg',
            overview: 'Overview 1',
            releaseDate: 'Some release date',
            rating: 5
          ),
          Movie(
              id: 2,
              title: 'Bar',
              image: '/some_other_string.jpg',
              overview: 'Overview 2',
              releaseDate: 'Some other release date',
              rating: 6
          )
        ]);
      List<Movie> movies = [];
      movies.addAll(await mock.fetchMovies());
      expect(movies.length, 2);
    });

  });
}
