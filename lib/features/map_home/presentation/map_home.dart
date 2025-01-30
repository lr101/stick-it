import 'package:buff_lisa/data/service/geojson_service.dart';
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/features/map_home/data/map_panel_state.dart';
import 'package:buff_lisa/features/map_home/data/map_state.dart';
import 'package:buff_lisa/features/map_home/data/marker_window_state.dart';
import 'package:buff_lisa/features/map_home/presentation/circle_with_indicator.dart';
import 'package:buff_lisa/features/map_home/presentation/map_panel.dart';
import 'package:buff_lisa/features/map_home/presentation/map_panel_draggable.dart';
import 'package:buff_lisa/features/map_home/presentation/osm_copyright.dart';
import 'package:buff_lisa/widgets/custom_map_setup/presentation/custom_tile_layer.dart';
import 'package:buff_lisa/widgets/custom_marker/presentation/custom_marker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MapHome extends ConsumerStatefulWidget {
  const MapHome({super.key});

  @override
  ConsumerState<MapHome> createState() => _MapHomeState();
}

class _MapHomeState extends ConsumerState<MapHome>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final MapController _controller = MapController();
  late final AnimationController _animateController;
  ValueNotifier<double> panelPosition = ValueNotifier<double>(0);
  final PanelController _panelController = PanelController();
  late final TabController _tabController;
  ValueNotifier<double> mapZoom = ValueNotifier<double>(5);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _animateController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    WidgetsBinding.instance
        .addPostFrameCallback((_) => moveToCurrentPosition());
  }

  @override
  void dispose() {
    _animateController.dispose();
    _controller.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final mapState = ref.watch(mapStatesProvider);
    final panelState = ref.watch(mapPanelStateProvider);
    ref.watch(markerWindowStateProvider);
    return LayoutBuilder(
      builder: (context, constraints) => Scaffold(
        body: SlidingUpPanel(
          controller: _panelController,
          color: Theme.of(context).scaffoldBackgroundColor,
          onPanelOpened: () => ref.watch(mapPanelStateProvider.notifier).set(true),
          onPanelClosed: () => ref.watch(mapPanelStateProvider.notifier).set(false),
          panelSnapping: false,
          boxShadow: const [],
          minHeight: 20,
          maxHeight: constraints.maxHeight * 0.7,
          border: Border.all(color: Colors.grey),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          onPanelSlide: (position) => panelPosition.value = position,
          body: Column(
            children: [
              SizedBox(
                height: constraints.maxHeight,
                child: FlutterMap(
                  mapController: _controller,
                  options: MapOptions(
                    onLongPress: onMapEvent,
                    minZoom: 2,
                    maxZoom: 18,
                    initialZoom: 5,
                    keepAlive: true,
                    initialCenter: ref.watch(lastKnownLocationProvider),
                    onPositionChanged: (position, hasGesture) =>
                        mapZoom.value = position.zoom,
                    interactionOptions: const InteractionOptions(
                      flags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
                    ),
                  ),
                  children: [
                    CustomTileLayer(),
                    PolygonLayer(
                        polygons: ref
                                .watch(geojsonServiceProvider)
                                .whenOrNull(data: (data) => data) ??
                            <Polygon>[],),
                    CurrentLocationLayer(),
                    MarkerClusterLayerWidget(
                      options: MarkerClusterLayerOptions(
                        disableClusteringAtZoom: 16,
                        size: const Size(80, 80),
                        markers: mapState.markers,
                        polygonOptions:
                            const PolygonOptions(color: Colors.transparent),
                        onMarkerTap: onMarkerTab,
                        builder: (context, markers) => CircleWithIndicator(
                            color: Theme.of(context).highlightColor,
                            number: markers.length,),
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: OsmCopyright(),),
                  ],
                ),
              ),
            ],
          ),
          panel: Column(
            children: [
              MapPanelDraggable(panelController: _panelController),
              if (panelState)
                Expanded(
                    child: MapPanel(
                        tabController: _tabController,
                        setLocation: setLocation,),),
            ],
          ),
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
          ),
        ),
      ),
    );
  }

  Future<void> onMarkerTab(Marker marker) async {
    final m = marker as CustomMarkerWidget;
    ref.read(markerWindowStateProvider.notifier).openPopup(m.pinDto);
    ref.read(mapPanelStateProvider.notifier).set(true);
    await _panelController.animatePanelToPosition(1.0, duration: const Duration(milliseconds: 200),);
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
      begin: _controller.camera.center.latitude,
      end: location.latitude,
    );
    final lngTween = Tween<double>(
      begin: _controller.camera.center.longitude,
      end: location.longitude,
    );
    final zoomTween = Tween<double>(begin: _controller.camera.zoom, end: zoom);

    final Animation<double> animation = CurvedAnimation(
        parent: _animateController, curve: Curves.fastOutSlowIn,);

    _animateController.addListener(() {
      _controller.move(
        LatLng(latTween.evaluate(animation), lngTween.evaluate(animation)),
        zoomTween.evaluate(animation),
      );
    });
    _animateController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        ref.read(districtServiceProvider.notifier).updateLatLong(
            latTween.evaluate(animation), lngTween.evaluate(animation),);
      }
    });

    _animateController.forward(from: 0.0);
  }

  void onMapEvent(TapPosition event, LatLng pos) {
    ref
        .read(districtServiceProvider.notifier)
        .updateLatLong(pos.latitude, pos.longitude);
  }

  @override
  bool get wantKeepAlive => true;
}
