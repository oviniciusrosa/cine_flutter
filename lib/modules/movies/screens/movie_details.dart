// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cine_flutter/common/widgets/blurred_background.dart';
import 'package:cine_flutter/modules/movies/widgets/movie_details_app_bar.dart';
import 'package:flutter/material.dart';

import 'package:cine_flutter/modules/movies/domain/models/movie.dart';

class MovieDetails extends StatelessWidget {
  static String route = "movie-details";

  final Movie movie;

  const MovieDetails({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlurredBackground(
        imgUrl: movie.thumbUrl,
        child: CustomScrollView(
          slivers: [
            MovieDetailsAppBar(movie: movie),
          ],
        ),
      ),
    );
  }
}
