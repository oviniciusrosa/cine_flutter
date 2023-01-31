import 'package:flutter/material.dart';

class DownTopEntrance extends StatefulWidget {
  final Widget child;

  const DownTopEntrance({required this.child, Key? key}) : super(key: key);

  @override
  State<DownTopEntrance> createState() => _DownTopEntranceState();
}

class _DownTopEntranceState extends State<DownTopEntrance> {
  Offset offset = const Offset(0, 0.1);

  @override
  void initState() {
    super.initState();

    animate();
  }

  void animate() async {
    await Future.delayed(const Duration(milliseconds: 50));
    setState(() => offset = const Offset(0, 0));
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
