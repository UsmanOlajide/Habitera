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
    r'1160a7b5d850cf7a79db573fc1c93655fb18f7c4';

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
    int habitId,
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
    int habitId,
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

  final int habitId;

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
  int get habitId;
}

class _CheckinDayKeysForHabitProviderElement
    extends AutoDisposeFutureProviderElement<Set<int>>
    with CheckinDayKeysForHabitRef {
  _CheckinDayKeysForHabitProviderElement(super.provider);

  @override
  int get habitId => (origin as CheckinDayKeysForHabitProvider).habitId;
}

String _$habitsHash() => r'f00aa67e63fe4931b28e8e1fbef8d3a0b5c0be0f';

/// See also [Habits].
@ProviderFor(Habits)
final habitsProvider =
    AutoDisposeAsyncNotifierProvider<Habits, List<HabitIsar>>.internal(
  Habits.new,
  name: r'habitsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$habitsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Habits = AutoDisposeAsyncNotifier<List<HabitIsar>>;
String _$doneHabitIdsHash() => r'903e52f7e1d74e6ee7c7f45a19eaf835622726ce';

/// See also [DoneHabitIds].
@ProviderFor(DoneHabitIds)
final doneHabitIdsProvider =
    AutoDisposeAsyncNotifierProvider<DoneHabitIds, Set<int>>.internal(
  DoneHabitIds.new,
  name: r'doneHabitIdsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$doneHabitIdsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DoneHabitIds = AutoDisposeAsyncNotifier<Set<int>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
