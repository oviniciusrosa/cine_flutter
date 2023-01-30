// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../domain/models/movie.dart';

class MovieImgCard extends StatelessWidget {
  final Movie movie;

  const MovieImgCard({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final image = movie.thumbUrl;

    if (image.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          image,
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width * 0.7,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
