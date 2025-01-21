// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getUserProfileHash() => r'8aa2a1758b2e10533f189c2fa32eeaf748af5840';

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

/// See also [getUserProfile].
@ProviderFor(getUserProfile)
const getUserProfileProvider = GetUserProfileFamily();

/// See also [getUserProfile].
class GetUserProfileFamily extends Family<AsyncValue<Uint8List?>> {
  /// See also [getUserProfile].
  const GetUserProfileFamily();

  /// See also [getUserProfile].
  GetUserProfileProvider call(
    String userId,
  ) {
    return GetUserProfileProvider(
      userId,
    );
  }

  @override
  GetUserProfileProvider getProviderOverride(
    covariant GetUserProfileProvider provider,
  ) {
    return call(
      provider.userId,
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
  String? get name => r'getUserProfileProvider';
}

/// See also [getUserProfile].
class GetUserProfileProvider extends AutoDisposeFutureProvider<Uint8List?> {
  /// See also [getUserProfile].
  GetUserProfileProvider(
    String userId,
  ) : this._internal(
          (ref) => getUserProfile(
            ref as GetUserProfileRef,
            userId,
          ),
          from: getUserProfileProvider,
          name: r'getUserProfileProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getUserProfileHash,
          dependencies: GetUserProfileFamily._dependencies,
          allTransitiveDependencies:
              GetUserProfileFamily._allTransitiveDependencies,
          userId: userId,
        );

  GetUserProfileProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  Override overrideWith(
    FutureOr<Uint8List?> Function(GetUserProfileRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetUserProfileProvider._internal(
        (ref) => create(ref as GetUserProfileRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Uint8List?> createElement() {
    return _GetUserProfileProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetUserProfileProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetUserProfileRef on AutoDisposeFutureProviderRef<Uint8List?> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _GetUserProfileProviderElement
    extends AutoDisposeFutureProviderElement<Uint8List?>
    with GetUserProfileRef {
  _GetUserProfileProviderElement(super.provider);

  @override
  String get userId => (origin as GetUserProfileProvider).userId;
}

String _$getUserProfileSmallHash() =>
    r'477cbddecf1a01fc6857c93b79479b03cef0ab00';

/// See also [getUserProfileSmall].
@ProviderFor(getUserProfileSmall)
const getUserProfileSmallProvider = GetUserProfileSmallFamily();

/// See also [getUserProfileSmall].
class GetUserProfileSmallFamily extends Family<AsyncValue<Uint8List?>> {
  /// See also [getUserProfileSmall].
  const GetUserProfileSmallFamily();

  /// See also [getUserProfileSmall].
  GetUserProfileSmallProvider call(
    String userId,
  ) {
    return GetUserProfileSmallProvider(
      userId,
    );
  }

  @override
  GetUserProfileSmallProvider getProviderOverride(
    covariant GetUserProfileSmallProvider provider,
  ) {
    return call(
      provider.userId,
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
  String? get name => r'getUserProfileSmallProvider';
}

/// See also [getUserProfileSmall].
class GetUserProfileSmallProvider
    extends AutoDisposeFutureProvider<Uint8List?> {
  /// See also [getUserProfileSmall].
  GetUserProfileSmallProvider(
    String userId,
  ) : this._internal(
          (ref) => getUserProfileSmall(
            ref as GetUserProfileSmallRef,
            userId,
          ),
          from: getUserProfileSmallProvider,
          name: r'getUserProfileSmallProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getUserProfileSmallHash,
          dependencies: GetUserProfileSmallFamily._dependencies,
          allTransitiveDependencies:
              GetUserProfileSmallFamily._allTransitiveDependencies,
          userId: userId,
        );

  GetUserProfileSmallProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  Override overrideWith(
    FutureOr<Uint8List?> Function(GetUserProfileSmallRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetUserProfileSmallProvider._internal(
        (ref) => create(ref as GetUserProfileSmallRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Uint8List?> createElement() {
    return _GetUserProfileSmallProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetUserProfileSmallProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetUserProfileSmallRef on AutoDisposeFutureProviderRef<Uint8List?> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _GetUserProfileSmallProviderElement
    extends AutoDisposeFutureProviderElement<Uint8List?>
    with GetUserProfileSmallRef {
  _GetUserProfileSmallProviderElement(super.provider);

  @override
  String get userId => (origin as GetUserProfileSmallProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
