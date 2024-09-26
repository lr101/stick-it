// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userByIdHash() => r'44adcff70281591fdb74ce96180dc4184de4de1e';

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

String _$profilePictureSmallByIdHash() =>
    r'51d65ea3b030d68abb8632ab22ef1d4c1afd64bb';

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

String _$userServiceHash() => r'27f6c0726dadf7a5ef3b24c8ca316f9e612051db';

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
