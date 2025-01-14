// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geojson_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$geojsonServiceHash() => r'ca2a9bbe1b58daf7489a31ea914bd3f01f266abd';

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
String _$districtServiceHash() => r'338094244770e46fa1d274a7944b7d7c6456f4b5';

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
