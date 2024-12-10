// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_image_service_small.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userProfilePictureSmallByIdHash() =>
    r'c789e324ae49e823857d7f2bed5d5e11dd495495';

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

/// See also [userProfilePictureSmallById].
@ProviderFor(userProfilePictureSmallById)
const userProfilePictureSmallByIdProvider = UserProfilePictureSmallByIdFamily();

/// See also [userProfilePictureSmallById].
class UserProfilePictureSmallByIdFamily extends Family<AsyncValue<Uint8List?>> {
  /// See also [userProfilePictureSmallById].
  const UserProfilePictureSmallByIdFamily();

  /// See also [userProfilePictureSmallById].
  UserProfilePictureSmallByIdProvider call(
    String userId,
  ) {
    return UserProfilePictureSmallByIdProvider(
      userId,
    );
  }

  @override
  UserProfilePictureSmallByIdProvider getProviderOverride(
    covariant UserProfilePictureSmallByIdProvider provider,
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
  String? get name => r'userProfilePictureSmallByIdProvider';
}

/// See also [userProfilePictureSmallById].
class UserProfilePictureSmallByIdProvider
    extends AutoDisposeFutureProvider<Uint8List?> {
  /// See also [userProfilePictureSmallById].
  UserProfilePictureSmallByIdProvider(
    String userId,
  ) : this._internal(
          (ref) => userProfilePictureSmallById(
            ref as UserProfilePictureSmallByIdRef,
            userId,
          ),
          from: userProfilePictureSmallByIdProvider,
          name: r'userProfilePictureSmallByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userProfilePictureSmallByIdHash,
          dependencies: UserProfilePictureSmallByIdFamily._dependencies,
          allTransitiveDependencies:
              UserProfilePictureSmallByIdFamily._allTransitiveDependencies,
          userId: userId,
        );

  UserProfilePictureSmallByIdProvider._internal(
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
    FutureOr<Uint8List?> Function(UserProfilePictureSmallByIdRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserProfilePictureSmallByIdProvider._internal(
        (ref) => create(ref as UserProfilePictureSmallByIdRef),
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
    return _UserProfilePictureSmallByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserProfilePictureSmallByIdProvider &&
        other.userId == userId;
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
mixin UserProfilePictureSmallByIdRef
    on AutoDisposeFutureProviderRef<Uint8List?> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _UserProfilePictureSmallByIdProviderElement
    extends AutoDisposeFutureProviderElement<Uint8List?>
    with UserProfilePictureSmallByIdRef {
  _UserProfilePictureSmallByIdProviderElement(super.provider);

  @override
  String get userId => (origin as UserProfilePictureSmallByIdProvider).userId;
}

String _$userImageServiceSmallHash() =>
    r'8a19e339d11de7f2a68a6c0ee66ede9c77d2d306';

/// See also [UserImageServiceSmall].
@ProviderFor(UserImageServiceSmall)
final userImageServiceSmallProvider = AsyncNotifierProvider<
    UserImageServiceSmall, Map<String, Uint8List?>>.internal(
  UserImageServiceSmall.new,
  name: r'userImageServiceSmallProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userImageServiceSmallHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserImageServiceSmall = AsyncNotifier<Map<String, Uint8List?>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
