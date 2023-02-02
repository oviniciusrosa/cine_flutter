// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cine_flutter/common/widgets/heading.dart';
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
      stretch: true,
      pinned: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: _DetailsTitle(movie: movie),
      ),
      flexibleSpace: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: FlexibleSpaceBar(
          stretchModes: const [StretchMode.blurBackground, StretchMode.zoomBackground],
          background: Stack(
            fit: StackFit.expand,
            alignment: Alignment.bottomLeft,
            children: [
              Hero(
                tag: movie.thumbUrl,
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
              const _Overlay(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Overlay extends StatelessWidget {
  const _Overlay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeEntrance(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: const LinearGradient(
            begin: Alignment(0.0, 0.5),
            end: Alignment(0.0, 0.0),
            colors: <Color>[
              Color.fromRGBO(0, 0, 0, 0.6),
              Color.fromRGBO(0, 0, 0, 0),
            ],
          ),
        ),
        // child: MovieHeader(movie: movie),
      ),
    );
  }
}

class _DetailsTitle extends StatelessWidget {
  final Movie movie;

  const _DetailsTitle({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      final settings = context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
      final deltaExtent = settings!.maxExtent - settings.minExtent;
      final t = (1.0 - (settings.currentExtent - settings.minExtent) / deltaExtent).clamp(0.0, 1.0);
      final fadeStart = [0.0, 1.0 - kToolbarHeight / deltaExtent].reduce(max);
      const fadeEnd = 1.0;
      final opacity = 1.0 - Interval(fadeStart, fadeEnd).transform(t);

      return Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          Center(
            child: Transform.translate(
              offset: const Offset(0, -25),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: 1 - opacity,
                child: Heading.middle(movie.title),
              ),
            ),
          ),
          ClipRRect(
            child: SizedBox(
              height: opacity * 120,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: opacity,
                child: MovieHeader(
                  movie: movie,
                  animationDelay: const Duration(milliseconds: 250),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
