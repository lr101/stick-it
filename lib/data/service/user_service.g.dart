// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UserService)
const userServiceProvider = UserServiceFamily._();

final class UserServiceProvider
    extends $AsyncNotifierProvider<UserService, LocalUserDto> {
  const UserServiceProvider._({
    required UserServiceFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'userServiceProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userServiceHash();

  @override
  String toString() {
    return r'userServiceProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  UserService create() => UserService();

  @override
  bool operator ==(Object other) {
    return other is UserServiceProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userServiceHash() => r'b4eeea30011fad2f165ebfd8d088bbbc087d8f6b';

final class UserServiceFamily extends $Family
    with
        $ClassFamilyOverride<
          UserService,
          AsyncValue<LocalUserDto>,
          LocalUserDto,
          FutureOr<LocalUserDto>,
          String
        > {
  const UserServiceFamily._()
    : super(
        retry: null,
        name: r'userServiceProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UserServiceProvider call(String userId) =>
      UserServiceProvider._(argument: userId, from: this);

  @override
  String toString() => r'userServiceProvider';
}

abstract class _$UserService extends $AsyncNotifier<LocalUserDto> {
  late final _$args = ref.$arg as String;
  String get userId => _$args;

  FutureOr<LocalUserDto> build(String userId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<LocalUserDto>, LocalUserDto>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<LocalUserDto>, LocalUserDto>,
              AsyncValue<LocalUserDto>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(userByIdUsername)
const userByIdUsernameProvider = UserByIdUsernameFamily._();

final class UserByIdUsernameProvider
    extends $FunctionalProvider<AsyncValue<String?>, String?, FutureOr<String?>>
    with $FutureModifier<String?>, $FutureProvider<String?> {
  const UserByIdUsernameProvider._({
    required UserByIdUsernameFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'userByIdUsernameProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userByIdUsernameHash();

  @override
  String toString() {
    return r'userByIdUsernameProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String?> create(Ref ref) {
    final argument = this.argument as String;
    return userByIdUsername(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is UserByIdUsernameProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userByIdUsernameHash() => r'21f7b6f196858c93791b1ddd6b8de7a6653c9361';

final class UserByIdUsernameFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<String?>, String> {
  const UserByIdUsernameFamily._()
    : super(
        retry: null,
        name: r'userByIdUsernameProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UserByIdUsernameProvider call(String userId) =>
      UserByIdUsernameProvider._(argument: userId, from: this);

  @override
  String toString() => r'userByIdUsernameProvider';
}

@ProviderFor(userByIdSelectedBatch)
const userByIdSelectedBatchProvider = UserByIdSelectedBatchFamily._();

final class UserByIdSelectedBatchProvider
    extends $FunctionalProvider<AsyncValue<int?>, int?, FutureOr<int?>>
    with $FutureModifier<int?>, $FutureProvider<int?> {
  const UserByIdSelectedBatchProvider._({
    required UserByIdSelectedBatchFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'userByIdSelectedBatchProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userByIdSelectedBatchHash();

  @override
  String toString() {
    return r'userByIdSelectedBatchProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<int?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<int?> create(Ref ref) {
    final argument = this.argument as String;
    return userByIdSelectedBatch(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is UserByIdSelectedBatchProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userByIdSelectedBatchHash() =>
    r'bb4422c45e4eaa9289924d021e6cfb9fcf155584';

final class UserByIdSelectedBatchFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<int?>, String> {
  const UserByIdSelectedBatchFamily._()
    : super(
        retry: null,
        name: r'userByIdSelectedBatchProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UserByIdSelectedBatchProvider call(String userId) =>
      UserByIdSelectedBatchProvider._(argument: userId, from: this);

  @override
  String toString() => r'userByIdSelectedBatchProvider';
}

@ProviderFor(userByIdDescription)
const userByIdDescriptionProvider = UserByIdDescriptionFamily._();

final class UserByIdDescriptionProvider
    extends $FunctionalProvider<AsyncValue<String?>, String?, FutureOr<String?>>
    with $FutureModifier<String?>, $FutureProvider<String?> {
  const UserByIdDescriptionProvider._({
    required UserByIdDescriptionFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'userByIdDescriptionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userByIdDescriptionHash();

  @override
  String toString() {
    return r'userByIdDescriptionProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String?> create(Ref ref) {
    final argument = this.argument as String;
    return userByIdDescription(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is UserByIdDescriptionProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userByIdDescriptionHash() =>
    r'52cd243d3b92c403e20b6f260cd3632e52cad0a3';

final class UserByIdDescriptionFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<String?>, String> {
  const UserByIdDescriptionFamily._()
    : super(
        retry: null,
        name: r'userByIdDescriptionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UserByIdDescriptionProvider call(String userId) =>
      UserByIdDescriptionProvider._(argument: userId, from: this);

  @override
  String toString() => r'userByIdDescriptionProvider';
}

@ProviderFor(userByIdBestSeason)
const userByIdBestSeasonProvider = UserByIdBestSeasonFamily._();

final class UserByIdBestSeasonProvider
    extends
        $FunctionalProvider<
          AsyncValue<SeasonItemDto?>,
          SeasonItemDto?,
          FutureOr<SeasonItemDto?>
        >
    with $FutureModifier<SeasonItemDto?>, $FutureProvider<SeasonItemDto?> {
  const UserByIdBestSeasonProvider._({
    required UserByIdBestSeasonFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'userByIdBestSeasonProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userByIdBestSeasonHash();

  @override
  String toString() {
    return r'userByIdBestSeasonProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<SeasonItemDto?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SeasonItemDto?> create(Ref ref) {
    final argument = this.argument as String;
    return userByIdBestSeason(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is UserByIdBestSeasonProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userByIdBestSeasonHash() =>
    r'53a9d7bda722a4624996914e4bcf27960eed7da1';

final class UserByIdBestSeasonFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<SeasonItemDto?>, String> {
  const UserByIdBestSeasonFamily._()
    : super(
        retry: null,
        name: r'userByIdBestSeasonProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UserByIdBestSeasonProvider call(String userId) =>
      UserByIdBestSeasonProvider._(argument: userId, from: this);

  @override
  String toString() => r'userByIdBestSeasonProvider';
}

@ProviderFor(currentUser)
const currentUserProvider = CurrentUserProvider._();

final class CurrentUserProvider
    extends
        $FunctionalProvider<
          AsyncValue<LocalUserDto>,
          LocalUserDto,
          FutureOr<LocalUserDto>
        >
    with $FutureModifier<LocalUserDto>, $FutureProvider<LocalUserDto> {
  const CurrentUserProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentUserProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentUserHash();

  @$internal
  @override
  $FutureProviderElement<LocalUserDto> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<LocalUserDto> create(Ref ref) {
    return currentUser(ref);
  }
}

String _$currentUserHash() => r'927740f606c86610d797fce1ba06c27f5f781982';
