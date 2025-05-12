import 'package:filme_flix/components/models/movie.dart';

sealed class HomeState {}

class HomeInitial extends HomeState {}

class HomeSuccess extends HomeState {
  final List<Movie> movies;

  HomeSuccess(this.movies);
}

class HomeLoading extends HomeState {}

class HomeError extends HomeState {
  final String errorMessage;

  HomeError(this.errorMessage);
}

class HomeEmpty extends HomeState {}