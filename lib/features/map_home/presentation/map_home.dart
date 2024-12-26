import 'dart:convert';

import 'package:buff_lisa/data/service/geojson_service.dart';
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/data/service/pin_service.dart';
import 'package:buff_lisa/features/map_home/data/map_state.dart';
import 'package:buff_lisa/features/map_home/presentation/circle_with_indicator.dart';
import 'package:buff_lisa/features/map_home/presentation/map_panel.dart';
import 'package:buff_lisa/features/map_home/presentation/osm_copyright.dart';
import 'package:buff_lisa/widgets/custom_feed/presentation/feed_card.dart';
import 'package:buff_lisa/widgets/custom_map_setup/presentation/custom_tile_layer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_geojson/flutter_map_geojson.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../data/dto/pin_dto.dart';
import '../data/marker_window_state.dart';
import '../../../widgets/custom_marker/presentation/custom_marker.dart';

class MapHome extends ConsumerStatefulWidget {
  const MapHome({super.key});

  @override
  ConsumerState<MapHome> createState() => _MapHomeState();
}

class _MapHomeState extends ConsumerState<MapHome>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  MapController _controller = MapController();
  late final animateController;
  ValueNotifier<double> panelPosition = ValueNotifier<double>(0);
  PanelController _panelController = PanelController();
  late final TabController _tabController;
  ValueNotifier<double> mapZoom = ValueNotifier<double>(5);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    animateController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
  }

  @override
  void dispose() {
    animateController.dispose();
    _controller.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final mapState = ref.watch(mapStatesProvider);
    return LayoutBuilder(builder: (context, constraints) => Scaffold(
      appBar: null,
      body: SlidingUpPanel(
            controller: _panelController,
            color: Theme.of(context).scaffoldBackgroundColor,
            backdropEnabled: false,
            panelSnapping: false,
            boxShadow: const [],
            minHeight: 20,
            maxHeight: constraints.maxHeight * 0.7,
            border: Border.all(color: Colors.grey),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
            onPanelSlide: (position) => panelPosition.value = position,
            body: Column(
              children: [Container(
                  height: constraints.maxHeight,
                  child:
                  FlutterMap(
                    mapController: _controller,
                    options: MapOptions(
                      onLongPress: onMapEvent,
                      minZoom: 2,
                      maxZoom: 18,
                      initialZoom: 5,
                      keepAlive: true,
                      initialCenter: ref.watch(lastKnownLocationProvider),
                      onPositionChanged: (position, hasGesture) => mapZoom.value = position.zoom,
                      interactionOptions: InteractionOptions(
                          flags: InteractiveFlag.pinchZoom | InteractiveFlag.drag),
                    ),
                    children: [
                      CustomTileLayer(),
                      PolygonLayer(polygons: ref.watch(geojsonServiceProvider).whenOrNull(data: (data) => data) ?? <Polygon>[]),
                      CurrentLocationLayer(),
                      MarkerClusterLayerWidget(
                        options: MarkerClusterLayerOptions(
                          disableClusteringAtZoom: 16,
                          maxClusterRadius: 80,
                          size: const Size(80, 80),
                          markers: mapState.markers,
                          centerMarkerOnClick: true,
                          polygonOptions: PolygonOptions(color: Colors.transparent),
                          onMarkerTap: onMarkerTab,
                          builder: (context, markers) => CircleWithIndicator(color: Theme.of(context).highlightColor, number: markers.length)
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 20), child: OsmCopyright())
                    ],
                  )
              ),],
            ),
            panel: MapPanel(
                moveToCurrentPosition: moveToCurrentPosition,
                tabController: _tabController,
                setLocation: setLocation
            )
        ),
      floatingActionButton: Align(
          alignment: Alignment.bottomRight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: "moveToCurrentLocation",
                onPressed: moveToCurrentPosition,
                child: const Icon(Icons.my_location),
              ),
              ValueListenableBuilder(
                valueListenable: panelPosition,
                builder: (context, double value, child) {
                  return SizedBox(
                    height: value * (constraints.maxHeight * 0.7 - 20) + 10,
                  );
                },
              ),
            ],
          )),
    ));
  }

  Future<void> onMarkerTab(Marker marker) async {
    final m = marker as CustomMarkerWidget;
    ref.read(markerWindowStateProvider.notifier).openPopup(m.pinDto);
    await _panelController.animatePanelToPosition(1.0, duration: const Duration(milliseconds: 200));
    _tabController.animateTo(1, duration: const Duration(milliseconds: 200));
  }

  Future<void> moveToCurrentPosition() async {
    if ((await Geolocator.checkPermission()) == LocationPermission.denied) {
      await Geolocator.requestPermission();
    }
    final destLocation = await Geolocator.getCurrentPosition();
    setLocation(LatLng(destLocation.latitude, destLocation.longitude), 15);
  }

  Future<void> setLocation(LatLng location, double zoom) async {
    final latTween = Tween<double>(
        begin: _controller.camera.center.latitude, end: location.latitude);
    final lngTween = Tween<double>(
        begin: _controller.camera.center.longitude, end: location.longitude);
    final zoomTween = Tween<double>(begin: _controller.camera.zoom, end: zoom);

    final Animation<double> animation =
        CurvedAnimation(parent: animateController, curve: Curves.fastOutSlowIn);

    animateController.addListener(() {
      _controller.move(
          LatLng(latTween.evaluate(animation), lngTween.evaluate(animation)),
          zoomTween.evaluate(animation));
    });
    animateController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        ref.read(districtServiceProvider.notifier).updateLatLong(latTween.evaluate(animation), lngTween.evaluate(animation));
      }
    });

    animateController.forward(from: 0.0);
  }

  void onMapEvent(TapPosition event, LatLng pos) {
    ref.read(districtServiceProvider.notifier).updateLatLong(pos.latitude, pos.longitude);
  }


  @override
  bool get wantKeepAlive => true;
}
