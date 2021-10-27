import 'package:flutter/material.dart';

class Movie {
  final String title;
  final String genre;
  final bool isWatched;
  final DateTime date;

  const Movie({
    required this.title,
    required this.genre,
    required this.isWatched,
    required this.date,
  });

  factory Movie.fromMap(Map<String, dynamic> map) {
    final properties = map['properties'] as Map<String, dynamic>;
    final dateStr = properties['Date']?['date']?['start'];

    return Movie(
      title: properties['Title']?['title']?[0]?['plain_text'] ?? '?',
      genre: properties['Genre']?['multi_select']?[0]?['name'] ?? '?',
      isWatched: properties['Watched']?['checkbox'] ?? false,
      date: dateStr != null ? DateTime.parse(dateStr) : DateTime.now(),
    );
  }
}


Color getGenreColor(String genre) {
  switch(genre) {
    case 'Comedy':
      return Colors.yellow[400]!;
    case 'Horror':
      return Colors.red[400]!;
    case 'Drama':
      return Colors.blue[400]!;
    case 'Action':
      return Colors.green[400]!;
    case 'Thriller':
      return Colors.lime[400]!;
    case 'Documentary':
      return Colors.brown[400]!;
    case 'War':
      return Colors.purple[400]!;
    default:
      return Colors.orange[400]!;
  }
  
}
