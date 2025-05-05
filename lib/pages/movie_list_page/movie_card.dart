import 'package:filme_flix/components/models/movie.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({required this.movie, super.key});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final String path = 'https://image.tmdb.org/t/p/w500/${movie.imagePath}';
    return Container(
      padding: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Image.network(
        path,
        errorBuilder: (context, error, stackTrace) => Container(
          color: Colors.grey,
        ),
        fit: BoxFit.cover,
        height: 180,
        width: 120,
      )
    );
  }
}