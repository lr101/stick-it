// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userRepository)
const userRepositoryProvider = UserRepositoryProvider._();

final class UserRepositoryProvider
    extends $FunctionalProvider<UserRepository, UserRepository, UserRepository>
    with $Provider<UserRepository> {
  const UserRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userRepositoryHash();

  @$internal
  @override
  $ProviderElement<UserRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserRepository create(Ref ref) {
    return userRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserRepository>(value),
    );
  }
}

String _$userRepositoryHash() => r'e52acd5275070ead411b92c3fb58049a1496cf1c';

@ProviderFor(userLikeRepository)
const userLikeRepositoryProvider = UserLikeRepositoryProvider._();

final class UserLikeRepositoryProvider
    extends
        $FunctionalProvider<
          UserLikeRepository,
          UserLikeRepository,
          UserLikeRepository
        >
    with $Provider<UserLikeRepository> {
  const UserLikeRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userLikeRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userLikeRepositoryHash();

  @$internal
  @override
  $ProviderElement<UserLikeRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UserLikeRepository create(Ref ref) {
    return userLikeRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserLikeRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserLikeRepository>(value),
    );
  }
}

String _$userLikeRepositoryHash() =>
    r'6adba68a8b19fd6871a847e3c164d1e69e402ee1';
