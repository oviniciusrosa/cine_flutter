// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:cine_flutter/common/widgets/blurred_image_bg.dart';

class BlurredBackground extends StatelessWidget {
  final String imgUrl;
  final Widget child;

  const BlurredBackground({
    Key? key,
    required this.imgUrl,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [BlurredImageBg(imgUrl, key: ValueKey(imgUrl)), child],
    );
  }
}
