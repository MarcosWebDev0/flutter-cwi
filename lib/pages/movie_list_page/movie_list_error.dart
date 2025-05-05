import 'package:flutter/material.dart';

class MovieListError extends StatelessWidget {
  const MovieListError({
    required this.message,
    super.key
  });
  final String message;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, size: 50, color: Colors.red),
            const SizedBox(height: 8),
            Text(message,
                style: const TextStyle(color: Colors.red,)
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}