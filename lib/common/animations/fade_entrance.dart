import 'package:flutter/material.dart';

// ignore: constant_identifier_names
const DEFAULT_DELAY = Duration(milliseconds: 100);

class FadeEntrance extends StatefulWidget {
  final Widget child;
  Duration? delay;

  FadeEntrance({
    required this.child,
    this.delay,
    Key? key,
  }) : super(key: key);

  @override
  State<FadeEntrance> createState() => _FadeEntranceState();
}

class _FadeEntranceState extends State<FadeEntrance> {
  double opacityLevel = 0.0;

  @override
  void initState() {
    super.initState();

    animate();
  }

  void animate() async {
    await Future.delayed(widget.delay ?? DEFAULT_DELAY);
    if (mounted) setState(() => opacityLevel = 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacityLevel,
      duration: const Duration(milliseconds: 400),
      child: widget.child,
    );
  }
}
