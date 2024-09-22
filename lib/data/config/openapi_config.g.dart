// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openapi_config.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pinApiHash() => r'b803a64036b2a73105fd113338d6a93ea3257678';

/// See also [pinApi].
@ProviderFor(pinApi)
final pinApiProvider = Provider<PinsApi>.internal(
  pinApi,
  name: r'pinApiProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$pinApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PinApiRef = ProviderRef<PinsApi>;
String _$groupApiHash() => r'00189fd1d0550c1fa8be5a8c86165fa45a891ec0';

/// See also [groupApi].
@ProviderFor(groupApi)
final groupApiProvider = Provider<GroupsApi>.internal(
  groupApi,
  name: r'groupApiProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$groupApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GroupApiRef = ProviderRef<GroupsApi>;
String _$userApiHash() => r'f0f9b9fc33340e683bfb574065c15e469bb1496c';

/// See also [userApi].
@ProviderFor(userApi)
final userApiProvider = Provider<UsersApi>.internal(
  userApi,
  name: r'userApiProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserApiRef = ProviderRef<UsersApi>;
String _$authApiHash() => r'af9a3b8e714b3b19714aec735a5b005ff4de3d59';

/// See also [authApi].
@ProviderFor(authApi)
final authApiProvider = Provider<AuthApi>.internal(
  authApi,
  name: r'authApiProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthApiRef = ProviderRef<AuthApi>;
String _$memberApiHash() => r'68ef62a59b1721762900ec32103a44ee1f3c1780';

/// See also [memberApi].
@ProviderFor(memberApi)
final memberApiProvider = Provider<MembersApi>.internal(
  memberApi,
  name: r'memberApiProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$memberApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MemberApiRef = ProviderRef<MembersApi>;
String _$reportApiHash() => r'689be88433efecbf7c28f05bdfb99e8672394dba';

/// See also [reportApi].
@ProviderFor(reportApi)
final reportApiProvider = Provider<ReportApi>.internal(
  reportApi,
  name: r'reportApiProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$reportApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ReportApiRef = ProviderRef<ReportApi>;
String _$openApiConfigHash() => r'5b820e6fade1598e23c18c59f0bc4b896de6f29d';

/// See also [OpenApiConfig].
@ProviderFor(OpenApiConfig)
final openApiConfigProvider =
    NotifierProvider<OpenApiConfig, ApiClient>.internal(
  OpenApiConfig.new,
  name: r'openApiConfigProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$openApiConfigHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$OpenApiConfig = Notifier<ApiClient>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
