import 'dart:convert';

import 'package:cine_flutter/modules/movies/domain/models/movie.dart';
import 'package:flutter/services.dart';

class MovieRepository {
  static Future<List<Movie>> getAll() async {
    final String response = await rootBundle.loadString('data/movies.json');
    final list = await json.decode(response) as List<dynamic>;

    return list.map((e) => Movie.fromMap(e)).toList();
  }
}
