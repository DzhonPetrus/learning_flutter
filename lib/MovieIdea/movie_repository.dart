import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'failure_model.dart';
import 'movie_model.dart';

class MovieRepository {
  final http.Client _client;
  final _baseURL = 'https://api.notion.com/v1/';

  MovieRepository({http.Client? client}) : _client = client ?? http.Client();

  void dispose() {
    _client.close();
  }

  Future<List<Movie>> getMovies() async {
    const NOTION_API_KEY='secret_9s3yX2I72QmtjedDPeRoGUrSBAfbsGiepSDbmNuY5jS';
    const NOTION_DATABASE_ID='1bb09d4d2b7642bb922d344a2807bf0b';

    try{
      final url = '${_baseURL}databases/$NOTION_DATABASE_ID/query';
      final response = await _client.post(
        Uri.parse(url),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $NOTION_API_KEY',
          'Notion-Version': '2021-08-16',
        },
      );

      if(response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        return (data['results'] as List).map((e) => Movie.fromMap(e)).toList()
          ..sort((a,b) => b.date.compareTo(a.date));
      } else {
        throw const Failure(message: 'Something went wrong!');
      }

    } catch (_) {
        throw const Failure(message: 'Something went wrong!');
    }
  }
}