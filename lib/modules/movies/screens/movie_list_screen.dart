import 'package:cine_flutter/common/animations/down_top_entrance.dart';
import 'package:cine_flutter/common/widgets/blurred_image_bg.dart';
import 'package:cine_flutter/modules/movies/controllers/movie_list_controller.dart';
import 'package:cine_flutter/modules/movies/domain/models/movie.dart';
import 'package:cine_flutter/modules/movies/widgets/movie_img_card.dart';
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
            DownTopEntrance(
              child: PageView.builder(
                onPageChanged: controller.pageChanged,
                controller: controller.pageController,
                itemCount: controller.list.length,
                itemBuilder: (context, index) {
                  Movie item = controller.list[index];
                  return AnimatedBuilder(
                    animation: controller.pageController,
                    child: MovieImgCard(movie: item),
                    builder: (context, child) {
                      double scale = 1;

                      if (controller.pageController.position.haveDimensions) {
                        var factor = index.toDouble() - (controller.pageController.page ?? 0);
                        scale = (scale - factor).clamp(0, 1);
                      }
                      return Transform.scale(
                        scale: scale,
                        child: child!,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
