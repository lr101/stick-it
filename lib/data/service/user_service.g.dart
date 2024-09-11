// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userByIdHash() => r'a7c963274de482364e00e864c03479a63a7bdde7';

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
class UserByIdFamily extends Family<AsyncValue<LocalUserDto?>> {
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
class UserByIdProvider extends AutoDisposeFutureProvider<LocalUserDto?> {
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
    FutureOr<LocalUserDto?> Function(UserByIdRef provider) create,
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
  AutoDisposeFutureProviderElement<LocalUserDto?> createElement() {
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

mixin UserByIdRef on AutoDisposeFutureProviderRef<LocalUserDto?> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _UserByIdProviderElement
    extends AutoDisposeFutureProviderElement<LocalUserDto?> with UserByIdRef {
  _UserByIdProviderElement(super.provider);

  @override
  String get userId => (origin as UserByIdProvider).userId;
}

String _$profilePictureByIdHash() =>
    r'7f394700a64bec722960ea1b3dd1248aedeb7ad6';

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

String _$profilePictureSmallByIdHash() =>
    r'de95ecd6dbe4ce4046ccca333aa42d6104f8ff9e';

/// See also [profilePictureSmallById].
@ProviderFor(profilePictureSmallById)
const profilePictureSmallByIdProvider = ProfilePictureSmallByIdFamily();

/// See also [profilePictureSmallById].
class ProfilePictureSmallByIdFamily extends Family<AsyncValue<Uint8List?>> {
  /// See also [profilePictureSmallById].
  const ProfilePictureSmallByIdFamily();

  /// See also [profilePictureSmallById].
  ProfilePictureSmallByIdProvider call(
    String userId,
  ) {
    return ProfilePictureSmallByIdProvider(
      userId,
    );
  }

  @override
  ProfilePictureSmallByIdProvider getProviderOverride(
    covariant ProfilePictureSmallByIdProvider provider,
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
  String? get name => r'profilePictureSmallByIdProvider';
}

/// See also [profilePictureSmallById].
class ProfilePictureSmallByIdProvider
    extends AutoDisposeFutureProvider<Uint8List?> {
  /// See also [profilePictureSmallById].
  ProfilePictureSmallByIdProvider(
    String userId,
  ) : this._internal(
          (ref) => profilePictureSmallById(
            ref as ProfilePictureSmallByIdRef,
            userId,
          ),
          from: profilePictureSmallByIdProvider,
          name: r'profilePictureSmallByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$profilePictureSmallByIdHash,
          dependencies: ProfilePictureSmallByIdFamily._dependencies,
          allTransitiveDependencies:
              ProfilePictureSmallByIdFamily._allTransitiveDependencies,
          userId: userId,
        );

  ProfilePictureSmallByIdProvider._internal(
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
    FutureOr<Uint8List?> Function(ProfilePictureSmallByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProfilePictureSmallByIdProvider._internal(
        (ref) => create(ref as ProfilePictureSmallByIdRef),
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
    return _ProfilePictureSmallByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProfilePictureSmallByIdProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProfilePictureSmallByIdRef on AutoDisposeFutureProviderRef<Uint8List?> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _ProfilePictureSmallByIdProviderElement
    extends AutoDisposeFutureProviderElement<Uint8List?>
    with ProfilePictureSmallByIdRef {
  _ProfilePictureSmallByIdProviderElement(super.provider);

  @override
  String get userId => (origin as ProfilePictureSmallByIdProvider).userId;
}

String _$userServiceHash() => r'481c0d472c41d9f277cb13c3a8fe1df400812574';

/// See also [UserService].
@ProviderFor(UserService)
final userServiceProvider =
    AsyncNotifierProvider<UserService, Map<String, LocalUserDto>>.internal(
  UserService.new,
  name: r'userServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserService = AsyncNotifier<Map<String, LocalUserDto>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
