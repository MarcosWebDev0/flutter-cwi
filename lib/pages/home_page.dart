import 'package:filme_flix/components/controller/home_controller.dart';
import 'package:filme_flix/components/controller/home_state.dart';
import 'package:filme_flix/pages/movie_list_page/movie_card.dart';
import 'package:filme_flix/pages/movie_list_page/movie_list_error.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController controller;

  @override
  void initState() {
    super.initState();
    controller = HomeController();
    controller.getMovies();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
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
          ValueListenableBuilder(
            valueListenable: controller,
            builder: (ctx, state, _) {
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