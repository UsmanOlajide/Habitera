import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitera/features/auth/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_provider.g.dart';

@riverpod
Stream<AuthState> authState(AuthStateRef ref) {
  return Supabase.instance.client.auth.onAuthStateChange;
}

@riverpod
bool isLoggedIn(Ref ref) {
  final authStateAsync = ref.watch(authStateProvider);
  print('authStateAsync: $authStateAsync');
  print('session: ${authStateAsync.value?.session}');

  final authState = authStateAsync.value;

  if (authState != null) {
    return authState.session != null;
  }

  return Supabase.instance.client.auth.currentSession != null;
}

@riverpod
AuthService authService(Ref ref) {
  return AuthService();
}

@riverpod
class IsPasswordRecovery extends _$IsPasswordRecovery {
  @override
  bool build() => false;

  void setRecovery(bool value) {
    state = value;
  }
}
