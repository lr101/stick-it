// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_pin_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UserPinService)
const userPinServiceProvider = UserPinServiceFamily._();

final class UserPinServiceProvider
    extends $AsyncNotifierProvider<UserPinService, List<LocalPinDto>> {
  const UserPinServiceProvider._({
    required UserPinServiceFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'userPinServiceProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userPinServiceHash();

  @override
  String toString() {
    return r'userPinServiceProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  UserPinService create() => UserPinService();

  @override
  bool operator ==(Object other) {
    return other is UserPinServiceProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userPinServiceHash() => r'2548b902d1b6bc4f11ba284a6e50fe7171d42c0d';

final class UserPinServiceFamily extends $Family
    with
        $ClassFamilyOverride<
          UserPinService,
          AsyncValue<List<LocalPinDto>>,
          List<LocalPinDto>,
          FutureOr<List<LocalPinDto>>,
          String
        > {
  const UserPinServiceFamily._()
    : super(
        retry: null,
        name: r'userPinServiceProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UserPinServiceProvider call(String userId) =>
      UserPinServiceProvider._(argument: userId, from: this);

  @override
  String toString() => r'userPinServiceProvider';
}

abstract class _$UserPinService extends $AsyncNotifier<List<LocalPinDto>> {
  late final _$args = ref.$arg as String;
  String get userId => _$args;

  FutureOr<List<LocalPinDto>> build(String userId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref as $Ref<AsyncValue<List<LocalPinDto>>, List<LocalPinDto>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<LocalPinDto>>, List<LocalPinDto>>,
              AsyncValue<List<LocalPinDto>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(userPin)
const userPinProvider = UserPinFamily._();

final class UserPinProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<LocalPinDto>>,
          List<LocalPinDto>,
          FutureOr<List<LocalPinDto>>
        >
    with
        $FutureModifier<List<LocalPinDto>>,
        $FutureProvider<List<LocalPinDto>> {
  const UserPinProvider._({
    required UserPinFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'userPinProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userPinHash();

  @override
  String toString() {
    return r'userPinProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<LocalPinDto>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<LocalPinDto>> create(Ref ref) {
    final argument = this.argument as String;
    return userPin(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is UserPinProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userPinHash() => r'10ba1e091ad1706792ca0b575a2e622d01cba5ce';

final class UserPinFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<LocalPinDto>>, String> {
  const UserPinFamily._()
    : super(
        retry: null,
        name: r'userPinProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UserPinProvider call(String userId) =>
      UserPinProvider._(argument: userId, from: this);

  @override
  String toString() => r'userPinProvider';
}

@ProviderFor(numberOfGroup)
const numberOfGroupProvider = NumberOfGroupProvider._();

final class NumberOfGroupProvider extends $FunctionalProvider<int?, int?, int?>
    with $Provider<int?> {
  const NumberOfGroupProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'numberOfGroupProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$numberOfGroupHash();

  @$internal
  @override
  $ProviderElement<int?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int? create(Ref ref) {
    return numberOfGroup(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int?>(value),
    );
  }
}

String _$numberOfGroupHash() => r'b5f98ff278a0ff7caef2bbe9ddb4be94a2e68d31';
