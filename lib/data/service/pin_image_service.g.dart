// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_image_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getPinImageHash() => r'5cf31181f132328dfb990a9f26c5d1509dbdd080';

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

/// See also [getPinImage].
@ProviderFor(getPinImage)
const getPinImageProvider = GetPinImageFamily();

/// See also [getPinImage].
class GetPinImageFamily extends Family<AsyncValue<Uint8List?>> {
  /// See also [getPinImage].
  const GetPinImageFamily();

  /// See also [getPinImage].
  GetPinImageProvider call(
    String pinId,
  ) {
    return GetPinImageProvider(
      pinId,
    );
  }

  @override
  GetPinImageProvider getProviderOverride(
    covariant GetPinImageProvider provider,
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
  String? get name => r'getPinImageProvider';
}

/// See also [getPinImage].
class GetPinImageProvider extends AutoDisposeFutureProvider<Uint8List?> {
  /// See also [getPinImage].
  GetPinImageProvider(
    String pinId,
  ) : this._internal(
          (ref) => getPinImage(
            ref as GetPinImageRef,
            pinId,
          ),
          from: getPinImageProvider,
          name: r'getPinImageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getPinImageHash,
          dependencies: GetPinImageFamily._dependencies,
          allTransitiveDependencies:
              GetPinImageFamily._allTransitiveDependencies,
          pinId: pinId,
        );

  GetPinImageProvider._internal(
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
    FutureOr<Uint8List?> Function(GetPinImageRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetPinImageProvider._internal(
        (ref) => create(ref as GetPinImageRef),
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
  AutoDisposeFutureProviderElement<Uint8List?> createElement() {
    return _GetPinImageProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetPinImageProvider && other.pinId == pinId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pinId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetPinImageRef on AutoDisposeFutureProviderRef<Uint8List?> {
  /// The parameter `pinId` of this provider.
  String get pinId;
}

class _GetPinImageProviderElement
    extends AutoDisposeFutureProviderElement<Uint8List?> with GetPinImageRef {
  _GetPinImageProviderElement(super.provider);

  @override
  String get pinId => (origin as GetPinImageProvider).pinId;
}

String _$getPinImageAndFetchHash() =>
    r'a58c0f635ecea4010e3d636712f865ef6d1be12b';

/// See also [getPinImageAndFetch].
@ProviderFor(getPinImageAndFetch)
const getPinImageAndFetchProvider = GetPinImageAndFetchFamily();

/// See also [getPinImageAndFetch].
class GetPinImageAndFetchFamily extends Family<AsyncValue<Uint8List?>> {
  /// See also [getPinImageAndFetch].
  const GetPinImageAndFetchFamily();

  /// See also [getPinImageAndFetch].
  GetPinImageAndFetchProvider call(
    String pinId,
  ) {
    return GetPinImageAndFetchProvider(
      pinId,
    );
  }

  @override
  GetPinImageAndFetchProvider getProviderOverride(
    covariant GetPinImageAndFetchProvider provider,
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
  String? get name => r'getPinImageAndFetchProvider';
}

/// See also [getPinImageAndFetch].
class GetPinImageAndFetchProvider
    extends AutoDisposeFutureProvider<Uint8List?> {
  /// See also [getPinImageAndFetch].
  GetPinImageAndFetchProvider(
    String pinId,
  ) : this._internal(
          (ref) => getPinImageAndFetch(
            ref as GetPinImageAndFetchRef,
            pinId,
          ),
          from: getPinImageAndFetchProvider,
          name: r'getPinImageAndFetchProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getPinImageAndFetchHash,
          dependencies: GetPinImageAndFetchFamily._dependencies,
          allTransitiveDependencies:
              GetPinImageAndFetchFamily._allTransitiveDependencies,
          pinId: pinId,
        );

  GetPinImageAndFetchProvider._internal(
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
    FutureOr<Uint8List?> Function(GetPinImageAndFetchRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetPinImageAndFetchProvider._internal(
        (ref) => create(ref as GetPinImageAndFetchRef),
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
  AutoDisposeFutureProviderElement<Uint8List?> createElement() {
    return _GetPinImageAndFetchProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetPinImageAndFetchProvider && other.pinId == pinId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pinId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetPinImageAndFetchRef on AutoDisposeFutureProviderRef<Uint8List?> {
  /// The parameter `pinId` of this provider.
  String get pinId;
}

class _GetPinImageAndFetchProviderElement
    extends AutoDisposeFutureProviderElement<Uint8List?>
    with GetPinImageAndFetchRef {
  _GetPinImageAndFetchProviderElement(super.provider);

  @override
  String get pinId => (origin as GetPinImageAndFetchProvider).pinId;
}

String _$pinImageServiceHash() => r'4560dc31ed153629e9cbeb69cc13a5c21afbc716';

/// See also [PinImageService].
@ProviderFor(PinImageService)
final pinImageServiceProvider =
    AsyncNotifierProvider<PinImageService, Map<String, Uint8List>>.internal(
  PinImageService.new,
  name: r'pinImageServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pinImageServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PinImageService = AsyncNotifier<Map<String, Uint8List>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
