import 'package:flutter/material.dart';

// ignore: constant_identifier_names
const DEFAULT_DELAY = Duration(milliseconds: 50);

class DownTopEntrance extends StatefulWidget {
  final Widget child;
  final double downValue;
  Duration? delay;

  DownTopEntrance({
    required this.child,
    this.delay,
    this.downValue = 0.1,
    Key? key,
  }) : super(key: key);

  @override
  State<DownTopEntrance> createState() => _DownTopEntranceState();
}

class _DownTopEntranceState extends State<DownTopEntrance> {
  late Offset offset;

  @override
  void initState() {
    super.initState();

    offset = Offset(0, widget.downValue);

    animate();
  }

  void animate() async {
    await Future.delayed(widget.delay ?? DEFAULT_DELAY);
    if (mounted) setState(() => offset = const Offset(0, 0));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      offset: offset,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 250),
      child: widget.child,
    );
  }
}
