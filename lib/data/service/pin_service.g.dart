// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$activatedPinsHash() => r'9573209725906800de2b5007857da8873c02f5b6';

/// See also [activatedPins].
@ProviderFor(activatedPins)
final activatedPinsProvider =
    AutoDisposeFutureProvider<Set<LocalPinDto>>.internal(
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
typedef ActivatedPinsRef = AutoDisposeFutureProviderRef<Set<LocalPinDto>>;
String _$activatedPinsWithoutLoadingHash() =>
    r'963dd78336b37523f60edb3a6781a0fca960ef4a';

/// See also [activatedPinsWithoutLoading].
@ProviderFor(activatedPinsWithoutLoading)
final activatedPinsWithoutLoadingProvider =
    AutoDisposeProvider<Set<LocalPinDto>>.internal(
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
typedef ActivatedPinsWithoutLoadingRef
    = AutoDisposeProviderRef<Set<LocalPinDto>>;
String _$sortedActivatedPinsHash() =>
    r'b7ae537c50ec211ab28a4700ca28060c8891fc88';

/// See also [sortedActivatedPins].
@ProviderFor(sortedActivatedPins)
final sortedActivatedPinsProvider =
    AutoDisposeFutureProvider<List<LocalPinDto>>.internal(
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
typedef SortedActivatedPinsRef
    = AutoDisposeFutureProviderRef<List<LocalPinDto>>;
String _$sortedGroupPinsHash() => r'23dbccfee5ac1e9dd3c262c0bcb63e500539867a';

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

/// See also [sortedGroupPins].
@ProviderFor(sortedGroupPins)
const sortedGroupPinsProvider = SortedGroupPinsFamily();

/// See also [sortedGroupPins].
class SortedGroupPinsFamily extends Family<AsyncValue<List<LocalPinDto>?>> {
  /// See also [sortedGroupPins].
  const SortedGroupPinsFamily();

  /// See also [sortedGroupPins].
  SortedGroupPinsProvider call(
    String groupId,
  ) {
    return SortedGroupPinsProvider(
      groupId,
    );
  }

  @override
  SortedGroupPinsProvider getProviderOverride(
    covariant SortedGroupPinsProvider provider,
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
  String? get name => r'sortedGroupPinsProvider';
}

/// See also [sortedGroupPins].
class SortedGroupPinsProvider
    extends AutoDisposeFutureProvider<List<LocalPinDto>?> {
  /// See also [sortedGroupPins].
  SortedGroupPinsProvider(
    String groupId,
  ) : this._internal(
          (ref) => sortedGroupPins(
            ref as SortedGroupPinsRef,
            groupId,
          ),
          from: sortedGroupPinsProvider,
          name: r'sortedGroupPinsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
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
    FutureOr<List<LocalPinDto>?> Function(SortedGroupPinsRef provider) create,
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
  AutoDisposeFutureProviderElement<List<LocalPinDto>?> createElement() {
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
mixin SortedGroupPinsRef on AutoDisposeFutureProviderRef<List<LocalPinDto>?> {
  /// The parameter `groupId` of this provider.
  String get groupId;
}

class _SortedGroupPinsProviderElement
    extends AutoDisposeFutureProviderElement<List<LocalPinDto>?>
    with SortedGroupPinsRef {
  _SortedGroupPinsProviderElement(super.provider);

  @override
  String get groupId => (origin as SortedGroupPinsProvider).groupId;
}

String _$pinsSortedByDistanceHash() =>
    r'bc056691a0787e10359700bd7ac8645c4a89e2ef';

/// See also [pinsSortedByDistance].
@ProviderFor(pinsSortedByDistance)
final pinsSortedByDistanceProvider = AutoDisposeProvider<
    AsyncValue<List<MapEntry<LocalPinDto, double>>>>.internal(
  pinsSortedByDistance,
  name: r'pinsSortedByDistanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pinsSortedByDistanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PinsSortedByDistanceRef
    = AutoDisposeProviderRef<AsyncValue<List<MapEntry<LocalPinDto, double>>>>;
String _$pinServiceHash() => r'71530e9877886b253fa9867db37a29ef080daf2d';

abstract class _$PinService
    extends BuildlessAutoDisposeAsyncNotifier<Set<LocalPinDto>> {
  late final String groupId;

  FutureOr<Set<LocalPinDto>> build(
    String groupId,
  );
}

/// See also [PinService].
@ProviderFor(PinService)
const pinServiceProvider = PinServiceFamily();

/// See also [PinService].
class PinServiceFamily extends Family<AsyncValue<Set<LocalPinDto>>> {
  /// See also [PinService].
  const PinServiceFamily();

  /// See also [PinService].
  PinServiceProvider call(
    String groupId,
  ) {
    return PinServiceProvider(
      groupId,
    );
  }

  @override
  PinServiceProvider getProviderOverride(
    covariant PinServiceProvider provider,
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
  String? get name => r'pinServiceProvider';
}

/// See also [PinService].
class PinServiceProvider
    extends AutoDisposeAsyncNotifierProviderImpl<PinService, Set<LocalPinDto>> {
  /// See also [PinService].
  PinServiceProvider(
    String groupId,
  ) : this._internal(
          () => PinService()..groupId = groupId,
          from: pinServiceProvider,
          name: r'pinServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pinServiceHash,
          dependencies: PinServiceFamily._dependencies,
          allTransitiveDependencies:
              PinServiceFamily._allTransitiveDependencies,
          groupId: groupId,
        );

  PinServiceProvider._internal(
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
  FutureOr<Set<LocalPinDto>> runNotifierBuild(
    covariant PinService notifier,
  ) {
    return notifier.build(
      groupId,
    );
  }

  @override
  Override overrideWith(PinService Function() create) {
    return ProviderOverride(
      origin: this,
      override: PinServiceProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<PinService, Set<LocalPinDto>>
      createElement() {
    return _PinServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PinServiceProvider && other.groupId == groupId;
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
mixin PinServiceRef on AutoDisposeAsyncNotifierProviderRef<Set<LocalPinDto>> {
  /// The parameter `groupId` of this provider.
  String get groupId;
}

class _PinServiceProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<PinService,
        Set<LocalPinDto>> with PinServiceRef {
  _PinServiceProviderElement(super.provider);

  @override
  String get groupId => (origin as PinServiceProvider).groupId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
