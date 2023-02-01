// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cine_flutter/common/widgets/category_tag.dart';
import 'package:cine_flutter/modules/movies/domain/enums/category.dart';
import 'package:flutter/material.dart';

import 'package:cine_flutter/common/animations/down_top_entrance.dart';
import 'package:cine_flutter/common/widgets/heading.dart';
import 'package:cine_flutter/modules/movies/domain/models/movie.dart';
import 'package:ionicons/ionicons.dart';

class MovieHeader extends StatelessWidget {
  final Movie? movie;

  const MovieHeader({
    Key? key,
    required this.movie,
  }) : super(key: key);

  String get rate {
    var rate = movie?.rate.toString() ?? "0";

    return "$rate / 10";
  }

  String get totalVotes {
    var votes = movie?.votesNumber.toString() ?? "";
    if (votes.length > 3) votes = votes.substring(0, votes.toString().length - 3);

    return "${votes}k votes";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DownTopEntrance(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Heading(movie?.title ?? ""),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        for (Category category in (movie?.categories ?? []))
                          Padding(
                            padding: const EdgeInsets.only(right: 4.0),
                            child: CategoryTag(category: category),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Ionicons.star,
                    size: 14,
                    color: Colors.amber,
                  ),
                  const SizedBox(width: 4),
                  Padding(
                    padding: const EdgeInsets.only(top: 2.5),
                    child: Row(
                      children: [
                        Heading.small(rate, fontSize: 12),
                        const Heading.small(" - ", fontSize: 12),
                        Heading.small(totalVotes, fontSize: 12),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
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
      ),
    );
  }
}
