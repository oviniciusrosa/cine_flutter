// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class NetworkImg extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;

  const NetworkImg(
    this.image, {
    this.height,
    this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (image.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Image.network(
      image,
      height: height ?? MediaQuery.of(context).size.height * 0.6,
      width: width ?? MediaQuery.of(context).size.width * 0.7,
      fit: BoxFit.cover,
    );
  }
}
