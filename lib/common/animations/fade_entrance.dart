import 'package:flutter/material.dart';

class FadeEntrance extends StatefulWidget {
  final Widget child;

  const FadeEntrance({required this.child, Key? key}) : super(key: key);

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
    await Future.delayed(const Duration(milliseconds: 100));
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
