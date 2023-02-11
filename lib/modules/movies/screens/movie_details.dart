// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:cine_flutter/common/animations/down_top_entrance.dart';
import 'package:cine_flutter/common/animations/fade_entrance.dart';
import 'package:cine_flutter/common/widgets/blurred_background.dart';
import 'package:cine_flutter/common/widgets/heading.dart';
import 'package:cine_flutter/modules/movies/widgets/cast_list.dart';
import 'package:cine_flutter/modules/movies/widgets/crew_list.dart';
import 'package:cine_flutter/modules/movies/widgets/movie_details_app_bar.dart';
import 'package:cine_flutter/modules/movies/widgets/review_list.dart';
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: DownTopEntrance(
        downValue: 0.6,
        delay: const Duration(milliseconds: 300),
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.6,
              height: 50,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "Select seats",
                style: GoogleFonts.poppins(fontSize: 15, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      body: BlurredBackground(
        imgUrl: movie.thumbUrl,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            MovieDetailsAppBar(movie: movie),
            SliverToBoxAdapter(
              child: FadeEntrance(
                delay: const Duration(milliseconds: 450),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 20,
                    bottom: Platform.isAndroid ? 80 : 120,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Heading.middle("About the movie"),
                      const SizedBox(height: 8),
                      Text(
                        movie.about,
                        style: GoogleFonts.poppins(
                            fontSize: 12, color: Colors.white),
                      ),
                      const SizedBox(height: 20),
                      const Heading.middle("Cast"),
                      const SizedBox(height: 8),
                      const CastList(),
                      const SizedBox(height: 20),
                      const Heading.middle("Crew"),
                      const SizedBox(height: 8),
                      const CrewList(),
                      const SizedBox(height: 20),
                      const Heading.middle("Reviews"),
                      const SizedBox(height: 8),
                      const ReviewList(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
