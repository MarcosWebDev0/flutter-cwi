import 'package:filme_flix/pages/movie_list_page/movie_card.dart';
import 'package:filme_flix/pages/movie_list_page/movie_list_error.dart';
import 'package:filme_flix/repositories/movie_repository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late MovieRepository movieRepository;
  List movies = [];

  @override
  void initState() {
    movieRepository = MovieRepository();
    super.initState();
  }

  // Future<void> getMovies() async {
  //   final moviesDb = await movieRepository.getSavedMovies();
  //   if (moviesDb.isNotEmpty) {
  //     setState(() {
  //       movies = moviesDb;
  //     });
  //   }

  //   final moviesApi = await movieRepository.getMovies();
  //   if (moviesApi.isNotEmpty) {
  //     setState(() {
  //       movies = moviesApi;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
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
        FutureBuilder(
          future: movieRepository.getMovies(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError || snapshot.data == null || snapshot.data!.isEmpty) {
              return const Center(
                child: MovieListError(message: 'Failed to load movies'),
              );
            }

            final movies = snapshot.data ?? [];

            return SizedBox(
              height: 180,
              child:
                ListView.builder(
                  itemCount: movies.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return MovieCard(movie: movies[index]);
                  },
                ),
            );
          }
        ),
      ],
    );
  }
}