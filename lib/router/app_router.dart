import 'package:go_router/go_router.dart';
import 'package:habitera/constants/enums.dart';
import 'package:habitera/features/habit_tracker/data/models/habit_isar.dart';
import 'package:habitera/features/habit_tracker/presentation/add_habit_screen.dart';
import 'package:habitera/features/habit_tracker/presentation/edit_habit_screen.dart';
import 'package:habitera/navigation/navbar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

enum AppRoutes {
  navbar('/navbar'),
  habitsScreen('/habits-screen'),
  addHabitsScreen('/add-habits'),
  editHabitsScreen('/edit-habits'),
  chatsScreen('/chats-screen'),
  shopScreen('/shop-screen'),
  profileScreen('/profile-screen');

  final String path;
  const AppRoutes(this.path);
}

extension on AppRoutes {
  String get childPath {
    return path.split('/').last;
  }
}

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  return GoRouter(
    initialLocation: AppRoutes.navbar.path,
    routes: [
      GoRoute(
        path: AppRoutes.navbar.path,
        name: AppRoutes.navbar.name,
        builder: (_, _) => const NavBar(),
        routes: [
          GoRoute(
            path: '${AppRoutes.addHabitsScreen.childPath}/:type',
            name: AppRoutes.addHabitsScreen.name,
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
            path: AppRoutes.editHabitsScreen.childPath,

            name: AppRoutes.editHabitsScreen.name,
            builder: (_, state) {
              final habit = state.extra as HabitIsar;
              // if (habit == null) {
              //   // Fallback: redirect back or show error
              //   return const SizedBox.shrink(); // or handle error
              // }
              return EditHabitScreen(habit: habit);
            },
          ),
        ],
      ),
    ],
  );
}
