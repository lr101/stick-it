// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_json_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$zoomGeoLevelHash() => r'02c843dd153e196be180e495f78910f26ffcc17a';

/// See also [zoomGeoLevel].
@ProviderFor(zoomGeoLevel)
final zoomGeoLevelProvider = AutoDisposeProvider<int?>.internal(
  zoomGeoLevel,
  name: r'zoomGeoLevelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$zoomGeoLevelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ZoomGeoLevelRef = AutoDisposeProviderRef<int?>;
String _$zoomGidHash() => r'63e2ba1434ffa4f2807b245a03d840c9e835a579';

/// See also [zoomGid].
@ProviderFor(zoomGid)
final zoomGidProvider =
    AutoDisposeProvider<(String? gid, String? name)>.internal(
      zoomGid,
      name: r'zoomGidProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$zoomGidHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ZoomGidRef = AutoDisposeProviderRef<(String? gid, String? name)>;
String _$groupRankingHash() => r'42a8289ab65000e9f861e4cdaa6978e417d9a098';

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

/// See also [groupRanking].
@ProviderFor(groupRanking)
const groupRankingProvider = GroupRankingFamily();

/// See also [groupRanking].
class GroupRankingFamily
    extends Family<AsyncValue<List<GroupRankingDtoInner>?>> {
  /// See also [groupRanking].
  const GroupRankingFamily();

  /// See also [groupRanking].
  GroupRankingProvider call(String gid) {
    return GroupRankingProvider(gid);
  }

  @override
  GroupRankingProvider getProviderOverride(
    covariant GroupRankingProvider provider,
  ) {
    return call(provider.gid);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'groupRankingProvider';
}

/// See also [groupRanking].
class GroupRankingProvider
    extends AutoDisposeFutureProvider<List<GroupRankingDtoInner>?> {
  /// See also [groupRanking].
  GroupRankingProvider(String gid)
    : this._internal(
        (ref) => groupRanking(ref as GroupRankingRef, gid),
        from: groupRankingProvider,
        name: r'groupRankingProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$groupRankingHash,
        dependencies: GroupRankingFamily._dependencies,
        allTransitiveDependencies:
            GroupRankingFamily._allTransitiveDependencies,
        gid: gid,
      );

  GroupRankingProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.gid,
  }) : super.internal();

  final String gid;

  @override
  Override overrideWith(
    FutureOr<List<GroupRankingDtoInner>?> Function(GroupRankingRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GroupRankingProvider._internal(
        (ref) => create(ref as GroupRankingRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        gid: gid,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<GroupRankingDtoInner>?>
  createElement() {
    return _GroupRankingProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupRankingProvider && other.gid == gid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, gid.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GroupRankingRef
    on AutoDisposeFutureProviderRef<List<GroupRankingDtoInner>?> {
  /// The parameter `gid` of this provider.
  String get gid;
}

class _GroupRankingProviderElement
    extends AutoDisposeFutureProviderElement<List<GroupRankingDtoInner>?>
    with GroupRankingRef {
  _GroupRankingProviderElement(super.provider);

  @override
  String get gid => (origin as GroupRankingProvider).gid;
}

String _$userRankingHash() => r'4cae3645485f234acde3df80e53fc4816109cd24';

/// See also [userRanking].
@ProviderFor(userRanking)
const userRankingProvider = UserRankingFamily();

/// See also [userRanking].
class UserRankingFamily extends Family<AsyncValue<List<UserRankingDtoInner>?>> {
  /// See also [userRanking].
  const UserRankingFamily();

  /// See also [userRanking].
  UserRankingProvider call(String gid) {
    return UserRankingProvider(gid);
  }

  @override
  UserRankingProvider getProviderOverride(
    covariant UserRankingProvider provider,
  ) {
    return call(provider.gid);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'userRankingProvider';
}

/// See also [userRanking].
class UserRankingProvider
    extends AutoDisposeFutureProvider<List<UserRankingDtoInner>?> {
  /// See also [userRanking].
  UserRankingProvider(String gid)
    : this._internal(
        (ref) => userRanking(ref as UserRankingRef, gid),
        from: userRankingProvider,
        name: r'userRankingProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$userRankingHash,
        dependencies: UserRankingFamily._dependencies,
        allTransitiveDependencies: UserRankingFamily._allTransitiveDependencies,
        gid: gid,
      );

  UserRankingProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.gid,
  }) : super.internal();

  final String gid;

  @override
  Override overrideWith(
    FutureOr<List<UserRankingDtoInner>?> Function(UserRankingRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserRankingProvider._internal(
        (ref) => create(ref as UserRankingRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        gid: gid,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<UserRankingDtoInner>?> createElement() {
    return _UserRankingProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserRankingProvider && other.gid == gid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, gid.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UserRankingRef
    on AutoDisposeFutureProviderRef<List<UserRankingDtoInner>?> {
  /// The parameter `gid` of this provider.
  String get gid;
}

class _UserRankingProviderElement
    extends AutoDisposeFutureProviderElement<List<UserRankingDtoInner>?>
    with UserRankingRef {
  _UserRankingProviderElement(super.provider);

  @override
  String get gid => (origin as UserRankingProvider).gid;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
