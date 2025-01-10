// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$activatedPinsHash() => r'608477fefb1d49e0e83bee1a906a7ba77f93552f';

/// See also [activatedPins].
@ProviderFor(activatedPins)
final activatedPinsProvider =
    AutoDisposeProvider<AsyncValue<List<LocalPinDto>>>.internal(
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
typedef ActivatedPinsRef
    = AutoDisposeProviderRef<AsyncValue<List<LocalPinDto>>>;
String _$activatedPinsWithoutLoadingHash() =>
    r'a5c1c8d7fdd31cac7c180c2fa402e63f26a0f9f1';

/// See also [activatedPinsWithoutLoading].
@ProviderFor(activatedPinsWithoutLoading)
final activatedPinsWithoutLoadingProvider =
    AutoDisposeProvider<AsyncValue<List<LocalPinDto>>>.internal(
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
    = AutoDisposeProviderRef<AsyncValue<List<LocalPinDto>>>;
String _$sortedActivatedPinsHash() =>
    r'21b177ae50c64702d9791d100dc58370036bf1e6';

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
String _$sortedGroupPinsHash() => r'3c280fe3d40dd8433f37d5ca7a1b22908e5be37d';

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

String _$sortedUserPinsHash() => r'd8d8d0f626f5086019d0fcddaf32e383b3d56652';

/// See also [sortedUserPins].
@ProviderFor(sortedUserPins)
final sortedUserPinsProvider =
    AutoDisposeFutureProvider<List<LocalPinDto>>.internal(
  sortedUserPins,
  name: r'sortedUserPinsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sortedUserPinsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SortedUserPinsRef = AutoDisposeFutureProviderRef<List<LocalPinDto>>;
String _$pinsSortedByDistanceHash() =>
    r'd912d94aa138bd53d85e92bf06f7ad9357be6667';

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
String _$pinServiceHash() => r'd5adb9309e4f83adb359849d6d42793ee8220f66';

abstract class _$PinService extends BuildlessAsyncNotifier<List<LocalPinDto>> {
  late final String groupId;

  FutureOr<List<LocalPinDto>> build(
    String groupId,
  );
}

/// See also [PinService].
@ProviderFor(PinService)
const pinServiceProvider = PinServiceFamily();

/// See also [PinService].
class PinServiceFamily extends Family<AsyncValue<List<LocalPinDto>>> {
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
    extends AsyncNotifierProviderImpl<PinService, List<LocalPinDto>> {
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
  FutureOr<List<LocalPinDto>> runNotifierBuild(
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
  AsyncNotifierProviderElement<PinService, List<LocalPinDto>> createElement() {
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
mixin PinServiceRef on AsyncNotifierProviderRef<List<LocalPinDto>> {
  /// The parameter `groupId` of this provider.
  String get groupId;
}

class _PinServiceProviderElement
    extends AsyncNotifierProviderElement<PinService, List<LocalPinDto>>
    with PinServiceRef {
  _PinServiceProviderElement(super.provider);

  @override
  String get groupId => (origin as PinServiceProvider).groupId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
