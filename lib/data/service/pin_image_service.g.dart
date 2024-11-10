// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_image_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getPinImageAndFetchHash() =>
    r'6833dfdc098ff777902ac3568f08f8d19185de8b';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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

String _$pinImageServiceHash() => r'a212910a72891c5988f9bd93c6097afd1955c645';

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
