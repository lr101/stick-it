

import 'package:flutter_map/flutter_map.dart';

class CustomTileLayer extends TileLayer {

  CustomTileLayer() : super(
        urlTemplate: "https://map.lr-projects.de/tile/{z}/{x}/{y}.png?api_key={api_key}",
        additionalOptions: {
          "api_key": ""
        }
    );
}