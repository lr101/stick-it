import 'package:buff_lisa/data/service/group_image_service.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:buff_lisa/features/camera/presentation/image_upload.dart';
import 'package:buff_lisa/features/map_home/data/map_state.dart';
import 'package:buff_lisa/widgets/custom_map_setup/presentation/custom_tile_layer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import '../../../util/routing/routing.dart';
import '../../../widgets/custom_marker/data/default_group_image.dart';
import '../data/camera_state.dart';

class SelectLocation extends ConsumerStatefulWidget {
  const SelectLocation({super.key, this.center, required this.image});

  final LatLng? center;
  final Uint8List image;

  @override
  ConsumerState<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends ConsumerState<SelectLocation> {
  final _mapController = MapController();
  final _zoom = 13.0;

  @override
  Widget build(BuildContext context) {
    LatLng centerPosition = LatLng(49.01105, 8.25190);
    if (widget.center == null) {
      final pos = ref.read(currentLocationProvider).value;
      if (pos != null) {
        centerPosition = LatLng(pos.latitude, pos.longitude);
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Select Location"),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                ListTile(
                  title: Text("How to"),
                  subtitle: Text(
                      "Select the sticker location by moving the map around until the marker in the center appropriately matches where your picture was taken."),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 20,
                  height: MediaQuery.of(context).size.width - 20,
                  child: Stack(
                    children: [
                      // Flutter Map widget
                      FlutterMap(
                        mapController: _mapController,
                        options: MapOptions(
                          initialCenter: centerPosition,
                          minZoom: 2,
                          maxZoom: 18,
                          initialZoom: 5,
                          keepAlive: true,
                          interactionOptions: InteractionOptions(
                              flags: InteractiveFlag.pinchZoom |
                                  InteractiveFlag.drag),
                        ),
                        children: [CurrentLocationLayer(), CustomTileLayer()],
                      ),
                      // Center Pin Icon
                      Center(
                          child: SizedBox(
                        width: 40,
                        height: 80,
                        child: Column(
                          children: [
                            ref
                                .watch(groupPinImageByIdProvider(ref
                                    .watch(cameraSelectedGroupProvider)
                                    .groupId))
                                .when(
                                  data: (data) => Image.memory(data ?? ref.read(defaultGroupPinImageProvider)),
                                  error: (e, s) => Image.memory(
                                      ref.read(defaultGroupPinImageProvider)),
                                  loading: () => Image.memory(
                                      ref.read(defaultGroupPinImageProvider)),
                                ),
                            SizedBox(width: 40, height: 40),
                          ],
                        ),
                      ))
                    ],
                  ),
                )
              ],
            )),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.done),
            onPressed: () => Routing.to(
                context,
                ImageUpload(
                    image: widget.image,
                    position: _mapController.camera.center))));
  }
}
