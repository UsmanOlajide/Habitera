import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:habitera/constants/enums.dart';
import 'package:habitera/features/auth/presentation/login_screen.dart';
import 'package:habitera/features/auth/presentation/signup_screen.dart';
import 'package:habitera/features/habit_tracker/data/models/habit.dart';
import 'package:habitera/features/habit_tracker/data/models/habit_isar.dart';
import 'package:habitera/features/habit_tracker/presentation/add_habit_screen.dart';
import 'package:habitera/features/auth/presentation/auth_provider.dart';
import 'package:habitera/features/habit_tracker/presentation/confirm_email_screen.dart';
import 'package:habitera/features/habit_tracker/presentation/edit_habit_screen.dart';
import 'package:habitera/features/habit_tracker/presentation/forgot_password_screen.dart';
import 'package:habitera/features/habit_tracker/presentation/habit_details_screen.dart';
import 'package:habitera/features/habit_tracker/presentation/reset_password_screen.dart';
import 'package:habitera/navigation/navbar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'app_router.g.dart';

enum AppRoutes {
  navbar('/navbar'),
  habitsScreen('/habits-screen'),
  addHabitsScreen('/add-habits'),
  editHabitsScreen('/edit-habits'),
  chatsScreen('/chats-screen'),
  shopScreen('/shop-screen'),
  profileScreen('/profile-screen'),
  habitDetailsScreen('/habit-details-screen'),
  loginScreen('/login-screen'),
  signupScreen('/signup-screen'),
  forgotPasswordScreen('/forgot-password-screen'),
  resetPasswordScreen('/reset-password-screen'),
  confirmEmailScreen('/confirm-email-screen');

  final String path;
  const AppRoutes(this.path);
}

extension on AppRoutes {
  String get childPath => path.split('/').last;
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    _subscription = stream.listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  final refreshStream = GoRouterRefreshStream(
    Supabase.instance.client.auth.onAuthStateChange,
  );

  ref.onDispose(refreshStream.dispose);

  return GoRouter(
    refreshListenable: refreshStream,
    redirect: (context, state) {
      final isLoggedIn = ref.read(isLoggedInProvider);
      // final authEvent = ref.read(authStateProvider).value?.event;
      final isPasswordRecovery = ref.read(isPasswordRecoveryProvider);

      final onAuthScreen =
          state.matchedLocation == AppRoutes.loginScreen.path ||
          state.matchedLocation == AppRoutes.signupScreen.path ||
          state.matchedLocation.startsWith(AppRoutes.loginScreen.path) ||
          state.matchedLocation == AppRoutes.resetPasswordScreen.path ||
          state.matchedLocation == AppRoutes.confirmEmailScreen.path;

      print(
        'redirect running, isLoggedIn: $isLoggedIn , onAuthScreen: $onAuthScreen',
      );

      if (isPasswordRecovery) {
        return AppRoutes.resetPasswordScreen.path;
      }

      if (!isLoggedIn && !onAuthScreen) {
        return AppRoutes.loginScreen.path;
      }

      if (isLoggedIn && onAuthScreen) {
        return AppRoutes.navbar.path;
      }
      return null;
    },
    initialLocation: AppRoutes.navbar.path,
    routes: [
      GoRoute(
        name: AppRoutes.loginScreen.name,
        path: AppRoutes.loginScreen.path,
        builder: (_, state) {
          return LoginScreen();
        },
        routes: [
          GoRoute(
            name: AppRoutes.forgotPasswordScreen.name,
            path: AppRoutes.forgotPasswordScreen.childPath,
            builder: (_, state) {
              return ForgotpasswordScreen();
            },
          ),
        ],
      ),
      GoRoute(
        name: AppRoutes.signupScreen.name,
        path: AppRoutes.signupScreen.path,
        builder: (_, state) {
          return SignupScreen();
        },
      ),
      GoRoute(
        name: AppRoutes.confirmEmailScreen.name,
        path: AppRoutes.confirmEmailScreen.path,
        builder: (_, state) {
          final email = state.extra as String;
          return ConfirmEmailScreen(email: email);
        },
      ),
      GoRoute(
        name: AppRoutes.resetPasswordScreen.name,
        path: AppRoutes.resetPasswordScreen.path,
        builder: (_, state) {
          return ResetPasswordScreen();
        },
      ),
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
              final habit = state.extra as Habit;
              return EditHabitScreen(habit: habit);
            },
          ),
          GoRoute(
            name: AppRoutes.habitDetailsScreen.name,
            path: AppRoutes.habitDetailsScreen.childPath,
            builder: (_, state) {
              final habit = state.extra as HabitIsar;

              return HabitDetailsScreen(habit: habit);
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