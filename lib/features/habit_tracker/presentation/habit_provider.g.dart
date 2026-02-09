// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$doneHabitIdsHash() => r'04f337588821736bb2f30ae61c186f7a4de90319';

/// See also [doneHabitIds].
@ProviderFor(doneHabitIds)
final doneHabitIdsProvider = AutoDisposeFutureProvider<Set<int>>.internal(
  doneHabitIds,
  name: r'doneHabitIdsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$doneHabitIdsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DoneHabitIdsRef = AutoDisposeFutureProviderRef<Set<int>>;
String _$checkinRepositoryHash() => r'beb7ea004d24b2db5420d1c078eb6636ad1cb8b6';

/// See also [checkinRepository].
@ProviderFor(checkinRepository)
final checkinRepositoryProvider =
    AutoDisposeProvider<CheckinRepository>.internal(
  checkinRepository,
  name: r'checkinRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$checkinRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CheckinRepositoryRef = AutoDisposeProviderRef<CheckinRepository>;
String _$habitRepositoryHash() => r'99f3d3542a631d09990307fc2ea4cbf419f2f7bc';

/// See also [habitRepository].
@ProviderFor(habitRepository)
final habitRepositoryProvider = AutoDisposeProvider<HabitRepository>.internal(
  habitRepository,
  name: r'habitRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$habitRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HabitRepositoryRef = AutoDisposeProviderRef<HabitRepository>;
String _$habitsHash() => r'c4fb20f593dcc71375ce6d75eae4254b13a0ecad';

/// See also [habits].
@ProviderFor(habits)
final habitsProvider = AutoDisposeFutureProvider<List<HabitIsar>>.internal(
  habits,
  name: r'habitsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$habitsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HabitsRef = AutoDisposeFutureProviderRef<List<HabitIsar>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
