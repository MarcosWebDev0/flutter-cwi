import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:filme_flix/components/client/dio_client.dart';
import 'package:filme_flix/components/constants/client_paths.dart';
import 'package:filme_flix/components/models/movie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MovieRepository {
  
  final Dio client = DioClient.dio;

  SharedPreferences? _prefs;
  
  final String key = 'movies';

  FutureOr<SharedPreferences> get prefs async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }

  Future<List<Movie>> getMovies() async {
    final moviesDb = await getSavedMovies();
    if (moviesDb.isNotEmpty) {
      return moviesDb;
    }
    final response = await client.get(ClientPaths.popularMovies, queryParameters: {
      'page': 1,
    });

    final movies = (response.data['results'] as List)
        .map<Movie>((movie) => Movie.fromJson(movie))
        .toList();

    final db = await prefs;

    db.setStringList(key, movies.map((movie) => movie.toJson).toList());
    return movies;
  }

  Future<List<Movie>> getSavedMovies() async {
    final db = await prefs;
    final movies = db.getStringList(key);
    if (movies == null || movies.isEmpty) {
      return [];
    }
    return movies.map((movie) => Movie.fromJson(jsonDecode(movie))).toList();
  }
}