import 'package:cine_flutter/modules/dashboard/screen/dashboard_screen.dart';
import 'package:cine_flutter/modules/movies/domain/models/movie.dart';
import 'package:cine_flutter/modules/movies/screens/movie_details.dart';
import 'package:flutter/cupertino.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> list = {
    DashboardScreen.route: (context) => const DashboardScreen(),
    MovieDetails.route: (context) => MovieDetails(
          movie: ModalRoute.of(context)!.settings.arguments as Movie,
        ),
  };
}
