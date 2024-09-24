import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'situation_selection_screen.dart';
import 'user_information_screen.dart';
import 'cpr_guide_screen.dart';
import 'package:firstaid/providers/navigation_provider.dart';

class MainScreen extends ConsumerWidget {
  final List<Widget> _screens = [
    SituationSelectionScreen(),
    CPRGuideScreen(),
    MyInfoScreen(),
    ];
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _currentIndex = ref.watch(currentIndexProvider);

    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          ref.read(currentIndexProvider.notifier).state = index;
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
