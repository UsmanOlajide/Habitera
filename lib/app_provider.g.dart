// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appVersionHash() => r'ae5f9f19d9bb31094906d68e01bc1f8bd227ad4a';

/// See also [appVersion].
@ProviderFor(appVersion)
final appVersionProvider = AutoDisposeFutureProvider<String>.internal(
  appVersion,
  name: r'appVersionProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appVersionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppVersionRef = AutoDisposeFutureProviderRef<String>;
String _$hasSeenOnboardingHash() => r'd1af917e5cbe749356039b978a91072ac76510a4';

/// See also [HasSeenOnboarding].
@ProviderFor(HasSeenOnboarding)
final hasSeenOnboardingProvider =
    AutoDisposeAsyncNotifierProvider<HasSeenOnboarding, bool>.internal(
  HasSeenOnboarding.new,
  name: r'hasSeenOnboardingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hasSeenOnboardingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HasSeenOnboarding = AutoDisposeAsyncNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
