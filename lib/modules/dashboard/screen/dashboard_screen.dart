import 'package:cine_flutter/modules/dashboard/widgets/bottom_navigation.dart';
import 'package:cine_flutter/modules/movies/screens/movie_list_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    MovieListScreen(),
    Text('My Tickets', style: optionStyle),
    Text('Profile', style: optionStyle),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: BottomNavigation(
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
