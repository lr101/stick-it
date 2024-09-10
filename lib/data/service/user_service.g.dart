// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userByIdHash() => r'd9747ec8addd2e96f2d8f1cf38cd463f1f4922c1';

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

/// See also [userById].
@ProviderFor(userById)
const userByIdProvider = UserByIdFamily();

/// See also [userById].
class UserByIdFamily extends Family<AsyncValue<LocalUserDto>> {
  /// See also [userById].
  const UserByIdFamily();

  /// See also [userById].
  UserByIdProvider call(
    String userId,
  ) {
    return UserByIdProvider(
      userId,
    );
  }

  @override
  UserByIdProvider getProviderOverride(
    covariant UserByIdProvider provider,
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
  String? get name => r'userByIdProvider';
}

/// See also [userById].
class UserByIdProvider extends AutoDisposeFutureProvider<LocalUserDto> {
  /// See also [userById].
  UserByIdProvider(
    String userId,
  ) : this._internal(
          (ref) => userById(
            ref as UserByIdRef,
            userId,
          ),
          from: userByIdProvider,
          name: r'userByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userByIdHash,
          dependencies: UserByIdFamily._dependencies,
          allTransitiveDependencies: UserByIdFamily._allTransitiveDependencies,
          userId: userId,
        );

  UserByIdProvider._internal(
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
    FutureOr<LocalUserDto> Function(UserByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserByIdProvider._internal(
        (ref) => create(ref as UserByIdRef),
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
  AutoDisposeFutureProviderElement<LocalUserDto> createElement() {
    return _UserByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserByIdProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UserByIdRef on AutoDisposeFutureProviderRef<LocalUserDto> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _UserByIdProviderElement
    extends AutoDisposeFutureProviderElement<LocalUserDto> with UserByIdRef {
  _UserByIdProviderElement(super.provider);

  @override
  String get userId => (origin as UserByIdProvider).userId;
}

String _$profilePictureByIdHash() =>
    r'1a90dd8edcc690b0d71dd80beb7ca47912f4cfec';

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

String _$userServiceHash() => r'4ee0dc7b2b055e44c555aebe6f513d7bce89b1b9';

/// See also [UserService].
@ProviderFor(UserService)
final userServiceProvider =
    AsyncNotifierProvider<UserService, List<LocalUserDto>>.internal(
  UserService.new,
  name: r'userServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserService = AsyncNotifier<List<LocalUserDto>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
