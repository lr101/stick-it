// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geojson_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$geojsonServiceHash() => r'a69ccc05bdde802bcfb3d1be08ddf0b7de8298c1';

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
String _$districtServiceHash() => r'f14234c6975bcf84d017dc491b9fac17f2ec22c8';

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
