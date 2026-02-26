// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pinByIdHash() => r'1a1e4f501efa48ab7da6797122bd08e222d42fd5';

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

/// See also [pinById].
@ProviderFor(pinById)
const pinByIdProvider = PinByIdFamily();

/// See also [pinById].
class PinByIdFamily extends Family<AsyncValue<PinEntity?>> {
  /// See also [pinById].
  const PinByIdFamily();

  /// See also [pinById].
  PinByIdProvider call(String pinId) {
    return PinByIdProvider(pinId);
  }

  @override
  PinByIdProvider getProviderOverride(covariant PinByIdProvider provider) {
    return call(provider.pinId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'pinByIdProvider';
}

/// See also [pinById].
class PinByIdProvider extends AutoDisposeStreamProvider<PinEntity?> {
  /// See also [pinById].
  PinByIdProvider(String pinId)
    : this._internal(
        (ref) => pinById(ref as PinByIdRef, pinId),
        from: pinByIdProvider,
        name: r'pinByIdProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$pinByIdHash,
        dependencies: PinByIdFamily._dependencies,
        allTransitiveDependencies: PinByIdFamily._allTransitiveDependencies,
        pinId: pinId,
      );

  PinByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pinId,
  }) : super.internal();

  final String pinId;

  @override
  Override overrideWith(
    Stream<PinEntity?> Function(PinByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PinByIdProvider._internal(
        (ref) => create(ref as PinByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pinId: pinId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<PinEntity?> createElement() {
    return _PinByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PinByIdProvider && other.pinId == pinId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pinId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PinByIdRef on AutoDisposeStreamProviderRef<PinEntity?> {
  /// The parameter `pinId` of this provider.
  String get pinId;
}

class _PinByIdProviderElement
    extends AutoDisposeStreamProviderElement<PinEntity?>
    with PinByIdRef {
  _PinByIdProviderElement(super.provider);

  @override
  String get pinId => (origin as PinByIdProvider).pinId;
}

String _$pinServiceHash() => r'125f27d3d84ea8c990785b11cf252759f4176706';

/// See also [pinService].
@ProviderFor(pinService)
final pinServiceProvider = Provider<PinService>.internal(
  pinService,
  name: r'pinServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pinServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PinServiceRef = ProviderRef<PinService>;
String _$activatedPinsHash() => r'08f0dc0b824ea3827ca6421dde19930763503783';

/// See also [activatedPins].
@ProviderFor(activatedPins)
final activatedPinsProvider =
    AutoDisposeFutureProvider<Set<PinEntity>>.internal(
      activatedPins,
      name: r'activatedPinsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$activatedPinsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ActivatedPinsRef = AutoDisposeFutureProviderRef<Set<PinEntity>>;
String _$activatedPinsWithoutLoadingHash() =>
    r'6020447e25360c0eb88bfebca6404816dabdc570';

/// See also [activatedPinsWithoutLoading].
@ProviderFor(activatedPinsWithoutLoading)
final activatedPinsWithoutLoadingProvider =
    AutoDisposeProvider<Set<PinEntity>>.internal(
      activatedPinsWithoutLoading,
      name: r'activatedPinsWithoutLoadingProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$activatedPinsWithoutLoadingHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ActivatedPinsWithoutLoadingRef = AutoDisposeProviderRef<Set<PinEntity>>;
String _$sortedActivatedPinsHash() =>
    r'27a2653d9890640454aff23540f37a48c7658814';

/// See also [sortedActivatedPins].
@ProviderFor(sortedActivatedPins)
final sortedActivatedPinsProvider =
    AutoDisposeFutureProvider<List<PinEntity>>.internal(
      sortedActivatedPins,
      name: r'sortedActivatedPinsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$sortedActivatedPinsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SortedActivatedPinsRef = AutoDisposeFutureProviderRef<List<PinEntity>>;
String _$sortedGroupPinsHash() => r'b50b036f312a2b0383c9e505a14257fd8cdecfbf';

/// See also [sortedGroupPins].
@ProviderFor(sortedGroupPins)
const sortedGroupPinsProvider = SortedGroupPinsFamily();

/// See also [sortedGroupPins].
class SortedGroupPinsFamily extends Family<AsyncValue<List<PinEntity>?>> {
  /// See also [sortedGroupPins].
  const SortedGroupPinsFamily();

  /// See also [sortedGroupPins].
  SortedGroupPinsProvider call(String groupId) {
    return SortedGroupPinsProvider(groupId);
  }

  @override
  SortedGroupPinsProvider getProviderOverride(
    covariant SortedGroupPinsProvider provider,
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
  String? get name => r'sortedGroupPinsProvider';
}

/// See also [sortedGroupPins].
class SortedGroupPinsProvider
    extends AutoDisposeFutureProvider<List<PinEntity>?> {
  /// See also [sortedGroupPins].
  SortedGroupPinsProvider(String groupId)
    : this._internal(
        (ref) => sortedGroupPins(ref as SortedGroupPinsRef, groupId),
        from: sortedGroupPinsProvider,
        name: r'sortedGroupPinsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$sortedGroupPinsHash,
        dependencies: SortedGroupPinsFamily._dependencies,
        allTransitiveDependencies:
            SortedGroupPinsFamily._allTransitiveDependencies,
        groupId: groupId,
      );

  SortedGroupPinsProvider._internal(
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
    FutureOr<List<PinEntity>?> Function(SortedGroupPinsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SortedGroupPinsProvider._internal(
        (ref) => create(ref as SortedGroupPinsRef),
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
  AutoDisposeFutureProviderElement<List<PinEntity>?> createElement() {
    return _SortedGroupPinsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SortedGroupPinsProvider && other.groupId == groupId;
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
mixin SortedGroupPinsRef on AutoDisposeFutureProviderRef<List<PinEntity>?> {
  /// The parameter `groupId` of this provider.
  String get groupId;
}

class _SortedGroupPinsProviderElement
    extends AutoDisposeFutureProviderElement<List<PinEntity>?>
    with SortedGroupPinsRef {
  _SortedGroupPinsProviderElement(super.provider);

  @override
  String get groupId => (origin as SortedGroupPinsProvider).groupId;
}

String _$pinUserServiceHash() => r'fae6ae8bf42755812e7fb6157ad47e56454cd776';

abstract class _$PinUserService
    extends BuildlessAutoDisposeStreamNotifier<List<PinEntity>> {
  late final String userId;

  Stream<List<PinEntity>> build(String userId);
}

/// See also [PinUserService].
@ProviderFor(PinUserService)
const pinUserServiceProvider = PinUserServiceFamily();

/// See also [PinUserService].
class PinUserServiceFamily extends Family<AsyncValue<List<PinEntity>>> {
  /// See also [PinUserService].
  const PinUserServiceFamily();

  /// See also [PinUserService].
  PinUserServiceProvider call(String userId) {
    return PinUserServiceProvider(userId);
  }

  @override
  PinUserServiceProvider getProviderOverride(
    covariant PinUserServiceProvider provider,
  ) {
    return call(provider.userId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'pinUserServiceProvider';
}

/// See also [PinUserService].
class PinUserServiceProvider
    extends
        AutoDisposeStreamNotifierProviderImpl<PinUserService, List<PinEntity>> {
  /// See also [PinUserService].
  PinUserServiceProvider(String userId)
    : this._internal(
        () => PinUserService()..userId = userId,
        from: pinUserServiceProvider,
        name: r'pinUserServiceProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$pinUserServiceHash,
        dependencies: PinUserServiceFamily._dependencies,
        allTransitiveDependencies:
            PinUserServiceFamily._allTransitiveDependencies,
        userId: userId,
      );

  PinUserServiceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  Stream<List<PinEntity>> runNotifierBuild(covariant PinUserService notifier) {
    return notifier.build(userId);
  }

  @override
  Override overrideWith(PinUserService Function() create) {
    return ProviderOverride(
      origin: this,
      override: PinUserServiceProvider._internal(
        () => create()..userId = userId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<PinUserService, List<PinEntity>>
  createElement() {
    return _PinUserServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PinUserServiceProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PinUserServiceRef
    on AutoDisposeStreamNotifierProviderRef<List<PinEntity>> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _PinUserServiceProviderElement
    extends
        AutoDisposeStreamNotifierProviderElement<
          PinUserService,
          List<PinEntity>
        >
    with PinUserServiceRef {
  _PinUserServiceProviderElement(super.provider);

  @override
  String get userId => (origin as PinUserServiceProvider).userId;
}

String _$pinGroupServiceHash() => r'cfea71e6e44811698a17c4c367edbc9cba4063b4';

abstract class _$PinGroupService
    extends BuildlessAutoDisposeStreamNotifier<List<PinEntity>> {
  late final String groupId;

  Stream<List<PinEntity>> build(String groupId);
}

/// See also [PinGroupService].
@ProviderFor(PinGroupService)
const pinGroupServiceProvider = PinGroupServiceFamily();

/// See also [PinGroupService].
class PinGroupServiceFamily extends Family<AsyncValue<List<PinEntity>>> {
  /// See also [PinGroupService].
  const PinGroupServiceFamily();

  /// See also [PinGroupService].
  PinGroupServiceProvider call(String groupId) {
    return PinGroupServiceProvider(groupId);
  }

  @override
  PinGroupServiceProvider getProviderOverride(
    covariant PinGroupServiceProvider provider,
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
  String? get name => r'pinGroupServiceProvider';
}

/// See also [PinGroupService].
class PinGroupServiceProvider
    extends
        AutoDisposeStreamNotifierProviderImpl<
          PinGroupService,
          List<PinEntity>
        > {
  /// See also [PinGroupService].
  PinGroupServiceProvider(String groupId)
    : this._internal(
        () => PinGroupService()..groupId = groupId,
        from: pinGroupServiceProvider,
        name: r'pinGroupServiceProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$pinGroupServiceHash,
        dependencies: PinGroupServiceFamily._dependencies,
        allTransitiveDependencies:
            PinGroupServiceFamily._allTransitiveDependencies,
        groupId: groupId,
      );

  PinGroupServiceProvider._internal(
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
  Stream<List<PinEntity>> runNotifierBuild(covariant PinGroupService notifier) {
    return notifier.build(groupId);
  }

  @override
  Override overrideWith(PinGroupService Function() create) {
    return ProviderOverride(
      origin: this,
      override: PinGroupServiceProvider._internal(
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
  AutoDisposeStreamNotifierProviderElement<PinGroupService, List<PinEntity>>
  createElement() {
    return _PinGroupServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PinGroupServiceProvider && other.groupId == groupId;
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
mixin PinGroupServiceRef
    on AutoDisposeStreamNotifierProviderRef<List<PinEntity>> {
  /// The parameter `groupId` of this provider.
  String get groupId;
}

class _PinGroupServiceProviderElement
    extends
        AutoDisposeStreamNotifierProviderElement<
          PinGroupService,
          List<PinEntity>
        >
    with PinGroupServiceRef {
  _PinGroupServiceProviderElement(super.provider);

  @override
  String get groupId => (origin as PinGroupServiceProvider).groupId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
