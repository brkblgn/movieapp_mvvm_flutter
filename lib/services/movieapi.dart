import 'dart:convert';
import 'package:movieapp_mvvm_flutter/model/movie.dart';
import 'package:http/http.dart' as http;

class MovieApi {
  Future<List<Movie>> fetchMovies(String keyword) async {
    final url = Uri.parse("http://www.omdbapi.com/?s=$keyword&apikey=eb0d5538");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      if (body["Search"] != null) {
        final Iterable json = body["Search"];
        return json.map((e) => Movie.fromJson(e)).toList();
      } else {
        return [];
      }
    } else {
      throw Exception("Request Failed");
    }
  }
}
