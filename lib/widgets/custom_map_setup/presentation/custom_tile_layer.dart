import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_tile_caching/flutter_map_tile_caching.dart';

class CustomTileLayer extends TileLayer {
  CustomTileLayer({super.key})
      : super(
            tileProvider: FMTCStore('tileStore').getTileProvider(
              settings: FMTCTileProviderSettings(
                  maxStoreLength: 10000, obscuredQueryParams: ['api_key']),
            ),
            urlTemplate:
                "https://map.lr-projects.de/tile/{z}/{x}/{y}.png?api_key={api_key}",
            additionalOptions: {"api_key": ""});
}
