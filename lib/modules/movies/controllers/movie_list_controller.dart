import 'package:cine_flutter/modules/movies/domain/models/movie.dart';
import 'package:cine_flutter/modules/movies/domain/repository/movie_repository.dart';
import 'package:flutter/cupertino.dart';

class MovieListController extends ChangeNotifier {
  List<Movie> list = [];

  MovieListController() {
    _initData();
  }

  Future<void> _initData() async {
    list = await MovieRepository.getAll();
    notifyListeners();
  }
}
