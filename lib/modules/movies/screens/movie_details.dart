// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cine_flutter/common/widgets/blurred_background.dart';
import 'package:cine_flutter/common/widgets/heading.dart';
import 'package:cine_flutter/modules/movies/widgets/movie_details_app_bar.dart';
import 'package:flutter/material.dart';

import 'package:cine_flutter/modules/movies/domain/models/movie.dart';
import 'package:google_fonts/google_fonts.dart';

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
          physics: const BouncingScrollPhysics(),
          slivers: [
            MovieDetailsAppBar(movie: movie),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Heading.middle("About the movie"),
                    const SizedBox(height: 8),
                    Text(
                      movie.about,
                      style: GoogleFonts.poppins(fontSize: 12, color: Colors.white),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
