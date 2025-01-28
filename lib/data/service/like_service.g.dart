// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userLikeServiceHash() => r'7f929e8abeba11bd5f6e496f142cec64461571fb';

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

abstract class _$UserLikeService
    extends BuildlessAutoDisposeAsyncNotifier<UserLikesDto> {
  late final String userId;

  FutureOr<UserLikesDto> build(
    String userId,
  );
}

/// See also [UserLikeService].
@ProviderFor(UserLikeService)
const userLikeServiceProvider = UserLikeServiceFamily();

/// See also [UserLikeService].
class UserLikeServiceFamily extends Family<AsyncValue<UserLikesDto>> {
  /// See also [UserLikeService].
  const UserLikeServiceFamily();

  /// See also [UserLikeService].
  UserLikeServiceProvider call(
    String userId,
  ) {
    return UserLikeServiceProvider(
      userId,
    );
  }

  @override
  UserLikeServiceProvider getProviderOverride(
    covariant UserLikeServiceProvider provider,
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
  String? get name => r'userLikeServiceProvider';
}

/// See also [UserLikeService].
class UserLikeServiceProvider extends AutoDisposeAsyncNotifierProviderImpl<
    UserLikeService, UserLikesDto> {
  /// See also [UserLikeService].
  UserLikeServiceProvider(
    String userId,
  ) : this._internal(
          () => UserLikeService()..userId = userId,
          from: userLikeServiceProvider,
          name: r'userLikeServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userLikeServiceHash,
          dependencies: UserLikeServiceFamily._dependencies,
          allTransitiveDependencies:
              UserLikeServiceFamily._allTransitiveDependencies,
          userId: userId,
        );

  UserLikeServiceProvider._internal(
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
  FutureOr<UserLikesDto> runNotifierBuild(
    covariant UserLikeService notifier,
  ) {
    return notifier.build(
      userId,
    );
  }

  @override
  Override overrideWith(UserLikeService Function() create) {
    return ProviderOverride(
      origin: this,
      override: UserLikeServiceProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<UserLikeService, UserLikesDto>
      createElement() {
    return _UserLikeServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserLikeServiceProvider && other.userId == userId;
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
mixin UserLikeServiceRef on AutoDisposeAsyncNotifierProviderRef<UserLikesDto> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _UserLikeServiceProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<UserLikeService,
        UserLikesDto> with UserLikeServiceRef {
  _UserLikeServiceProviderElement(super.provider);

  @override
  String get userId => (origin as UserLikeServiceProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
