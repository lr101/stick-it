
import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_geojson/flutter_map_geojson.dart';
import 'package:openapi/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'geojson_service.g.dart';

@Riverpod(keepAlive: true)
class GeojsonService extends _$GeojsonService {


  static const String geojsonStart = '{"features": [{"properties": {},"geometry":';
  static const String geojsonEnd = "}]}";

  @override
  Future<List<Polygon>> build() async {
    final GeoJsonParser myGeoJson = GeoJsonParser(defaultPolygonFillColor: Colors.orange.withValues(alpha: 0.05));
    final district =  ref.watch(districtServiceProvider);
    if (district == null) return [];
    final geojson = await ref.watch(rankingApiProvider).getGeoJson(gid2: district.gid2);
    if (geojson != null) {
      myGeoJson.parseGeoJsonAsString(geojsonStart + geojson.first + geojsonEnd);
      return myGeoJson.polygons;
    }
    return [];
  }

}


@Riverpod(keepAlive: true)
class DistrictService extends _$DistrictService {
  
  double? _lat;
  double? _long;
  
  @override
  MapInfoDto? build()  {
    return null;
  }

  Future<void> updateLatLong(double latitude, double longitude) async {
    const latPrecision = 0.0001; // approximately 10m
    const longPrecision = 0.0001; // approximately 10m

    if ((_lat == null || (latitude - _lat!).abs() > latPrecision) ||
        (_long == null || (longitude - _long!).abs() > longPrecision)) {
      _lat = latitude;
      _long = longitude;
      final rankingApi = ref.watch(rankingApiProvider);
      try {
        final mapInfo = await rankingApi.getMapInfo(
            latitude: latitude, longitude: longitude,);
        if (mapInfo != null && mapInfo.isNotEmpty &&
            state?.gid2 != mapInfo.first.gid2) {
          state = mapInfo.first;
        }
      } catch(e) {
        debugPrint(e.toString());
        state = null;
      }
    }
    
  }
}
