import 'package:cine_flutter/common/widgets/blurred_image_bg.dart';
import 'package:cine_flutter/modules/movies/controllers/movie_list_controller.dart';
import 'package:cine_flutter/modules/movies/domain/models/movie.dart';
import 'package:flutter/material.dart';

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = MovieListController();

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Stack(
          children: [
            BlurredImageBg(
              controller.movie?.thumbUrl ?? "",
              key: ValueKey(controller.movie),
            ),
            PageView(
              onPageChanged: controller.pageChanged,
              children: [for (Movie item in controller.list) Center(child: Text(item.title))],
            ),
          ],
        );
      },
    );
  }
}
