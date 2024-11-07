// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pinLikeHash() => r'b618a5f2891d17881641814be354b93a4c0745a9';

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

/// See also [pinLike].
@ProviderFor(pinLike)
const pinLikeProvider = PinLikeFamily();

/// See also [pinLike].
class PinLikeFamily extends Family<AsyncValue<PinLikeDto>> {
  /// See also [pinLike].
  const PinLikeFamily();

  /// See also [pinLike].
  PinLikeProvider call(
    String pinId,
  ) {
    return PinLikeProvider(
      pinId,
    );
  }

  @override
  PinLikeProvider getProviderOverride(
    covariant PinLikeProvider provider,
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
  String? get name => r'pinLikeProvider';
}

/// See also [pinLike].
class PinLikeProvider extends AutoDisposeFutureProvider<PinLikeDto> {
  /// See also [pinLike].
  PinLikeProvider(
    String pinId,
  ) : this._internal(
          (ref) => pinLike(
            ref as PinLikeRef,
            pinId,
          ),
          from: pinLikeProvider,
          name: r'pinLikeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pinLikeHash,
          dependencies: PinLikeFamily._dependencies,
          allTransitiveDependencies: PinLikeFamily._allTransitiveDependencies,
          pinId: pinId,
        );

  PinLikeProvider._internal(
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
    FutureOr<PinLikeDto> Function(PinLikeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PinLikeProvider._internal(
        (ref) => create(ref as PinLikeRef),
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
  AutoDisposeFutureProviderElement<PinLikeDto> createElement() {
    return _PinLikeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PinLikeProvider && other.pinId == pinId;
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
mixin PinLikeRef on AutoDisposeFutureProviderRef<PinLikeDto> {
  /// The parameter `pinId` of this provider.
  String get pinId;
}

class _PinLikeProviderElement
    extends AutoDisposeFutureProviderElement<PinLikeDto> with PinLikeRef {
  _PinLikeProviderElement(super.provider);

  @override
  String get pinId => (origin as PinLikeProvider).pinId;
}

String _$likeServiceHash() => r'587e4976366772feba3b3de28cc71b2458a8ed82';

/// See also [LikeService].
@ProviderFor(LikeService)
final likeServiceProvider =
    NotifierProvider<LikeService, Map<String, PinLikeDto>>.internal(
  LikeService.new,
  name: r'likeServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$likeServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LikeService = Notifier<Map<String, PinLikeDto>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
