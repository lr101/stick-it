
import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:openapi/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'geojson_service.g.dart';

@Riverpod(keepAlive: true)
class DistrictService extends _$DistrictService {
  
  double _lat = 0;
  double _long = 0;
  double _zoom = 0;
  double? _latitudeNew;
  double? _longitudeNew;
  late final RankingApi rankingApi;
  final Logger _logger = Logger();
  
  @override
  MapInfoDto? build()  {
    rankingApi = ref.watch(rankingApiProvider);
    return null;
  }

  Future<void> updateLatLong(double latitude, double longitude, double zoom) async {
    _latitudeNew = latitude;
    _longitudeNew = longitude;
    _zoom = zoom;
  }

  double calculatedPrecision(double zoom) => 1.454 - (0.0908 * zoom).clamp(0.005, 2.0);

  Future<void> refetch() async {
    if (_latitudeNew == null || _longitudeNew == null) return;
    final precision = calculatedPrecision(_zoom);
  
  
    // Check if we moved enough to warrant a fetch
    if (((_latitudeNew! - _lat).abs() > precision) ||
        (_longitudeNew! - _long).abs() > precision) {
      
      _lat = _latitudeNew!;
      _long = _longitudeNew!;
      
      final rankingApi = ref.read(rankingApiProvider); // Use read inside async methods if not watching a stream
      
      try {
        final mapInfo = await rankingApi.getMapInfo(
          latitude: _lat, 
          longitude: _long,
        );
        _logger.i("Fetched map info: $mapInfo");
        
        if (mapInfo != null && mapInfo.isNotEmpty &&
            state?.gid2 != mapInfo.first.gid2) {
          state = mapInfo.first;
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }
}
