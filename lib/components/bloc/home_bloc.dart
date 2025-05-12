import 'package:filme_flix/components/bloc/home_event.dart';
import 'package:filme_flix/components/bloc/home_state.dart';
import 'package:filme_flix/components/models/movie.dart';
import 'package:filme_flix/repositories/movie_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<GetMoviesEvent>(_fetchMovies);
  }

  MovieRepository movieRepository = MovieRepository();

  Future<void> _fetchMovies(
    GetMoviesEvent event,
    Emitter<HomeState> emit,
    ) async {
    
    emit(HomeLoading());
    List<Movie> movies = [];
    try {
      movies = await movieRepository.getSavedMovies();
      if (movies.isEmpty) {
        movies = await movieRepository.getMovies();
      }
      emit(HomeSuccess(movies));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}