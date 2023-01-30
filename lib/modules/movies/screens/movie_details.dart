// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
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
      body: Center(
        child: Hero(
          tag: movie.thumbUrl,
          child: CachedNetworkImage(
            imageUrl: movie.thumbUrl,
            progressIndicatorBuilder: (_, __, ___) {
              return const Center(child: CircularProgressIndicator());
            },
            errorWidget: (_, __, ___) => const Icon(Icons.error),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
