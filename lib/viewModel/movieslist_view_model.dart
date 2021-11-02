import 'package:flutter/material.dart';
import 'package:movieapp_mvvm_flutter/services/movieapi.dart';
import 'package:movieapp_mvvm_flutter/viewModel/movie_view_model.dart';

class MovieListViewModel extends ChangeNotifier {
  List<MovieViewModel> movies = <MovieViewModel>[];
  Future<void> fetchMovies(String keyword) async {
    final results = await MovieApi().fetchMovies(keyword);
    movies = results.map((item) => MovieViewModel(movie: item)).toList();
    notifyListeners();
  }
}
