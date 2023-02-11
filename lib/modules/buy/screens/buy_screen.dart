import 'package:flutter/material.dart';

class BuyScreen extends StatelessWidget {
  static String route = "buy-screen";

  const BuyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text(
        "buy module",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
