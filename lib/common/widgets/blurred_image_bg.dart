import 'dart:ui';

import 'package:cine_flutter/common/animations/fade_entrance.dart';
import 'package:flutter/material.dart';

class BlurredImageBg extends StatelessWidget {
  final String image;
  const BlurredImageBg(this.image, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (image.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return FadeEntrance(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
          ),
        ),
      ),
    );
  }
}
