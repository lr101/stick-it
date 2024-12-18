import 'package:buff_lisa/data/dto/pin_dto.dart';
import 'package:buff_lisa/widgets/custom_feed/data/feed_map_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:openapi/api.dart';

import '../../../data/service/global_data_service.dart';
import '../../../features/map_home/presentation/osm_copyright.dart';
import '../../custom_map_setup/presentation/custom_tile_layer.dart';
import '../../custom_marker/presentation/custom_marker.dart';
import '../data/like_service.dart';

class FeedMap extends ConsumerStatefulWidget {

  const FeedMap({Key? super.key, required this.item});
  final LocalPinDto item;

  @override
  ConsumerState<FeedMap> createState() => FeedMapState();
}

class FeedMapState extends ConsumerState<FeedMap> {

  late MapController _mapController;
  late LatLng center;
  late double _zoom;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    center = LatLng(widget.item.latitude, widget.item.longitude);
    _zoom = 5;
  }


  @override
  Widget build(BuildContext context) {
    final isExpanded = !ref.watch(feedMapStateProvider(widget.item.id));
    return Stack(
      children: [
        GestureDetector(
            onDoubleTap: (isExpanded) ? like : () => (),
            child: AbsorbPointer(child: FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            minZoom: 2,
            maxZoom: 18,
            initialZoom: _zoom,
            initialCenter: center,
            keepAlive: true,
            interactionOptions: InteractionOptions(
                flags: InteractiveFlag.pinchZoom),
          ),
          children: [
            CustomTileLayer(),
            MarkerLayer(markers: [CustomMarkerWidget(pinDto: widget.item),]),
            if(isExpanded) OsmCopyright()
          ],
        ),)),
        if(isExpanded) Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    heroTag: widget.item.id.toString() + "zoomIn",
                      onPressed: () => zoomIn(center),
                      backgroundColor:
                      Colors.grey.withOpacity(0.5),
                      child: const Icon(Icons.zoom_in)),
                  SizedBox(height: 5,),
                  FloatingActionButton(
                    onPressed: () => zoomOut(center),
                    heroTag: widget.item.id.toString() + "zoomOut",
                    backgroundColor:
                    Colors.grey.withOpacity(0.5),
                    child: const Icon(Icons.zoom_out),
                  ),
                  SizedBox(height: 30,),
                ],
              ),
            ))
      ]);
  }

  void zoomIn(LatLng center) {
    _mapController.move(center, _mapController.camera.zoom + 1);
  }

  void zoomOut(LatLng center) {
    _mapController.move(center, _mapController.camera.zoom - 1);
  }

  void like() {
    final userId = ref.watch(globalDataServiceProvider).userId!;
    ref.read(likeServiceProvider.notifier).addLike(widget.item.id, widget.item.creatorId, CreateLikeDto(userId: userId, likeLocation: true));
  }
}
