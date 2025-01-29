// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getPinImageInfoHash() => r'7b2bc5df14f355670077b6886432a86ee0d5cec2';

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

/// See also [getPinImageInfo].
@ProviderFor(getPinImageInfo)
const getPinImageInfoProvider = GetPinImageInfoFamily();

/// See also [getPinImageInfo].
class GetPinImageInfoFamily extends Family<AsyncValue<PinImageInfo?>> {
  /// See also [getPinImageInfo].
  const GetPinImageInfoFamily();

  /// See also [getPinImageInfo].
  GetPinImageInfoProvider call(
    LocalPinDto pinDto,
  ) {
    return GetPinImageInfoProvider(
      pinDto,
    );
  }

  @override
  GetPinImageInfoProvider getProviderOverride(
    covariant GetPinImageInfoProvider provider,
  ) {
    return call(
      provider.pinDto,
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
  String? get name => r'getPinImageInfoProvider';
}

/// See also [getPinImageInfo].
class GetPinImageInfoProvider extends AutoDisposeFutureProvider<PinImageInfo?> {
  /// See also [getPinImageInfo].
  GetPinImageInfoProvider(
    LocalPinDto pinDto,
  ) : this._internal(
          (ref) => getPinImageInfo(
            ref as GetPinImageInfoRef,
            pinDto,
          ),
          from: getPinImageInfoProvider,
          name: r'getPinImageInfoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getPinImageInfoHash,
          dependencies: GetPinImageInfoFamily._dependencies,
          allTransitiveDependencies:
              GetPinImageInfoFamily._allTransitiveDependencies,
          pinDto: pinDto,
        );

  GetPinImageInfoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pinDto,
  }) : super.internal();

  final LocalPinDto pinDto;

  @override
  Override overrideWith(
    FutureOr<PinImageInfo?> Function(GetPinImageInfoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetPinImageInfoProvider._internal(
        (ref) => create(ref as GetPinImageInfoRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pinDto: pinDto,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PinImageInfo?> createElement() {
    return _GetPinImageInfoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetPinImageInfoProvider && other.pinDto == pinDto;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pinDto.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetPinImageInfoRef on AutoDisposeFutureProviderRef<PinImageInfo?> {
  /// The parameter `pinDto` of this provider.
  LocalPinDto get pinDto;
}

class _GetPinImageInfoProviderElement
    extends AutoDisposeFutureProviderElement<PinImageInfo?>
    with GetPinImageInfoRef {
  _GetPinImageInfoProviderElement(super.provider);

  @override
  LocalPinDto get pinDto => (origin as GetPinImageInfoProvider).pinDto;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
