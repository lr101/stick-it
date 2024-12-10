// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_image_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$profilePictureByIdHash() =>
    r'5c600cc9819cc74f204416e3b7945ad04df2f2a9';

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

/// See also [profilePictureById].
@ProviderFor(profilePictureById)
const profilePictureByIdProvider = ProfilePictureByIdFamily();

/// See also [profilePictureById].
class ProfilePictureByIdFamily extends Family<AsyncValue<Uint8List?>> {
  /// See also [profilePictureById].
  const ProfilePictureByIdFamily();

  /// See also [profilePictureById].
  ProfilePictureByIdProvider call(
    String userId,
  ) {
    return ProfilePictureByIdProvider(
      userId,
    );
  }

  @override
  ProfilePictureByIdProvider getProviderOverride(
    covariant ProfilePictureByIdProvider provider,
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
  String? get name => r'profilePictureByIdProvider';
}

/// See also [profilePictureById].
class ProfilePictureByIdProvider extends AutoDisposeFutureProvider<Uint8List?> {
  /// See also [profilePictureById].
  ProfilePictureByIdProvider(
    String userId,
  ) : this._internal(
          (ref) => profilePictureById(
            ref as ProfilePictureByIdRef,
            userId,
          ),
          from: profilePictureByIdProvider,
          name: r'profilePictureByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$profilePictureByIdHash,
          dependencies: ProfilePictureByIdFamily._dependencies,
          allTransitiveDependencies:
              ProfilePictureByIdFamily._allTransitiveDependencies,
          userId: userId,
        );

  ProfilePictureByIdProvider._internal(
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
    FutureOr<Uint8List?> Function(ProfilePictureByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProfilePictureByIdProvider._internal(
        (ref) => create(ref as ProfilePictureByIdRef),
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
    return _ProfilePictureByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProfilePictureByIdProvider && other.userId == userId;
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
mixin ProfilePictureByIdRef on AutoDisposeFutureProviderRef<Uint8List?> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _ProfilePictureByIdProviderElement
    extends AutoDisposeFutureProviderElement<Uint8List?>
    with ProfilePictureByIdRef {
  _ProfilePictureByIdProviderElement(super.provider);

  @override
  String get userId => (origin as ProfilePictureByIdProvider).userId;
}

String _$userImageServiceHash() => r'872b9dcb496e171bb4b1d08e7024d733cd3a6dcc';

/// See also [UserImageService].
@ProviderFor(UserImageService)
final userImageServiceProvider =
    AsyncNotifierProvider<UserImageService, Map<String, Uint8List?>>.internal(
  UserImageService.new,
  name: r'userImageServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userImageServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserImageService = AsyncNotifier<Map<String, Uint8List?>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
