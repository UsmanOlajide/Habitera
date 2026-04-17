// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authStateHash() => r'4de49fc8547d39c6e1a8186fda8192c557bb144b';

/// See also [authState].
@ProviderFor(authState)
final authStateProvider = AutoDisposeStreamProvider<AuthState>.internal(
  authState,
  name: r'authStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthStateRef = AutoDisposeStreamProviderRef<AuthState>;
String _$isLoggedInHash() => r'ca5020903cba771f440f404e01af5657415717bb';

/// See also [isLoggedIn].
@ProviderFor(isLoggedIn)
final isLoggedInProvider = AutoDisposeProvider<bool>.internal(
  isLoggedIn,
  name: r'isLoggedInProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$isLoggedInHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IsLoggedInRef = AutoDisposeProviderRef<bool>;
String _$authServiceHash() => r'82398d9f38c720e4ddf6b218248f15089fd4f178';

/// See also [authService].
@ProviderFor(authService)
final authServiceProvider = AutoDisposeProvider<AuthService>.internal(
  authService,
  name: r'authServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthServiceRef = AutoDisposeProviderRef<AuthService>;
String _$isPasswordRecoveryHash() =>
    r'e8ae847335a6d9b1ff616ad883f7ca5f25ac686b';

/// See also [IsPasswordRecovery].
@ProviderFor(IsPasswordRecovery)
final isPasswordRecoveryProvider =
    AutoDisposeNotifierProvider<IsPasswordRecovery, bool>.internal(
  IsPasswordRecovery.new,
  name: r'isPasswordRecoveryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isPasswordRecoveryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$IsPasswordRecovery = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
