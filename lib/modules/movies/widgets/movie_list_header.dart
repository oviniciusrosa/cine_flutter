// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:cine_flutter/modules/movies/domain/models/movie.dart';
import 'package:cine_flutter/modules/movies/widgets/movie_header.dart';
import 'package:ionicons/ionicons.dart';

class MovieListHeader extends StatelessWidget {
  final Movie? movie;
  const MovieListHeader({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MovieHeader(movie: movie),
        Transform.translate(
          offset: const Offset(-10, -10),
          child: Row(
            children: [
              IconButton(
                onPressed: () => print("search"),
                icon: const Icon(
                  Ionicons.search_outline,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () => print("notifications"),
                icon: const Icon(
                  Ionicons.notifications_outline,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
