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
String _$sortedActivatedPinsHash() =>
    r'7b9ef2ea1306649fb3be28ac1f08df945c14b502';

/// See also [sortedActivatedPins].
@ProviderFor(sortedActivatedPins)
final sortedActivatedPinsProvider =
    AutoDisposeProvider<AsyncValue<List<LocalPinDto>>>.internal(
  sortedActivatedPins,
  name: r'sortedActivatedPinsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sortedActivatedPinsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SortedActivatedPinsRef
    = AutoDisposeProviderRef<AsyncValue<List<LocalPinDto>>>;
String _$sortedGroupPinsHash() => r'3984969e54f4f7eb5328594c3ed74cde7695360d';

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
    extends AutoDisposeProvider<AsyncValue<List<LocalPinDto>>> {
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
    AsyncValue<List<LocalPinDto>> Function(SortedGroupPinsRef provider) create,
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
  AutoDisposeProviderElement<AsyncValue<List<LocalPinDto>>> createElement() {
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

mixin SortedGroupPinsRef
    on AutoDisposeProviderRef<AsyncValue<List<LocalPinDto>>> {
  /// The parameter `groupId` of this provider.
  String get groupId;
}

class _SortedGroupPinsProviderElement
    extends AutoDisposeProviderElement<AsyncValue<List<LocalPinDto>>>
    with SortedGroupPinsRef {
  _SortedGroupPinsProviderElement(super.provider);

  @override
  String get groupId => (origin as SortedGroupPinsProvider).groupId;
}

String _$sortedUserPinsHash() => r'21dde61547bb15965dec6ffd66fa24dc197fb604';

/// See also [sortedUserPins].
@ProviderFor(sortedUserPins)
final sortedUserPinsProvider =
    AutoDisposeProvider<AsyncValue<List<LocalPinDto>>>.internal(
  sortedUserPins,
  name: r'sortedUserPinsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sortedUserPinsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SortedUserPinsRef
    = AutoDisposeProviderRef<AsyncValue<List<LocalPinDto>>>;
String _$pinServiceHash() => r'852dd3012264ac3cad907d4d827717aef1c0d4c0';

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
