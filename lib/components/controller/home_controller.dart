import 'package:filme_flix/components/controller/home_state.dart';
import 'package:filme_flix/components/models/movie.dart';
import 'package:filme_flix/repositories/movie_repository.dart';
import 'package:flutter/material.dart';

class HomeController extends ValueNotifier<HomeState> {
  HomeController() : super(HomeInitial());

  MovieRepository movieRepository = MovieRepository();

  Future<void> getMovies() async {
    value = HomeLoading();
    List<Movie> movies = [];
    try {
      movies = await movieRepository.getSavedMovies();
      if (movies.isEmpty) {
        movies = await movieRepository.getMovies();
      }
      value = HomeSuccess(movies);
    } catch (e) {
      value = HomeError(e.toString());
    }
  }
}