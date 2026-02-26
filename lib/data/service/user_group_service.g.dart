// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_group_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$groupByIdHash() => r'c3c04881d17210f1420b21520090245a8aaee6de';

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

/// See also [groupById].
@ProviderFor(groupById)
const groupByIdProvider = GroupByIdFamily();

/// See also [groupById].
class GroupByIdFamily extends Family<AsyncValue<GroupEntity?>> {
  /// See also [groupById].
  const GroupByIdFamily();

  /// See also [groupById].
  GroupByIdProvider call(String groupId) {
    return GroupByIdProvider(groupId);
  }

  @override
  GroupByIdProvider getProviderOverride(covariant GroupByIdProvider provider) {
    return call(provider.groupId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'groupByIdProvider';
}

/// See also [groupById].
class GroupByIdProvider extends AutoDisposeStreamProvider<GroupEntity?> {
  /// See also [groupById].
  GroupByIdProvider(String groupId)
    : this._internal(
        (ref) => groupById(ref as GroupByIdRef, groupId),
        from: groupByIdProvider,
        name: r'groupByIdProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$groupByIdHash,
        dependencies: GroupByIdFamily._dependencies,
        allTransitiveDependencies: GroupByIdFamily._allTransitiveDependencies,
        groupId: groupId,
      );

  GroupByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.groupId,
  }) : super.internal();

  final String groupId;

