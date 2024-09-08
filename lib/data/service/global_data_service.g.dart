// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_data_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$globalDataServiceHash() => r'88134865a370b9f077204e969df1e5084d32440e';

/// See also [GlobalDataService].
@ProviderFor(GlobalDataService)
final globalDataServiceProvider =
    NotifierProvider<GlobalDataService, GlobalDataDto>.internal(
  GlobalDataService.new,
  name: r'globalDataServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$globalDataServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GlobalDataService = Notifier<GlobalDataDto>;
String _$cameraTorchHash() => r'd9b867808565232d7ea3ccb93b3f588211414af4';

/// See also [CameraTorch].
@ProviderFor(CameraTorch)
final cameraTorchProvider =
    AutoDisposeNotifierProvider<CameraTorch, bool>.internal(
  CameraTorch.new,
  name: r'cameraTorchProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cameraTorchHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CameraTorch = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
