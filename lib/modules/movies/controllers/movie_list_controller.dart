import 'package:cine_flutter/modules/movies/domain/models/movie.dart';
import 'package:cine_flutter/modules/movies/domain/repository/movie_repository.dart';
import 'package:flutter/cupertino.dart';

class MovieListController extends ChangeNotifier {
  MovieListController() {
    _initData();
  }

  int index = 0;
  List<Movie> list = [];

  Future<void> _initData() async {
    list = await MovieRepository.getAll();
    notifyListeners();
  }

  void pageChanged(int i) {
    index = i;
    notifyListeners();
  }

  Movie? get movie {
    if (list.isEmpty) return null;

    return list[index];
  }
}
