// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'package:google_fonts/google_fonts.dart';

class BottomNavigation extends StatelessWidget {
  final Function(int) onTap;
  final int currentIndex;

  const BottomNavigation({
    Key? key,
    required this.onTap,
    required this.currentIndex,
  }) : super(key: key);

  static const options = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Ionicons.film_outline),
      label: 'Movies',
    ),
    BottomNavigationBarItem(
      icon: Icon(Ionicons.ticket_outline),
      label: 'My Tickets',
    ),
    BottomNavigationBarItem(
      icon: Icon(Ionicons.person),
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Material(
        elevation: 12,
        borderRadius: BorderRadius.circular(12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: BottomNavigationBar(
            showUnselectedLabels: false,
            backgroundColor: const Color(0xFF0B0B16),
            unselectedItemColor: const Color(0xFF706A78),
            selectedLabelStyle: GoogleFonts.poppins(fontSize: 12),
            items: options,
            selectedItemColor: Colors.white,
            onTap: onTap,
            currentIndex: currentIndex,
          ),
        ),
      ),
    );
  }
}
