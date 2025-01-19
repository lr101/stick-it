// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_pin_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userPinHash() => r'c095376acfff332ea393546db88492326cf4d00d';

/// See also [userPin].
@ProviderFor(userPin)
final userPinProvider = AutoDisposeFutureProvider<List<LocalPinDto>>.internal(
  userPin,
  name: r'userPinProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userPinHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserPinRef = AutoDisposeFutureProviderRef<List<LocalPinDto>>;
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
String _$userPinServiceHash() => r'08140732fa65e35d2ac8339d65ac047dfcac87cb';

/// See also [UserPinService].
@ProviderFor(UserPinService)
final userPinServiceProvider =
    AsyncNotifierProvider<UserPinService, List<LocalPinDto>>.internal(
  UserPinService.new,
  name: r'userPinServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userPinServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserPinService = AsyncNotifier<List<LocalPinDto>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
