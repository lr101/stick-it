import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:buff_lisa/features/map_home/presentation/osm_copyright.dart';
import 'package:buff_lisa/widgets/custom_feed/data/like_service.dart';
import 'package:buff_lisa/widgets/custom_feed/presentation/like_buttons.dart';
import 'package:buff_lisa/widgets/custom_marker/presentation/custom_marker.dart';
import 'package:buff_lisa/widgets/custom_map_setup//presentation/custom_tile_layer.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:openapi/api.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:buff_lisa/widgets/custom_feed/presentation/feed_card_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/dto/pin_dto.dart';
import '../../../data/service/global_data_service.dart';
import '../../../data/service/pin_image_service.dart';
import '../../../widgets/pin_header/presentation/pin_header.dart';
import '../data/image_service.dart';
import 'like_item.dart';

class FeedCard extends ConsumerStatefulWidget {
  FeedCard({super.key, required this.item, this.distance});

  final LocalPinDto item;
  final double? distance;

  @override
  ConsumerState<FeedCard> createState() => _FeedCardState();
}

class _FeedCardState extends ConsumerState<FeedCard> {
  PageController _pageController = PageController(keepPage: false);
  MapController _mapController = MapController();

  double _zoom = 10;
  bool _firstSelected = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final data = ref.watch(getPinImageInfoProvider(widget.item.id));
    final center = LatLng(widget.item.latitude, widget.item.longitude);
    final userId = ref.watch(globalDataServiceProvider).userId!;
    return SizedBox(
      height: screenWidth * 1.334 + 80,
      width: screenWidth,
      child: data.whenOrNull(
            data: (imageData) {
              if (imageData == null) return null;
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(children: [
                  PinHeader(pinDto: widget.item, onLocationTab: animateToPage, distance: widget.distance,),
                  SizedBox(
                    height: 3,
                  ),
                  Expanded(
                      child: PageView(
                    controller: _pageController,
                    children: [
                      GestureDetector(
                          onDoubleTap: () => ref.read(likeServiceProvider.notifier).addLike(widget.item.id, widget.item.creatorId, CreateLikeDto(userId: userId, like: true)),
                          child: FadeInImage(
                          fadeInDuration: Duration(milliseconds: 100),
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topCenter,
                          placeholder: MemoryImage(kTransparentImage),
                          image: MemoryImage(imageData.image))),
                      Stack(
                        children: [
                          GestureDetector(child: FlutterMap(
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
                              MarkerLayer(markers: [CustomMarkerWidget(pinDto: widget.item, ref: ref),]),
                              OsmCopyright()
                            ],
                          ),
                              onDoubleTap: () => ref.read(likeServiceProvider.notifier).addLike(widget.item.id, widget.item.creatorId, CreateLikeDto(userId: userId, likeLocation: true)),
                          ),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    FloatingActionButton(
                                        onPressed: () => zoomIn(center),
                                        backgroundColor:
                                            Colors.black.withOpacity(0.1),
                                        child: const Icon(Icons.zoom_in)),
                                    SizedBox(height: 5,),
                                    FloatingActionButton(
                                      onPressed: () => zoomOut(center),
                                      backgroundColor:
                                          Colors.black.withOpacity(0.1),
                                      child: const Icon(Icons.zoom_out),
                                    )
                                  ],
                                ),
                              ))
                        ],
                      )
                    ],
                  )),
                  SizedBox(
                    height: 3,
                  ),
                  SizedBox(
                      height: 40,
                      child: widget.item.lastSynced != null ? LikeButtons(pinId: widget.item.id, creatorId: widget.item.creatorId,) : Center(child: Text("This pin is not synced"))
                  )
                ]),
              );
            },
            error: (_, __) => Center(
              child: Icon(Icons.error),
            ),
          ) ??
          FeedCardShimmer(width: screenWidth, height: screenWidth * 1.778),
    );
  }

  void zoomIn(LatLng center) {
    if (_zoom < 18) {
      _zoom += 1;
      _mapController.move(center, _zoom);
    }
  }

  void zoomOut(LatLng center) {
    if (_zoom > 2) {
      _zoom -= 1;
      _mapController.move(center, _zoom);
    }
  }

  void animateToPage() {
    _firstSelected = !_firstSelected;
    _pageController.animateToPage(_firstSelected ? 0 : 1,
        duration: Duration(milliseconds: 350), curve: Curves.easeIn);
  }
}
