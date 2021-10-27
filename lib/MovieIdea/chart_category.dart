import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'movie_model.dart';

class ChartGenre extends StatelessWidget {
  final List<Movie> movies;

  const ChartGenre({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final genres = <String, double>{};

    for (var movie in movies) {
      genres.update(
        movie.genre, 
        (value) => value + 1,
        ifAbsent: () => 1
      );
    }

    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 360,
        child: Column(
          children: [
            Expanded(
              child: PieChart(
                PieChartData(
                  sections: genres.map((genre, totalMoviesWithGenre) => MapEntry(
                    genre, 
                    PieChartSectionData(
                      color: getGenreColor(genre),
                      radius: 100,
                      title: totalMoviesWithGenre.toString(),
                      value: totalMoviesWithGenre,
                      ),
                    )).values
                    .toList(),
                    sectionsSpace: 0
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: genres.keys.map((genre) => _Indicator(
                color: getGenreColor(genre),
                text: genre
               )).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _Indicator extends StatelessWidget {
  final Color color;
  final String text;

  const _Indicator({
    Key? key, 
    required this.color, 
    required this.text
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 16,
          width: 16,
          color: color,
        ),
        const SizedBox(width: 4,),
        Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}