


import 'package:buff_lisa/data/service/shared_preferences_service.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:buff_lisa/data/service/pin_service.dart';
import 'package:buff_lisa/widgets/custom_interaction/presentation/custom_error_snack_bar.dart';
import 'package:buff_lisa/widgets/custom_marker/presentation/custom_marker.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_state.freezed.dart';
part 'map_state.g.dart';

@freezed
class MapState with _$MapState {
  const factory MapState({
    required List<Marker> markers,
  }) = _MapState;
}

@Riverpod(keepAlive: true)
class MapStates extends _$MapStates {

  @override
  MapState build() {
    return MapState(
      markers: ref.watch(activatedPinsWithoutLoadingProvider).whenOrNull(
          data: (data) => data.map((e) => CustomMarkerWidget(pinDto: e, withAnimation: false)).toList()) ?? [],
    );
  }
}

@Riverpod(keepAlive: true)
Stream<Position> currentLocation(Ref ref) async* {
  final sharedPrefs = ref.watch(sharedPreferencesProvider);
  final permission  = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    await Geolocator.requestPermission();
  }
  final rePermission  = await Geolocator.checkPermission();
  if (rePermission != LocationPermission &&
      rePermission != LocationPermission.deniedForever) {
    final positionStream = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      ),
    );
    positionStream.first.then((v) {
      sharedPrefs.setDouble("lastKnownLong", v.longitude);
      sharedPrefs.setDouble("lastKnownLat", v.latitude);
    });
    yield* positionStream;
  } else {
    CustomErrorSnackBar.message(message: "Some functions do not work without location permission", type: CustomErrorSnackBarType.error);
  }
}