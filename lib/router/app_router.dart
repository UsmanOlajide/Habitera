import 'package:go_router/go_router.dart';
import 'package:habitera/constants/enums.dart';
import 'package:habitera/features/habit_tracker/data/models/habit_isar.dart';
import 'package:habitera/features/habit_tracker/presentation/add_habit_screen.dart';
import 'package:habitera/features/habit_tracker/presentation/edit_habit_screen.dart';
import 'package:habitera/features/habit_tracker/presentation/habit_details_screen.dart';
import 'package:habitera/navigation/navbar.dart';
import 'package:habitera/router/habit_details_args.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

enum AppRoutes {
  navbar('/navbar'),
  habitsScreen('/habits-screen'),
  addHabitsScreen('/add-habits'),
  editHabitsScreen('/edit-habits'),
  chatsScreen('/chats-screen'),
  shopScreen('/shop-screen'),
  profileScreen('/profile-screen'),
  habitDetailsScreen('/habit-details-screen');

  final String path;
  const AppRoutes(this.path);
}

extension on AppRoutes {
  String get childPath => path.split('/').last;
}

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  return GoRouter(
    initialLocation: AppRoutes.navbar.path,
    routes: [
      GoRoute(
        name: AppRoutes.navbar.name,
        path: AppRoutes.navbar.path,
        builder: (_, _) => const NavBar(),
        routes: [
          GoRoute(
            name: AppRoutes.addHabitsScreen.name,
            path: '${AppRoutes.addHabitsScreen.childPath}/:type',
            builder: (_, state) {
              final typeString = state.pathParameters['type'] ?? 'startHabit';
              final type = HabitType.values.firstWhere(
                (e) => e.name == typeString,
                orElse: () => HabitType.startHabit,
              );
              return AddHabitScreen(type: type);
            },
          ),
          GoRoute(
            name: AppRoutes.editHabitsScreen.name,
            path: AppRoutes.editHabitsScreen.childPath,
            builder: (_, state) {
              final habit = state.extra as HabitIsar;
              return EditHabitScreen(habit: habit);
            },
          ),
          GoRoute(
            name: AppRoutes.habitDetailsScreen.name,
            path: AppRoutes.habitDetailsScreen.childPath,
            builder: (_, state) {
              final habit = state.extra as HabitIsar;
             
              return HabitDetailsScreen(
                habit: habit
              );
            },
          ),
        ],
      ),
    ],
  );
}
// . /navbar/habit-details-screen
//. What i want to do is to pass values from habitsScreen to habitDetailsScreen
//. 
//. 
//. 