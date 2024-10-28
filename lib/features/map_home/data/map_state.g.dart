// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentLocationHash() => r'0ccfc3e81e3b066d09559885d5ffb779db96ec49';

/// See also [currentLocation].
@ProviderFor(currentLocation)
final currentLocationProvider = StreamProvider<Position>.internal(
  currentLocation,
  name: r'currentLocationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentLocationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentLocationRef = StreamProviderRef<Position>;
String _$mapStatesHash() => r'9fb8df0a1131c0aeb031c627ed60a76fe90df9e6';

/// See also [MapStates].
@ProviderFor(MapStates)
final mapStatesProvider =
    AutoDisposeNotifierProvider<MapStates, MapState>.internal(
  MapStates.new,
  name: r'mapStatesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$mapStatesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MapStates = AutoDisposeNotifier<MapState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
