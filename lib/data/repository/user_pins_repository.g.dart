// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_pins_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userPinsRepository)
const userPinsRepositoryProvider = UserPinsRepositoryProvider._();

final class UserPinsRepositoryProvider
    extends
        $FunctionalProvider<
          UserPinsRepository,
          UserPinsRepository,
          UserPinsRepository
        >
    with $Provider<UserPinsRepository> {
  const UserPinsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userPinsRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userPinsRepositoryHash();

  @$internal
  @override
  $ProviderElement<UserPinsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UserPinsRepository create(Ref ref) {
    return userPinsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserPinsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserPinsRepository>(value),
    );
  }
}

String _$userPinsRepositoryHash() =>
    r'a3db19a7af556e17ae4cb7965b1c9f2f3e641d69';
