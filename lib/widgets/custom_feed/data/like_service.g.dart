// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$likeServiceHash() => r'671a94518f1da680520c133e95c17c65a6c4f04f';

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

abstract class _$LikeService
    extends BuildlessAutoDisposeAsyncNotifier<PinLikeDto> {
  late final String pinId;

  FutureOr<PinLikeDto> build(
    String pinId,
  );
}

/// See also [LikeService].
@ProviderFor(LikeService)
const likeServiceProvider = LikeServiceFamily();

/// See also [LikeService].
class LikeServiceFamily extends Family<AsyncValue<PinLikeDto>> {
  /// See also [LikeService].
  const LikeServiceFamily();

  /// See also [LikeService].
  LikeServiceProvider call(
    String pinId,
  ) {
    return LikeServiceProvider(
      pinId,
    );
  }

  @override
  LikeServiceProvider getProviderOverride(
    covariant LikeServiceProvider provider,
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
  String? get name => r'likeServiceProvider';
}

/// See also [LikeService].
class LikeServiceProvider
    extends AutoDisposeAsyncNotifierProviderImpl<LikeService, PinLikeDto> {
  /// See also [LikeService].
  LikeServiceProvider(
    String pinId,
  ) : this._internal(
          () => LikeService()..pinId = pinId,
          from: likeServiceProvider,
          name: r'likeServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$likeServiceHash,
          dependencies: LikeServiceFamily._dependencies,
          allTransitiveDependencies:
              LikeServiceFamily._allTransitiveDependencies,
          pinId: pinId,
        );

  LikeServiceProvider._internal(
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
  FutureOr<PinLikeDto> runNotifierBuild(
    covariant LikeService notifier,
  ) {
    return notifier.build(
      pinId,
    );
  }

  @override
  Override overrideWith(LikeService Function() create) {
    return ProviderOverride(
      origin: this,
      override: LikeServiceProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<LikeService, PinLikeDto>
      createElement() {
    return _LikeServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LikeServiceProvider && other.pinId == pinId;
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
mixin LikeServiceRef on AutoDisposeAsyncNotifierProviderRef<PinLikeDto> {
  /// The parameter `pinId` of this provider.
  String get pinId;
}

class _LikeServiceProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<LikeService, PinLikeDto>
    with LikeServiceRef {
  _LikeServiceProviderElement(super.provider);

  @override
  String get pinId => (origin as LikeServiceProvider).pinId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
