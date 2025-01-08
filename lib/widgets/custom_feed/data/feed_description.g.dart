// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_description.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$feedDescriptionHash() => r'4e20e4c6792428ebd9a65a43cfda7fabb4928471';

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

abstract class _$FeedDescription extends BuildlessAutoDisposeNotifier<bool> {
  late final String pinId;

  bool build(
    String pinId,
  );
}

/// See also [FeedDescription].
@ProviderFor(FeedDescription)
const feedDescriptionProvider = FeedDescriptionFamily();

/// See also [FeedDescription].
class FeedDescriptionFamily extends Family<bool> {
  /// See also [FeedDescription].
  const FeedDescriptionFamily();

  /// See also [FeedDescription].
  FeedDescriptionProvider call(
    String pinId,
  ) {
    return FeedDescriptionProvider(
      pinId,
    );
  }

  @override
  FeedDescriptionProvider getProviderOverride(
    covariant FeedDescriptionProvider provider,
  ) {
    return call(
      provider.pinId,
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
  String? get name => r'feedDescriptionProvider';
}

/// See also [FeedDescription].
class FeedDescriptionProvider
    extends AutoDisposeNotifierProviderImpl<FeedDescription, bool> {
  /// See also [FeedDescription].
  FeedDescriptionProvider(
    String pinId,
  ) : this._internal(
          () => FeedDescription()..pinId = pinId,
          from: feedDescriptionProvider,
          name: r'feedDescriptionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$feedDescriptionHash,
          dependencies: FeedDescriptionFamily._dependencies,
          allTransitiveDependencies:
              FeedDescriptionFamily._allTransitiveDependencies,
          pinId: pinId,
        );

  FeedDescriptionProvider._internal(
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
  bool runNotifierBuild(
    covariant FeedDescription notifier,
  ) {
    return notifier.build(
      pinId,
    );
  }

  @override
  Override overrideWith(FeedDescription Function() create) {
    return ProviderOverride(
      origin: this,
      override: FeedDescriptionProvider._internal(
        () => create()..pinId = pinId,
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
  AutoDisposeNotifierProviderElement<FeedDescription, bool> createElement() {
    return _FeedDescriptionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FeedDescriptionProvider && other.pinId == pinId;
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
mixin FeedDescriptionRef on AutoDisposeNotifierProviderRef<bool> {
  /// The parameter `pinId` of this provider.
  String get pinId;
}

class _FeedDescriptionProviderElement
    extends AutoDisposeNotifierProviderElement<FeedDescription, bool>
    with FeedDescriptionRef {
  _FeedDescriptionProviderElement(super.provider);

  @override
  String get pinId => (origin as FeedDescriptionProvider).pinId;
}

String _$feedDescriptionHeightHash() =>
    r'663449be5326eeaa5b08380e257fe05f2ad62d70';

abstract class _$FeedDescriptionHeight
    extends BuildlessAutoDisposeNotifier<double> {
  late final LocalPinDto pin;

  double build(
    LocalPinDto pin,
  );
}

/// See also [FeedDescriptionHeight].
@ProviderFor(FeedDescriptionHeight)
const feedDescriptionHeightProvider = FeedDescriptionHeightFamily();

/// See also [FeedDescriptionHeight].
class FeedDescriptionHeightFamily extends Family<double> {
  /// See also [FeedDescriptionHeight].
  const FeedDescriptionHeightFamily();

  /// See also [FeedDescriptionHeight].
  FeedDescriptionHeightProvider call(
    LocalPinDto pin,
  ) {
    return FeedDescriptionHeightProvider(
      pin,
    );
  }

  @override
  FeedDescriptionHeightProvider getProviderOverride(
    covariant FeedDescriptionHeightProvider provider,
  ) {
    return call(
      provider.pin,
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
  String? get name => r'feedDescriptionHeightProvider';
}

/// See also [FeedDescriptionHeight].
class FeedDescriptionHeightProvider
    extends AutoDisposeNotifierProviderImpl<FeedDescriptionHeight, double> {
  /// See also [FeedDescriptionHeight].
  FeedDescriptionHeightProvider(
    LocalPinDto pin,
  ) : this._internal(
          () => FeedDescriptionHeight()..pin = pin,
          from: feedDescriptionHeightProvider,
          name: r'feedDescriptionHeightProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$feedDescriptionHeightHash,
          dependencies: FeedDescriptionHeightFamily._dependencies,
          allTransitiveDependencies:
              FeedDescriptionHeightFamily._allTransitiveDependencies,
          pin: pin,
        );

  FeedDescriptionHeightProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pin,
  }) : super.internal();

  final LocalPinDto pin;

  @override
  double runNotifierBuild(
    covariant FeedDescriptionHeight notifier,
  ) {
    return notifier.build(
      pin,
    );
  }

  @override
  Override overrideWith(FeedDescriptionHeight Function() create) {
    return ProviderOverride(
      origin: this,
      override: FeedDescriptionHeightProvider._internal(
        () => create()..pin = pin,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pin: pin,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<FeedDescriptionHeight, double>
      createElement() {
    return _FeedDescriptionHeightProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FeedDescriptionHeightProvider && other.pin == pin;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pin.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FeedDescriptionHeightRef on AutoDisposeNotifierProviderRef<double> {
  /// The parameter `pin` of this provider.
  LocalPinDto get pin;
}

class _FeedDescriptionHeightProviderElement
    extends AutoDisposeNotifierProviderElement<FeedDescriptionHeight, double>
    with FeedDescriptionHeightRef {
  _FeedDescriptionHeightProviderElement(super.provider);

  @override
  LocalPinDto get pin => (origin as FeedDescriptionHeightProvider).pin;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
