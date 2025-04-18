import 'package:buff_lisa/data/dto/pin_dto.dart';
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/features/map_home/presentation/osm_copyright.dart';
import 'package:buff_lisa/widgets/custom_feed/data/feed_map_state.dart';
import 'package:buff_lisa/widgets/custom_feed/data/like_service.dart';
import 'package:buff_lisa/widgets/custom_map_setup/presentation/custom_tile_layer.dart';
import 'package:buff_lisa/widgets/custom_marker/presentation/custom_marker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:openapi/api.dart';

class FeedMap extends ConsumerStatefulWidget {

  const FeedMap({super.key, required this.item});
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
    final switchFun = ref.read(feedMapStateProvider(widget.item.id).notifier).update;
    return Stack(
      children: [
        GestureDetector(
            onTap: isExpanded ? null : switchFun,
            onDoubleTap: isExpanded ? like : null,
            child: AbsorbPointer(child: FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            minZoom: 2,
            maxZoom: 18,
            initialZoom: _zoom,
            initialCenter: center,
            keepAlive: true,
            interactionOptions: const InteractionOptions(
                flags: InteractiveFlag.pinchZoom,),
          ),
          children: [
            CustomTileLayer(),
            MarkerLayer(markers: [CustomMarkerWidget(pinDto: widget.item),]),
            if(isExpanded) const OsmCopyright(),
          ],
        ),),),
        if(isExpanded) Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    heroTag: "${widget.item.id}zoomIn",
                      onPressed: () => zoomIn(center),
                      backgroundColor:
                      Colors.grey.withValues(alpha: 0.5),
                      child: const Icon(Icons.zoom_in),),
                  const SizedBox(height: 5,),
                  FloatingActionButton(
                    onPressed: () => zoomOut(center),
                    heroTag: "${widget.item.id}zoomOut",
                    backgroundColor:
                    Colors.grey.withValues(alpha: 0.5),
                    child: const Icon(Icons.zoom_out),
                  ),
                  const SizedBox(height: 30,),
                ],
              ),
            ),),
      ],);
  }

  void zoomIn(LatLng center) {
    _mapController.move(center, _mapController.camera.zoom + 1);
  }

  void zoomOut(LatLng center) {
    _mapController.move(center, _mapController.camera.zoom - 1);
  }

  void like() {
    final userId = ref.watch(globalDataServiceProvider).userId!;
    ref.read(likeServiceProvider(widget.item.id).notifier)
        .addLike(widget.item.creatorId, CreateLikeDto(userId: userId, likeLocation: true));
  }
}
