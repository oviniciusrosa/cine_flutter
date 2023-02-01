import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final String text;
  final double fontSize;

  const Heading(
    this.text, {
    this.fontSize = 22,
    Key? key,
  }) : super(key: key);

  const Heading.small(
    this.text, {
    this.fontSize = 14,
    Key? key,
  }) : super(key: key);

  const Heading.middle(
    this.text, {
    this.fontSize = 18,
    Key? key,
  }) : super(key: key);

  const Heading.large(
    this.text, {
    this.fontSize = 22,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
