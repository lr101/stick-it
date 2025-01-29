// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentLocationHash() => r'd5de2759b915419e2ede395268475714aae4e37a';

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
String _$mapStatesHash() => r'026eeb518042f9823570dd45c228554235bc21c9';

/// See also [MapStates].
@ProviderFor(MapStates)
final mapStatesProvider = NotifierProvider<MapStates, MapState>.internal(
  MapStates.new,
  name: r'mapStatesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$mapStatesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MapStates = Notifier<MapState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
