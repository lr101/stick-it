import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:buff_lisa/widgets/custom_marker/presentation/custom_marker.dart';
import 'package:buff_lisa/widgets/map_layer/presentation/custom_tile_layer.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:buff_lisa/widgets/custom_feed/presentation/feed_card_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/dto/pin_dto.dart';
import '../../../data/service/pin_image_service.dart';
import '../../../widgets/pin_header/presentation/pin_header.dart';
import '../data/image_service.dart';

class FeedCard extends ConsumerStatefulWidget {
  FeedCard({super.key, required this.item});

  final LocalPinDto item;

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
    return SizedBox(
      height: screenWidth * 1.334 + 80,
      width: screenWidth,
      child: data.whenOrNull(
            data: (imageData) {
              if (imageData == null) return null;
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(children: [
                  PinHeader(pinDto: widget.item, onLocationTab: animateToPage),
                  SizedBox(
                    height: 3,
                  ),
                  Expanded(
                      child: PageView(
                    controller: _pageController,
                    children: [
                      FadeInImage(
                          fadeInDuration: Duration(milliseconds: 100),
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topCenter,
                          placeholder: MemoryImage(kTransparentImage),
                          image: MemoryImage(imageData.image)),
                      Stack(
                        children: [
                          FlutterMap(
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
                              MarkerLayer(markers: [
                                CustomMarkerWidget(pinDto: widget.item, ref: ref)
                              ]),
                            ],
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
                  Center(
                    child: Text("Comment:"),
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
