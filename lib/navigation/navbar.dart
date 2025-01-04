import 'package:flutter/material.dart';
import 'package:habitera/features/habit_tracker/presentation/chats_screen.dart';
import 'package:habitera/features/habit_tracker/presentation/habits_screen.dart';
import 'package:habitera/features/habit_tracker/presentation/shop_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final screens = [
    const HabitsScreen(),
    const ChatsScreen(),
    const ShopScreen(),
  ];

  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.punch_clock_rounded),
            label: 'Habits',
          ),

          NavigationDestination(
            icon: Icon(Icons.message),
            label: 'Chats',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_bag_rounded),
            label: 'Shop',
          ),
         
        ],
      ),
    );
  }
}
