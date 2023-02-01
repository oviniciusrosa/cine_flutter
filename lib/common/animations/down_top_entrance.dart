import 'package:flutter/material.dart';

class DownTopEntrance extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final double downValue;

  const DownTopEntrance({
    required this.child,
    this.delay = const Duration(milliseconds: 50),
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
    await Future.delayed(widget.delay);
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
