import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie.dart';

class ApiService {
  static const String _apiKey = 'bf7e5253545ca26c0f419676c50af925';
  static const String _baseUrl = 'https://api.themoviedb.org/3/search/movie';

  static Future<List<Movie>> fetchMovies(String query) async {
    final response = await http.get(
      Uri.parse('$_baseUrl?api_key=$_apiKey&query=$query'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<Movie> movies = (data['results'] as List<dynamic>)
          .map((json) => Movie.fromJson(json))
          .toList();
      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
