import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../services/api_service.dart';

class MovieProvider with ChangeNotifier {
  List<Movie> _movies = [];
  List<Movie> get movies => _movies;

  void searchMovies(String query) async {
    _movies = await ApiService.fetchMovies(query);
    notifyListeners();
  }
}
