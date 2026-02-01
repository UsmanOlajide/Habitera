import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habitera/constants/enums.dart';
import 'package:habitera/constants/sizes.dart';
import 'package:habitera/features/habit_tracker/presentation/add_habit_screen.dart';
import 'package:habitera/features/habit_tracker/presentation/chats_screen.dart';
import 'package:habitera/features/habit_tracker/presentation/habits_screen.dart';
import 'package:habitera/features/habit_tracker/presentation/profile_screen.dart';
import 'package:habitera/features/habit_tracker/presentation/shop_screen.dart';
import 'package:habitera/features/habit_tracker/presentation/widgets/habit_type_bottom_sheet.dart';
import 'package:habitera/router/app_router.dart';
import 'package:habitera/utils/extensions.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final screens = [
    const HabitsScreen(),
    const ChatsScreen(),
    // AddHabitScreen(type: ,),
    const ShopScreen(),
    const ProfileScreen(),
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
        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.punch_clock_rounded),
            label: 'Habits',
          ),
          const NavigationDestination(icon: Icon(Icons.people), label: 'Chats'),
          // CircleAvatar(
          //   radius: 30.0,
          //   backgroundColor: Colors.indigoAccent,
          //   child: IconButton(
          //     // onPressed: () => context.goNamed(AppRoutes.addHabitsScreen.name),
          //     onPressed: () {
          //       showModalBottomSheet(
          //         context: context,
          //         builder: (_) => HabitTypeBottomSheet(),
          //       );
          //     },
          //     icon: const Icon(Icons.add),
          //   ),
          // ),
          const NavigationDestination(
            icon: Icon(Icons.shopping_bag_rounded),
            label: 'Shop',
          ),
          const NavigationDestination(
            icon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
      // floatingActionButton: CircleAvatar(
      //   radius: 30.0,
      //   backgroundColor: const Color.fromARGB(255, 163, 164, 175),
      //   child: IconButton(
      //     // onPressed: () => context.goNamed(AppRoutes.addHabitsScreen.name),
      //     onPressed: () {
      //       showModalBottomSheet(
      //         context: context,
      //         builder: (_) => HabitTypeBottomSheet(),
      //       );
      //     },
      //     icon: const Icon(Icons.add),
      //   ),
      // ),
    );
  }
}



