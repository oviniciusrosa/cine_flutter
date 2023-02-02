// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:cine_flutter/common/animations/fade_entrance.dart';
import 'package:cine_flutter/modules/movies/widgets/movie_header.dart';

import '../domain/models/movie.dart';

class MovieDetailsAppBar extends StatelessWidget {
  final Movie movie;
  const MovieDetailsAppBar({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      expandedHeight: 400,
      centerTitle: true,
      flexibleSpace: Stack(
        fit: StackFit.expand,
        children: [
          Hero(
            tag: movie.thumbUrl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: CachedNetworkImage(
                imageUrl: movie.thumbUrl,
                progressIndicatorBuilder: (_, __, ___) {
                  return const Center(child: CircularProgressIndicator());
                },
                errorWidget: (_, __, ___) => const Icon(Icons.error),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          const Overlay(),
          Positioned(
            bottom: 20,
            child: MovieHeader(
              movie: movie,
              animationDelay: const Duration(milliseconds: 250),
            ),
          ),
        ],
      ),
    );
  }
}

class Overlay extends StatelessWidget {
  const Overlay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: FadeEntrance(
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: const LinearGradient(
              begin: Alignment(0.0, 0.5),
              end: Alignment(0.0, 0.0),
              colors: <Color>[
                Color(0x60000000),
                Color(0x00000000),
              ],
            ),
          ),
          // child: MovieHeader(movie: movie),
        ),
      ),
    );
  }
}
