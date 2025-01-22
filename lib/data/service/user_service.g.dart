// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userByIdUsernameHash() => r'27fbfa2239f745e103be782eb3049d83e5b6e14e';

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

/// See also [userByIdUsername].
@ProviderFor(userByIdUsername)
const userByIdUsernameProvider = UserByIdUsernameFamily();

/// See also [userByIdUsername].
class UserByIdUsernameFamily extends Family<AsyncValue<String?>> {
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
class UserByIdUsernameProvider extends AutoDisposeFutureProvider<String?> {
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
    FutureOr<String?> Function(UserByIdUsernameRef provider) create,
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
  AutoDisposeFutureProviderElement<String?> createElement() {
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
mixin UserByIdUsernameRef on AutoDisposeFutureProviderRef<String?> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _UserByIdUsernameProviderElement
    extends AutoDisposeFutureProviderElement<String?> with UserByIdUsernameRef {
  _UserByIdUsernameProviderElement(super.provider);

  @override
  String get userId => (origin as UserByIdUsernameProvider).userId;
}

String _$userByIdSelectedBatchHash() =>
    r'1bf0914796a3e386b1614785a42300ea62ac0e1c';

/// See also [userByIdSelectedBatch].
@ProviderFor(userByIdSelectedBatch)
const userByIdSelectedBatchProvider = UserByIdSelectedBatchFamily();

/// See also [userByIdSelectedBatch].
class UserByIdSelectedBatchFamily extends Family<AsyncValue<int?>> {
  /// See also [userByIdSelectedBatch].
  const UserByIdSelectedBatchFamily();

  /// See also [userByIdSelectedBatch].
  UserByIdSelectedBatchProvider call(
    String userId,
  ) {
    return UserByIdSelectedBatchProvider(
      userId,
    );
  }

  @override
  UserByIdSelectedBatchProvider getProviderOverride(
    covariant UserByIdSelectedBatchProvider provider,
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
  String? get name => r'userByIdSelectedBatchProvider';
}

/// See also [userByIdSelectedBatch].
class UserByIdSelectedBatchProvider extends AutoDisposeFutureProvider<int?> {
  /// See also [userByIdSelectedBatch].
  UserByIdSelectedBatchProvider(
    String userId,
  ) : this._internal(
          (ref) => userByIdSelectedBatch(
            ref as UserByIdSelectedBatchRef,
            userId,
          ),
          from: userByIdSelectedBatchProvider,
          name: r'userByIdSelectedBatchProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userByIdSelectedBatchHash,
          dependencies: UserByIdSelectedBatchFamily._dependencies,
          allTransitiveDependencies:
              UserByIdSelectedBatchFamily._allTransitiveDependencies,
          userId: userId,
        );

  UserByIdSelectedBatchProvider._internal(
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
    FutureOr<int?> Function(UserByIdSelectedBatchRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserByIdSelectedBatchProvider._internal(
        (ref) => create(ref as UserByIdSelectedBatchRef),
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
  AutoDisposeFutureProviderElement<int?> createElement() {
    return _UserByIdSelectedBatchProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserByIdSelectedBatchProvider && other.userId == userId;
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
mixin UserByIdSelectedBatchRef on AutoDisposeFutureProviderRef<int?> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _UserByIdSelectedBatchProviderElement
    extends AutoDisposeFutureProviderElement<int?>
    with UserByIdSelectedBatchRef {
  _UserByIdSelectedBatchProviderElement(super.provider);

  @override
  String get userId => (origin as UserByIdSelectedBatchProvider).userId;
}

String _$userByIdDescriptionHash() =>
    r'807d617e46eed0e31274313a7f979efaea71c64e';

/// See also [userByIdDescription].
@ProviderFor(userByIdDescription)
const userByIdDescriptionProvider = UserByIdDescriptionFamily();

/// See also [userByIdDescription].
class UserByIdDescriptionFamily extends Family<AsyncValue<String?>> {
  /// See also [userByIdDescription].
  const UserByIdDescriptionFamily();

  /// See also [userByIdDescription].
  UserByIdDescriptionProvider call(
    String userId,
  ) {
    return UserByIdDescriptionProvider(
      userId,
    );
  }

  @override
  UserByIdDescriptionProvider getProviderOverride(
    covariant UserByIdDescriptionProvider provider,
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
  String? get name => r'userByIdDescriptionProvider';
}

/// See also [userByIdDescription].
class UserByIdDescriptionProvider extends AutoDisposeFutureProvider<String?> {
  /// See also [userByIdDescription].
  UserByIdDescriptionProvider(
    String userId,
  ) : this._internal(
          (ref) => userByIdDescription(
            ref as UserByIdDescriptionRef,
            userId,
          ),
          from: userByIdDescriptionProvider,
          name: r'userByIdDescriptionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userByIdDescriptionHash,
          dependencies: UserByIdDescriptionFamily._dependencies,
          allTransitiveDependencies:
              UserByIdDescriptionFamily._allTransitiveDependencies,
          userId: userId,
        );

  UserByIdDescriptionProvider._internal(
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
    FutureOr<String?> Function(UserByIdDescriptionRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserByIdDescriptionProvider._internal(
        (ref) => create(ref as UserByIdDescriptionRef),
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
  AutoDisposeFutureProviderElement<String?> createElement() {
    return _UserByIdDescriptionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserByIdDescriptionProvider && other.userId == userId;
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
mixin UserByIdDescriptionRef on AutoDisposeFutureProviderRef<String?> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _UserByIdDescriptionProviderElement
    extends AutoDisposeFutureProviderElement<String?>
    with UserByIdDescriptionRef {
  _UserByIdDescriptionProviderElement(super.provider);

  @override
  String get userId => (origin as UserByIdDescriptionProvider).userId;
}

String _$currentUserHash() => r'927740f606c86610d797fce1ba06c27f5f781982';

/// See also [currentUser].
@ProviderFor(currentUser)
final currentUserProvider = AutoDisposeFutureProvider<LocalUserDto>.internal(
  currentUser,
  name: r'currentUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentUserRef = AutoDisposeFutureProviderRef<LocalUserDto>;
String _$userServiceHash() => r'f3f82a61b39db94c52443acbac3a67032b6bec03';

abstract class _$UserService
    extends BuildlessAutoDisposeAsyncNotifier<LocalUserDto> {
  late final String userId;

  FutureOr<LocalUserDto> build(
    String userId,
  );
}

/// See also [UserService].
@ProviderFor(UserService)
const userServiceProvider = UserServiceFamily();

/// See also [UserService].
class UserServiceFamily extends Family<AsyncValue<LocalUserDto>> {
  /// See also [UserService].
  const UserServiceFamily();

  /// See also [UserService].
  UserServiceProvider call(
    String userId,
  ) {
    return UserServiceProvider(
      userId,
    );
  }

  @override
  UserServiceProvider getProviderOverride(
    covariant UserServiceProvider provider,
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
  String? get name => r'userServiceProvider';
}

/// See also [UserService].
class UserServiceProvider
    extends AutoDisposeAsyncNotifierProviderImpl<UserService, LocalUserDto> {
  /// See also [UserService].
  UserServiceProvider(
    String userId,
  ) : this._internal(
          () => UserService()..userId = userId,
          from: userServiceProvider,
          name: r'userServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userServiceHash,
          dependencies: UserServiceFamily._dependencies,
          allTransitiveDependencies:
              UserServiceFamily._allTransitiveDependencies,
          userId: userId,
        );

  UserServiceProvider._internal(
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
  FutureOr<LocalUserDto> runNotifierBuild(
    covariant UserService notifier,
  ) {
    return notifier.build(
      userId,
    );
  }

  @override
  Override overrideWith(UserService Function() create) {
    return ProviderOverride(
      origin: this,
      override: UserServiceProvider._internal(
        () => create()..userId = userId,
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
  AutoDisposeAsyncNotifierProviderElement<UserService, LocalUserDto>
      createElement() {
    return _UserServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserServiceProvider && other.userId == userId;
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
mixin UserServiceRef on AutoDisposeAsyncNotifierProviderRef<LocalUserDto> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _UserServiceProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<UserService, LocalUserDto>
    with UserServiceRef {
  _UserServiceProviderElement(super.provider);

  @override
  String get userId => (origin as UserServiceProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
