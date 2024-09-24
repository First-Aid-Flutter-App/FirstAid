import 'package:flutter/material.dart';
import 'situation_selection_screen.dart';
import 'user_information_screen.dart';
import 'cpr_guide_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    SituationSelectionScreen(),
    CPRGuideScreen(),
    MyInfoScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services),
            label: 'Select Injury',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'CPR Guide',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My Profile',
          ),
        ],
      ),
    );
  }
}
