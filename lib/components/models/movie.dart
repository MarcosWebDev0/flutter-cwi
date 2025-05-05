import 'dart:convert';

class Movie {
 final int id;
 final String title;
 final String imagePath;

  Movie({
    required this.id,
    required this.title,
    required this.imagePath,
  }); 

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] as int,
      title: json['title'] as String,
      imagePath: json['poster_path'] as String,
    );
  }

  String get toJson => jsonEncode({
    'id': id,
    'title': title,
    'poster_path': imagePath,
  });
}