// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$activatedPinsHash() => r'f9a8f965832f71afe27a7552bcf8a25b4543e984';

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

typedef ActivatedPinsRef
    = AutoDisposeProviderRef<AsyncValue<List<LocalPinDto>>>;
String _$activatedPinsWithoutLoadingHash() =>
    r'd21f324acfb22d4cac0578ac017ae62cb4eb7117';

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

typedef ActivatedPinsWithoutLoadingRef
    = AutoDisposeProviderRef<AsyncValue<List<LocalPinDto>>>;
String _$sortedActivatedPinsHash() =>
    r'30f1791af810e64bac60225248a4cd2afc1522e5';

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

typedef SortedActivatedPinsRef
    = AutoDisposeFutureProviderRef<List<LocalPinDto>>;
String _$sortedGroupPinsHash() => r'3cce5480e31b82639bb97162d197a333f9d0b75a';

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
class SortedGroupPinsFamily extends Family<AsyncValue<List<LocalPinDto>>> {
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
    extends AutoDisposeFutureProvider<List<LocalPinDto>> {
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
    FutureOr<List<LocalPinDto>> Function(SortedGroupPinsRef provider) create,
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
  AutoDisposeFutureProviderElement<List<LocalPinDto>> createElement() {
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

mixin SortedGroupPinsRef on AutoDisposeFutureProviderRef<List<LocalPinDto>> {
  /// The parameter `groupId` of this provider.
  String get groupId;
}

class _SortedGroupPinsProviderElement
    extends AutoDisposeFutureProviderElement<List<LocalPinDto>>
    with SortedGroupPinsRef {
  _SortedGroupPinsProviderElement(super.provider);

  @override
  String get groupId => (origin as SortedGroupPinsProvider).groupId;
}

String _$sortedUserPinsHash() => r'f749a7772a8913752c4df0c49c2090534251bc49';

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

typedef SortedUserPinsRef = AutoDisposeFutureProviderRef<List<LocalPinDto>>;
String _$pinsSortedByDistanceHash() =>
    r'c4d437b50b5e3d83f78b0a926abe9782f7ec080f';

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

typedef PinsSortedByDistanceRef
    = AutoDisposeProviderRef<AsyncValue<List<MapEntry<LocalPinDto, double>>>>;
String _$pinServiceHash() => r'9fda6be8568e2bd5db9171afba65b8d3b346490f';

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
