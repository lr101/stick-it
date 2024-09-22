// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentLocationHash() => r'61177e5893435c2583a0a32c5da4be83e5893e68';

/// See also [currentLocation].
@ProviderFor(currentLocation)
final currentLocationProvider = AutoDisposeStreamProvider<Position>.internal(
  currentLocation,
  name: r'currentLocationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentLocationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentLocationRef = AutoDisposeStreamProviderRef<Position>;
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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
