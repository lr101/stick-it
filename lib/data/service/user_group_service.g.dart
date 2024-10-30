// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_group_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$groupByIdHash() => r'4e274b4d3f8898fee63830162c0f54ecc82e7444';

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
class GroupByIdFamily extends Family<AsyncValue<LocalGroupDto?>> {
  /// See also [groupById].
  const GroupByIdFamily();

  /// See also [groupById].
  GroupByIdProvider call(
    String groupId,
  ) {
    return GroupByIdProvider(
      groupId,
    );
  }

  @override
  GroupByIdProvider getProviderOverride(
    covariant GroupByIdProvider provider,
  ) {
    return call(
      provider.groupId,
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
  String? get name => r'groupByIdProvider';
}

/// See also [groupById].
class GroupByIdProvider extends AutoDisposeFutureProvider<LocalGroupDto?> {
  /// See also [groupById].
  GroupByIdProvider(
    String groupId,
  ) : this._internal(
          (ref) => groupById(
            ref as GroupByIdRef,
            groupId,
          ),
          from: groupByIdProvider,
          name: r'groupByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
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
    FutureOr<LocalGroupDto?> Function(GroupByIdRef provider) create,
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
  AutoDisposeFutureProviderElement<LocalGroupDto?> createElement() {
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
mixin GroupByIdRef on AutoDisposeFutureProviderRef<LocalGroupDto?> {
  /// The parameter `groupId` of this provider.
  String get groupId;
}

class _GroupByIdProviderElement
    extends AutoDisposeFutureProviderElement<LocalGroupDto?> with GroupByIdRef {
  _GroupByIdProviderElement(super.provider);

  @override
  String get groupId => (origin as GroupByIdProvider).groupId;
}

String _$groupImageByIdHash() => r'73db90edcc4101c3e4fdd570aebe82964244dcf7';

/// See also [groupImageById].
@ProviderFor(groupImageById)
const groupImageByIdProvider = GroupImageByIdFamily();

/// See also [groupImageById].
class GroupImageByIdFamily extends Family<AsyncValue<Uint8List>> {
  /// See also [groupImageById].
  const GroupImageByIdFamily();

  /// See also [groupImageById].
  GroupImageByIdProvider call(
    String groupId,
  ) {
    return GroupImageByIdProvider(
      groupId,
    );
  }

  @override
  GroupImageByIdProvider getProviderOverride(
    covariant GroupImageByIdProvider provider,
  ) {
    return call(
      provider.groupId,
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
  String? get name => r'groupImageByIdProvider';
}

/// See also [groupImageById].
class GroupImageByIdProvider extends AutoDisposeFutureProvider<Uint8List> {
  /// See also [groupImageById].
  GroupImageByIdProvider(
    String groupId,
  ) : this._internal(
          (ref) => groupImageById(
            ref as GroupImageByIdRef,
            groupId,
          ),
          from: groupImageByIdProvider,
          name: r'groupImageByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$groupImageByIdHash,
          dependencies: GroupImageByIdFamily._dependencies,
          allTransitiveDependencies:
              GroupImageByIdFamily._allTransitiveDependencies,
          groupId: groupId,
        );

  GroupImageByIdProvider._internal(
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
    FutureOr<Uint8List> Function(GroupImageByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GroupImageByIdProvider._internal(
        (ref) => create(ref as GroupImageByIdRef),
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
  AutoDisposeFutureProviderElement<Uint8List> createElement() {
    return _GroupImageByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupImageByIdProvider && other.groupId == groupId;
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
mixin GroupImageByIdRef on AutoDisposeFutureProviderRef<Uint8List> {
  /// The parameter `groupId` of this provider.
  String get groupId;
}

class _GroupImageByIdProviderElement
    extends AutoDisposeFutureProviderElement<Uint8List> with GroupImageByIdRef {
  _GroupImageByIdProviderElement(super.provider);

  @override
  String get groupId => (origin as GroupImageByIdProvider).groupId;
}

String _$groupPinImageByIdHash() => r'14290fa8ed4eb10c9b9abd9d722de7fc1145911f';

/// See also [groupPinImageById].
@ProviderFor(groupPinImageById)
const groupPinImageByIdProvider = GroupPinImageByIdFamily();

/// See also [groupPinImageById].
class GroupPinImageByIdFamily extends Family<AsyncValue<Uint8List>> {
  /// See also [groupPinImageById].
  const GroupPinImageByIdFamily();

  /// See also [groupPinImageById].
  GroupPinImageByIdProvider call(
    String groupId,
  ) {
    return GroupPinImageByIdProvider(
      groupId,
    );
  }

  @override
  GroupPinImageByIdProvider getProviderOverride(
    covariant GroupPinImageByIdProvider provider,
  ) {
    return call(
      provider.groupId,
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
  String? get name => r'groupPinImageByIdProvider';
}

/// See also [groupPinImageById].
class GroupPinImageByIdProvider extends AutoDisposeFutureProvider<Uint8List> {
  /// See also [groupPinImageById].
  GroupPinImageByIdProvider(
    String groupId,
  ) : this._internal(
          (ref) => groupPinImageById(
            ref as GroupPinImageByIdRef,
            groupId,
          ),
          from: groupPinImageByIdProvider,
          name: r'groupPinImageByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$groupPinImageByIdHash,
          dependencies: GroupPinImageByIdFamily._dependencies,
          allTransitiveDependencies:
              GroupPinImageByIdFamily._allTransitiveDependencies,
          groupId: groupId,
        );

  GroupPinImageByIdProvider._internal(
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
    FutureOr<Uint8List> Function(GroupPinImageByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GroupPinImageByIdProvider._internal(
        (ref) => create(ref as GroupPinImageByIdRef),
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
  AutoDisposeFutureProviderElement<Uint8List> createElement() {
    return _GroupPinImageByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupPinImageByIdProvider && other.groupId == groupId;
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
mixin GroupPinImageByIdRef on AutoDisposeFutureProviderRef<Uint8List> {
  /// The parameter `groupId` of this provider.
  String get groupId;
}

class _GroupPinImageByIdProviderElement
    extends AutoDisposeFutureProviderElement<Uint8List>
    with GroupPinImageByIdRef {
  _GroupPinImageByIdProviderElement(super.provider);

  @override
  String get groupId => (origin as GroupPinImageByIdProvider).groupId;
}

String _$activeGroupsHash() => r'ea3e8fe0122dfeb75eece23ecb77743918277bce';

/// See also [activeGroups].
@ProviderFor(activeGroups)
final activeGroupsProvider = FutureProvider<List<LocalGroupDto>>.internal(
  activeGroups,
  name: r'activeGroupsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$activeGroupsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ActiveGroupsRef = FutureProviderRef<List<LocalGroupDto>>;
String _$userGroupServiceHash() => r'f39ff7889d0faf68bbe1bd4c4613c503cd9ea3e5';

/// See also [UserGroupService].
@ProviderFor(UserGroupService)
final userGroupServiceProvider =
    AsyncNotifierProvider<UserGroupService, List<LocalGroupDto>>.internal(
  UserGroupService.new,
  name: r'userGroupServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userGroupServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserGroupService = AsyncNotifier<List<LocalGroupDto>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
