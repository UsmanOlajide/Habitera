// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

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
String _$checkinDayKeysForHabitHash() =>
    r'36e706c97903ef4e048d607a401c0db8b4998d9f';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [checkinDayKeysForHabit].
@ProviderFor(checkinDayKeysForHabit)
const checkinDayKeysForHabitProvider = CheckinDayKeysForHabitFamily();

/// See also [checkinDayKeysForHabit].
class CheckinDayKeysForHabitFamily extends Family<AsyncValue<Set<int>>> {
  /// See also [checkinDayKeysForHabit].
  const CheckinDayKeysForHabitFamily();

  /// See also [checkinDayKeysForHabit].
  CheckinDayKeysForHabitProvider call(
    String habitId,
  ) {
    return CheckinDayKeysForHabitProvider(
      habitId,
    );
  }

  @override
  CheckinDayKeysForHabitProvider getProviderOverride(
    covariant CheckinDayKeysForHabitProvider provider,
  ) {
    return call(
      provider.habitId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'checkinDayKeysForHabitProvider';
}

/// See also [checkinDayKeysForHabit].
class CheckinDayKeysForHabitProvider
    extends AutoDisposeFutureProvider<Set<int>> {
  /// See also [checkinDayKeysForHabit].
  CheckinDayKeysForHabitProvider(
    String habitId,
  ) : this._internal(
          (ref) => checkinDayKeysForHabit(
            ref as CheckinDayKeysForHabitRef,
            habitId,
          ),
          from: checkinDayKeysForHabitProvider,
          name: r'checkinDayKeysForHabitProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$checkinDayKeysForHabitHash,
          dependencies: CheckinDayKeysForHabitFamily._dependencies,
          allTransitiveDependencies:
              CheckinDayKeysForHabitFamily._allTransitiveDependencies,
          habitId: habitId,
        );

  CheckinDayKeysForHabitProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.habitId,
  }) : super.internal();

  final String habitId;

  @override
  Override overrideWith(
    FutureOr<Set<int>> Function(CheckinDayKeysForHabitRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CheckinDayKeysForHabitProvider._internal(
        (ref) => create(ref as CheckinDayKeysForHabitRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        habitId: habitId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Set<int>> createElement() {
    return _CheckinDayKeysForHabitProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CheckinDayKeysForHabitProvider && other.habitId == habitId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, habitId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CheckinDayKeysForHabitRef on AutoDisposeFutureProviderRef<Set<int>> {
  /// The parameter `habitId` of this provider.
  String get habitId;
}

class _CheckinDayKeysForHabitProviderElement
    extends AutoDisposeFutureProviderElement<Set<int>>
    with CheckinDayKeysForHabitRef {
  _CheckinDayKeysForHabitProviderElement(super.provider);

  @override
  String get habitId => (origin as CheckinDayKeysForHabitProvider).habitId;
}

String _$habitsHash() => r'38e42996981a73d8c494a0ee72425f8e7152b999';

/// See also [Habits].
@ProviderFor(Habits)
final habitsProvider =
    AutoDisposeAsyncNotifierProvider<Habits, List<Habit>>.internal(
  Habits.new,
  name: r'habitsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$habitsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Habits = AutoDisposeAsyncNotifier<List<Habit>>;
String _$doneHabitIdsHash() => r'cb2739960d4a9c412d2aeaf82f18d6f7a215f994';

/// See also [DoneHabitIds].
@ProviderFor(DoneHabitIds)
final doneHabitIdsProvider =
    AutoDisposeAsyncNotifierProvider<DoneHabitIds, Set<String>>.internal(
  DoneHabitIds.new,
  name: r'doneHabitIdsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$doneHabitIdsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DoneHabitIds = AutoDisposeAsyncNotifier<Set<String>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
