// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geojson_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$geojsonServiceHash() => r'34477e1211d38de2aa885b7f26fd4e703dd0f03c';

/// See also [GeojsonService].
@ProviderFor(GeojsonService)
final geojsonServiceProvider =
    AsyncNotifierProvider<GeojsonService, List<Polygon>>.internal(
  GeojsonService.new,
  name: r'geojsonServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$geojsonServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GeojsonService = AsyncNotifier<List<Polygon>>;
String _$districtServiceHash() => r'678bc9955ea9e95fa76abdefac0b3e6de02761be';

/// See also [DistrictService].
@ProviderFor(DistrictService)
final districtServiceProvider =
    NotifierProvider<DistrictService, MapInfoDto?>.internal(
  DistrictService.new,
  name: r'districtServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$districtServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DistrictService = Notifier<MapInfoDto?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