  @override
  Override overrideWith(
    Stream<GroupEntity?> Function(GroupByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GroupByIdProvider._internal(
        (ref) => create(ref as GroupByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        groupId: groupId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<GroupEntity?> createElement() {
    return _GroupByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupByIdProvider && other.groupId == groupId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GroupByIdRef on AutoDisposeStreamProviderRef<GroupEntity?> {
  /// The parameter `groupId` of this provider.
  String get groupId;
}

class _GroupByIdProviderElement
    extends AutoDisposeStreamProviderElement<GroupEntity?>
    with GroupByIdRef {
  _GroupByIdProviderElement(super.provider);

  @override
  String get groupId => (origin as GroupByIdProvider).groupId;
}

String _$activeGroupsHash() => r'e5d7ef886f3600d64c19bca0f8fc43746086e078';

/// See also [activeGroups].
@ProviderFor(activeGroups)
final activeGroupsProvider =
    AutoDisposeFutureProvider<Set<GroupEntity>>.internal(
      activeGroups,
      name: r'activeGroupsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$activeGroupsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ActiveGroupsRef = AutoDisposeFutureProviderRef<Set<GroupEntity>>;
String _$orderedGroupsHash() => r'90a66bed9252066fc88c4fd459f456d72505c7ed';

/// See also [orderedGroups].
@ProviderFor(orderedGroups)
final orderedGroupsProvider =
    AutoDisposeFutureProvider<List<GroupEntity>>.internal(
      orderedGroups,
      name: r'orderedGroupsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$orderedGroupsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef OrderedGroupsRef = AutoDisposeFutureProviderRef<List<GroupEntity>>;
String _$groupByIdActivatedHash() =>
    r'da2fe9a4e5d68bed683918b0c3e9836fcaa0342a';

/// See also [groupByIdActivated].
@ProviderFor(groupByIdActivated)
const groupByIdActivatedProvider = GroupByIdActivatedFamily();

/// See also [groupByIdActivated].
class GroupByIdActivatedFamily extends Family<AsyncValue<bool>> {
  /// See also [groupByIdActivated].
  const GroupByIdActivatedFamily();

  /// See also [groupByIdActivated].
  GroupByIdActivatedProvider call(String groupId) {
    return GroupByIdActivatedProvider(groupId);
  }

  @override
  GroupByIdActivatedProvider getProviderOverride(
    covariant GroupByIdActivatedProvider provider,
  ) {
    return call(provider.groupId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'groupByIdActivatedProvider';
}

/// See also [groupByIdActivated].
class GroupByIdActivatedProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [groupByIdActivated].
  GroupByIdActivatedProvider(String groupId)
    : this._internal(
        (ref) => groupByIdActivated(ref as GroupByIdActivatedRef, groupId),
        from: groupByIdActivatedProvider,
        name: r'groupByIdActivatedProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$groupByIdActivatedHash,
        dependencies: GroupByIdActivatedFamily._dependencies,
        allTransitiveDependencies:
            GroupByIdActivatedFamily._allTransitiveDependencies,
        groupId: groupId,
      );

  GroupByIdActivatedProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.groupId,
  }) : super.internal();

  final String groupId;

  @override
  Override overrideWith(
    FutureOr<bool> Function(GroupByIdActivatedRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GroupByIdActivatedProvider._internal(
        (ref) => create(ref as GroupByIdActivatedRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        groupId: groupId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _GroupByIdActivatedProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupByIdActivatedProvider && other.groupId == groupId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GroupByIdActivatedRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `groupId` of this provider.
  String get groupId;
}

class _GroupByIdActivatedProviderElement
    extends AutoDisposeFutureProviderElement<bool>
    with GroupByIdActivatedRef {
  _GroupByIdActivatedProviderElement(super.provider);

  @override
  String get groupId => (origin as GroupByIdActivatedProvider).groupId;
}

String _$groupByIdWithoutStateHash() =>
    r'dfe30fd9b45c5bbc5217042aca4496fd430587a2';

/// See also [groupByIdWithoutState].
@ProviderFor(groupByIdWithoutState)
const groupByIdWithoutStateProvider = GroupByIdWithoutStateFamily();

/// See also [groupByIdWithoutState].
class GroupByIdWithoutStateFamily extends Family<AsyncValue<GroupEntity?>> {
  /// See also [groupByIdWithoutState].
  const GroupByIdWithoutStateFamily();

  /// See also [groupByIdWithoutState].
  GroupByIdWithoutStateProvider call(String groupId) {
    return GroupByIdWithoutStateProvider(groupId);
  }

  @override
  GroupByIdWithoutStateProvider getProviderOverride(
    covariant GroupByIdWithoutStateProvider provider,
  ) {
    return call(provider.groupId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'groupByIdWithoutStateProvider';
}

/// See also [groupByIdWithoutState].
class GroupByIdWithoutStateProvider
    extends AutoDisposeFutureProvider<GroupEntity?> {
  /// See also [groupByIdWithoutState].
  GroupByIdWithoutStateProvider(String groupId)
    : this._internal(
        (ref) =>
            groupByIdWithoutState(ref as GroupByIdWithoutStateRef, groupId),
        from: groupByIdWithoutStateProvider,
        name: r'groupByIdWithoutStateProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$groupByIdWithoutStateHash,
        dependencies: GroupByIdWithoutStateFamily._dependencies,
        allTransitiveDependencies:
            GroupByIdWithoutStateFamily._allTransitiveDependencies,
        groupId: groupId,
      );

  GroupByIdWithoutStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.groupId,
  }) : super.internal();

  final String groupId;

  @override
  Override overrideWith(
    FutureOr<GroupEntity?> Function(GroupByIdWithoutStateRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GroupByIdWithoutStateProvider._internal(
        (ref) => create(ref as GroupByIdWithoutStateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        groupId: groupId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<GroupEntity?> createElement() {
    return _GroupByIdWithoutStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupByIdWithoutStateProvider && other.groupId == groupId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GroupByIdWithoutStateRef on AutoDisposeFutureProviderRef<GroupEntity?> {
  /// The parameter `groupId` of this provider.
  String get groupId;
}

class _GroupByIdWithoutStateProviderElement
    extends AutoDisposeFutureProviderElement<GroupEntity?>
    with GroupByIdWithoutStateRef {
  _GroupByIdWithoutStateProviderElement(super.provider);

  @override
  String get groupId => (origin as GroupByIdWithoutStateProvider).groupId;
}

String _$groupServiceHash() => r'759390bbb8bb6a8a4eda7e3accf565579006ce36';

abstract class _$GroupService
    extends BuildlessAutoDisposeStreamNotifier<GroupEntity?> {
  late final String groupId;

  Stream<GroupEntity?> build(String groupId);
}

/// See also [GroupService].
@ProviderFor(GroupService)
const groupServiceProvider = GroupServiceFamily();

/// See also [GroupService].
class GroupServiceFamily extends Family<AsyncValue<GroupEntity?>> {
  /// See also [GroupService].
  const GroupServiceFamily();

  /// See also [GroupService].
  GroupServiceProvider call(String groupId) {
    return GroupServiceProvider(groupId);
  }

  @override
  GroupServiceProvider getProviderOverride(
    covariant GroupServiceProvider provider,
  ) {
    return call(provider.groupId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'groupServiceProvider';
}

/// See also [GroupService].
class GroupServiceProvider
    extends AutoDisposeStreamNotifierProviderImpl<GroupService, GroupEntity?> {
  /// See also [GroupService].
  GroupServiceProvider(String groupId)
    : this._internal(
        () => GroupService()..groupId = groupId,
        from: groupServiceProvider,
        name: r'groupServiceProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$groupServiceHash,
        dependencies: GroupServiceFamily._dependencies,
        allTransitiveDependencies:
            GroupServiceFamily._allTransitiveDependencies,
        groupId: groupId,
      );

  GroupServiceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.groupId,
  }) : super.internal();

  final String groupId;

  @override
  Stream<GroupEntity?> runNotifierBuild(covariant GroupService notifier) {
    return notifier.build(groupId);
  }

  @override
  Override overrideWith(GroupService Function() create) {
    return ProviderOverride(
      origin: this,
      override: GroupServiceProvider._internal(
        () => create()..groupId = groupId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        groupId: groupId,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<GroupService, GroupEntity?>
  createElement() {
    return _GroupServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupServiceProvider && other.groupId == groupId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GroupServiceRef on AutoDisposeStreamNotifierProviderRef<GroupEntity?> {
  /// The parameter `groupId` of this provider.
  String get groupId;
}

class _GroupServiceProviderElement
    extends AutoDisposeStreamNotifierProviderElement<GroupService, GroupEntity?>
    with GroupServiceRef {
  _GroupServiceProviderElement(super.provider);

  @override
  String get groupId => (origin as GroupServiceProvider).groupId;
}

String _$userGroupServiceHash() => r'09b519edc51d9931bfa8ad99a5c93fb44f28908e';

/// See also [UserGroupService].
@ProviderFor(UserGroupService)
final userGroupServiceProvider =
    AutoDisposeStreamNotifierProvider<
      UserGroupService,
      List<GroupEntity>
    >.internal(
      UserGroupService.new,
      name: r'userGroupServiceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$userGroupServiceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$UserGroupService = AutoDisposeStreamNotifier<List<GroupEntity>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
