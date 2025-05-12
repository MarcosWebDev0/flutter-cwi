import 'dart:async';
import 'dart:developer';

import 'package:filme_flix/components/bloc/home_bloc.dart';
import 'package:filme_flix/components/bloc/home_event.dart';
import 'package:filme_flix/components/bloc/home_state.dart';
import 'package:filme_flix/pages/movie_list_page/movie_card.dart';
import 'package:filme_flix/pages/movie_list_page/movie_list_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc homeBloc;
  late StreamSubscription<HomeState> homeStateSubscription;

  @override
  void initState() {
    super.initState();
    
    homeBloc = HomeBloc();
    homeStateSubscription = homeBloc.stream.listen(stateListener);
    homeBloc.add(GetMoviesEvent());
  }

  @override
  void dispose() {
    super.dispose();
    homeStateSubscription.cancel();
    homeBloc.close();
  }

  void stateListener(HomeState state) {
    if (state is HomeLoading) {
      log('Loading movies...:');
    } else if (state is HomeSuccess) {
      log('Movies loaded successfully: ${state.movies.length} movies found. ${state.movies}');
    } else if (state is HomeError) {
      log('Error loading movies: ${state.errorMessage}');
    } else if (state is HomeEmpty) {
      log('No movies found');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/home.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.5,
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Popular Movies',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            )
          ),
          BlocBuilder<HomeBloc, HomeState>(
            bloc: homeBloc,
            builder: (ctx, state) {
              return switch (state) {
                HomeLoading() => const Center(child: CircularProgressIndicator()),
                HomeError() => const Center(
                  child: MovieListError(message: 'Failed to load movies'),
                ),
                HomeEmpty() => const Center(
                  child: MovieListError(message: 'No movies found'),
                ),
                HomeSuccess() => SizedBox(
                height: 180,
                child:
                  ListView.builder(
                    itemCount: state.movies.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      return MovieCard(movie: state.movies[index]);
                    },
                  ),
                ),
                _ => const SizedBox.shrink(),
              };
            }
          ),
        ],
      ),
    );
  }
}