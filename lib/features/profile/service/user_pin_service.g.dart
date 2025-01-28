// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_pin_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userPinHash() => r'10ba1e091ad1706792ca0b575a2e622d01cba5ce';

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

/// See also [userPin].
@ProviderFor(userPin)
const userPinProvider = UserPinFamily();

/// See also [userPin].
class UserPinFamily extends Family<AsyncValue<List<LocalPinDto>>> {
  /// See also [userPin].
  const UserPinFamily();

  /// See also [userPin].
  UserPinProvider call(
    String userId,
  ) {
    return UserPinProvider(
      userId,
    );
  }

  @override
  UserPinProvider getProviderOverride(
    covariant UserPinProvider provider,
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
  String? get name => r'userPinProvider';
}

/// See also [userPin].
class UserPinProvider extends AutoDisposeFutureProvider<List<LocalPinDto>> {
  /// See also [userPin].
  UserPinProvider(
    String userId,
  ) : this._internal(
          (ref) => userPin(
            ref as UserPinRef,
            userId,
          ),
          from: userPinProvider,
          name: r'userPinProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userPinHash,
          dependencies: UserPinFamily._dependencies,
          allTransitiveDependencies: UserPinFamily._allTransitiveDependencies,
          userId: userId,
        );

  UserPinProvider._internal(
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
    FutureOr<List<LocalPinDto>> Function(UserPinRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserPinProvider._internal(
        (ref) => create(ref as UserPinRef),
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
  AutoDisposeFutureProviderElement<List<LocalPinDto>> createElement() {
    return _UserPinProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserPinProvider && other.userId == userId;
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
mixin UserPinRef on AutoDisposeFutureProviderRef<List<LocalPinDto>> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _UserPinProviderElement
    extends AutoDisposeFutureProviderElement<List<LocalPinDto>>
    with UserPinRef {
  _UserPinProviderElement(super.provider);

  @override
  String get userId => (origin as UserPinProvider).userId;
}

String _$numberOfGroupHash() => r'b5f98ff278a0ff7caef2bbe9ddb4be94a2e68d31';

/// See also [numberOfGroup].
@ProviderFor(numberOfGroup)
final numberOfGroupProvider = AutoDisposeProvider<int?>.internal(
  numberOfGroup,
  name: r'numberOfGroupProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$numberOfGroupHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef NumberOfGroupRef = AutoDisposeProviderRef<int?>;
String _$userPinServiceHash() => r'6d79285f8eb8e6422af5d966aa73b003a734e714';

abstract class _$UserPinService
    extends BuildlessAutoDisposeAsyncNotifier<List<LocalPinDto>> {
  late final String userId;

  FutureOr<List<LocalPinDto>> build(
    String userId,
  );
}

/// See also [UserPinService].
@ProviderFor(UserPinService)
const userPinServiceProvider = UserPinServiceFamily();

/// See also [UserPinService].
class UserPinServiceFamily extends Family<AsyncValue<List<LocalPinDto>>> {
  /// See also [UserPinService].
  const UserPinServiceFamily();

  /// See also [UserPinService].
  UserPinServiceProvider call(
    String userId,
  ) {
    return UserPinServiceProvider(
      userId,
    );
  }

  @override
  UserPinServiceProvider getProviderOverride(
    covariant UserPinServiceProvider provider,
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
  String? get name => r'userPinServiceProvider';
}

/// See also [UserPinService].
class UserPinServiceProvider extends AutoDisposeAsyncNotifierProviderImpl<
    UserPinService, List<LocalPinDto>> {
  /// See also [UserPinService].
  UserPinServiceProvider(
    String userId,
  ) : this._internal(
          () => UserPinService()..userId = userId,
          from: userPinServiceProvider,
          name: r'userPinServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userPinServiceHash,
          dependencies: UserPinServiceFamily._dependencies,
          allTransitiveDependencies:
              UserPinServiceFamily._allTransitiveDependencies,
          userId: userId,
        );

  UserPinServiceProvider._internal(
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
  FutureOr<List<LocalPinDto>> runNotifierBuild(
    covariant UserPinService notifier,
  ) {
    return notifier.build(
      userId,
    );
  }

  @override
  Override overrideWith(UserPinService Function() create) {
    return ProviderOverride(
      origin: this,
      override: UserPinServiceProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<UserPinService, List<LocalPinDto>>
      createElement() {
    return _UserPinServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserPinServiceProvider && other.userId == userId;
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
mixin UserPinServiceRef
    on AutoDisposeAsyncNotifierProviderRef<List<LocalPinDto>> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _UserPinServiceProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<UserPinService,
        List<LocalPinDto>> with UserPinServiceRef {
  _UserPinServiceProviderElement(super.provider);

  @override
  String get userId => (origin as UserPinServiceProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
