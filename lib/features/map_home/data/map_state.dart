


import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:buff_lisa/data/service/pin_service.dart';
import 'package:buff_lisa/widgets/custom_interaction/presentation/custom_error_snack_bar.dart';
import 'package:buff_lisa/widgets/custom_marker/presentation/custom_marker.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
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

@riverpod
class MapStates extends _$MapStates {

  @override
  MapState build() {
    return MapState(
      markers: ref.watch(activatedPinsWithoutLoadingProvider).whenOrNull(data: (data) => data.map((e) => CustomMarkerProvider(pinDto: e, ref: ref)).toList()) ?? [],
    );
  }
}

@Riverpod(keepAlive: true)
Stream<Position> currentLocation(CurrentLocationRef ref) async* {
  final permission  = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    await Geolocator.requestPermission();
  }
  if (permission != LocationPermission.denied &&
      permission != LocationPermission.deniedForever) {
    yield* Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10, // Emit position updates when moved by 10 meters
      ),
    );
  } else {
    CustomErrorSnackBar.message(message: "Some functions do not work without location permission", type: CustomErrorSnackBarType.error);
  }
}