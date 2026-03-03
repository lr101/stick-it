// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

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
    r'54a9a6471cfa0c997eed015d7c982a4e3934ac0a';

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

String _$groupServiceHash() => r'ac6bd2fec66c58179e3d1be8d83f99121f8fd1f0';

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

String _$userGroupServiceHash() => r'd7fdde20406f1eb516ef94ddc85e42774775bc17';

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
