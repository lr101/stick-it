// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userByIdHash() => r'7e5b6a9e9120c5d8a711c0872e87980dbfe007ea';

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
class UserByIdFamily extends Family<LocalUserDto?> {
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
class UserByIdProvider extends AutoDisposeProvider<LocalUserDto?> {
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
    LocalUserDto? Function(UserByIdRef provider) create,
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
  AutoDisposeProviderElement<LocalUserDto?> createElement() {
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UserByIdRef on AutoDisposeProviderRef<LocalUserDto?> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _UserByIdProviderElement extends AutoDisposeProviderElement<LocalUserDto?>
    with UserByIdRef {
  _UserByIdProviderElement(super.provider);

  @override
  String get userId => (origin as UserByIdProvider).userId;
}

String _$userLikesByIdHash() => r'02f070cfb4b373665d8dcec24111d0769188c908';

/// See also [userLikesById].
@ProviderFor(userLikesById)
const userLikesByIdProvider = UserLikesByIdFamily();

/// See also [userLikesById].
class UserLikesByIdFamily extends Family<UserLikesDto?> {
  /// See also [userLikesById].
  const UserLikesByIdFamily();

  /// See also [userLikesById].
  UserLikesByIdProvider call(
    String userId,
  ) {
    return UserLikesByIdProvider(
      userId,
    );
  }

  @override
  UserLikesByIdProvider getProviderOverride(
    covariant UserLikesByIdProvider provider,
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
  String? get name => r'userLikesByIdProvider';
}

/// See also [userLikesById].
class UserLikesByIdProvider extends AutoDisposeProvider<UserLikesDto?> {
  /// See also [userLikesById].
  UserLikesByIdProvider(
    String userId,
  ) : this._internal(
          (ref) => userLikesById(
            ref as UserLikesByIdRef,
            userId,
          ),
          from: userLikesByIdProvider,
          name: r'userLikesByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userLikesByIdHash,
          dependencies: UserLikesByIdFamily._dependencies,
          allTransitiveDependencies:
              UserLikesByIdFamily._allTransitiveDependencies,
          userId: userId,
        );

  UserLikesByIdProvider._internal(
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
    UserLikesDto? Function(UserLikesByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserLikesByIdProvider._internal(
        (ref) => create(ref as UserLikesByIdRef),
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
  AutoDisposeProviderElement<UserLikesDto?> createElement() {
    return _UserLikesByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserLikesByIdProvider && other.userId == userId;
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
mixin UserLikesByIdRef on AutoDisposeProviderRef<UserLikesDto?> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _UserLikesByIdProviderElement
    extends AutoDisposeProviderElement<UserLikesDto?> with UserLikesByIdRef {
  _UserLikesByIdProviderElement(super.provider);

  @override
  String get userId => (origin as UserLikesByIdProvider).userId;
}

String _$userByIdUsernameHash() => r'2df7dff0e4d211464106771978d47b137c579202';

/// See also [userByIdUsername].
@ProviderFor(userByIdUsername)
const userByIdUsernameProvider = UserByIdUsernameFamily();

/// See also [userByIdUsername].
class UserByIdUsernameFamily extends Family<String?> {
  /// See also [userByIdUsername].
  const UserByIdUsernameFamily();

  /// See also [userByIdUsername].
  UserByIdUsernameProvider call(
    String userId,
  ) {
    return UserByIdUsernameProvider(
      userId,
    );
  }

  @override
  UserByIdUsernameProvider getProviderOverride(
    covariant UserByIdUsernameProvider provider,
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
  String? get name => r'userByIdUsernameProvider';
}

/// See also [userByIdUsername].
class UserByIdUsernameProvider extends AutoDisposeProvider<String?> {
  /// See also [userByIdUsername].
  UserByIdUsernameProvider(
    String userId,
  ) : this._internal(
          (ref) => userByIdUsername(
            ref as UserByIdUsernameRef,
            userId,
          ),
          from: userByIdUsernameProvider,
          name: r'userByIdUsernameProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userByIdUsernameHash,
          dependencies: UserByIdUsernameFamily._dependencies,
          allTransitiveDependencies:
              UserByIdUsernameFamily._allTransitiveDependencies,
          userId: userId,
        );

  UserByIdUsernameProvider._internal(
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
    String? Function(UserByIdUsernameRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserByIdUsernameProvider._internal(
        (ref) => create(ref as UserByIdUsernameRef),
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
  AutoDisposeProviderElement<String?> createElement() {
    return _UserByIdUsernameProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserByIdUsernameProvider && other.userId == userId;
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
mixin UserByIdUsernameRef on AutoDisposeProviderRef<String?> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _UserByIdUsernameProviderElement
    extends AutoDisposeProviderElement<String?> with UserByIdUsernameRef {
  _UserByIdUsernameProviderElement(super.provider);

  @override
  String get userId => (origin as UserByIdUsernameProvider).userId;
}

String _$userServiceHash() => r'56439f60361a75e2356e9aab8ffa45e5358aebd6';

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
