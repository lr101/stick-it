import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:buff_lisa/features/camera/presentation/image_upload.dart';
import 'package:buff_lisa/widgets/custom_map_setup/presentation/custom_tile_layer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../util/routing/routing.dart';
import '../../../widgets/custom_marker/data/default_group_image.dart';
import '../../group_create/presentation/group_create.dart';
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
    return Scaffold(
        appBar: AppBar(
          title: Text("Approve"),
        ),
        body: Padding(
        padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              ListTile(
                title: Text("How to"),
                subtitle: Text("Select the sticker location by moving the map around until the marker in the center appropriately matches where your picture was taken."),
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
                      initialCenter: widget.center ?? LatLng(0, 0),
                    ),
                    children: [
                      CurrentLocationLayer(),
                      CustomTileLayer()
                    ],
                  ),
                  // Center Pin Icon
                  Center(
                    child: SizedBox(width: 40, height: 80, child: Column(
                        children: [

                    ref.watch(groupPinImageByIdProvider(ref.watch(cameraSelectedGroupProvider).groupId)).when(
                    data: (data) => Image.memory(data),
                    error: (e, s) => Image.memory(ref.read(defaultGroupPinImageProvider)),
                    loading: () => Image.memory(ref.read(defaultGroupPinImageProvider)),
                  ),
                          SizedBox(width: 40, height: 40),
                        ],
                    ),))
                ],
              ),)
            ],
          )

    ), 
      floatingActionButton: FloatingActionButton(child: Icon(Icons.done), onPressed: () => Routing.to(context, ImageUpload(image: widget.image, position: _mapController.camera.center))));
  }

}