// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentLocationHash() => r'7f08d6ab73644ace4366b45a709faec97776ac1d';

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
String _$mapStatesHash() => r'0f46ae89dde55af7d5885a55ca5d1a6d35058f69';

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
