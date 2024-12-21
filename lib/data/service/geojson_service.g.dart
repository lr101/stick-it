// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geojson_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$geojsonServiceHash() => r'b0b5deaafb3df3944244f60c813175f09757cafe';

/// See also [GeojsonService].
@ProviderFor(GeojsonService)
final geojsonServiceProvider =
    AutoDisposeAsyncNotifierProvider<GeojsonService, List<Polygon>>.internal(
  GeojsonService.new,
  name: r'geojsonServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$geojsonServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GeojsonService = AutoDisposeAsyncNotifier<List<Polygon>>;
String _$districtServiceHash() => r'61f4817b237db057145856c43e034081b04dcd53';

/// See also [DistrictService].
@ProviderFor(DistrictService)
final districtServiceProvider =
    AutoDisposeNotifierProvider<DistrictService, MapInfoDto?>.internal(
  DistrictService.new,
  name: r'districtServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$districtServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DistrictService = AutoDisposeNotifier<MapInfoDto?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
