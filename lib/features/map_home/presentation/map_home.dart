import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/data/service/online_init_service.dart';
import 'package:buff_lisa/data/service/pin_service.dart';
import 'package:buff_lisa/features/map_home/data/map_state.dart';
import 'package:buff_lisa/features/map_home/presentation/closest_pin_card.dart';
import 'package:buff_lisa/widgets/custom_feed/presentation/feed_card.dart';
import 'package:buff_lisa/widgets/custom_map_setup/presentation/custom_tile_layer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../data/dto/pin_dto.dart';
import '../../../data/service/pin_image_service.dart';
import '../../../data/service/user_group_service.dart';
import '../data/marker_window_state.dart';
import '../../../widgets/custom_marker/presentation/custom_marker.dart';

class MapHome extends ConsumerStatefulWidget {
  const MapHome({super.key,  required this.centerInit});

  final LatLng? centerInit;

  @override
  ConsumerState<MapHome> createState() => _MapHomeState();
}

class _MapHomeState extends ConsumerState<MapHome>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  MapController _controller = MapController();
  PanelController _panelController = PanelController();
  PagingController<int, MapEntry<LocalPinDto, double>> _pagingController =
      PagingController(firstPageKey: 0);

  List<MapEntry<LocalPinDto, double>> _pins = [];
  ValueNotifier<double> panelPosition = ValueNotifier<double>(0);
  late final animateController;
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    animateController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      moveToCurrentPosition();
      ref.watch(pinsSortedByDistanceProvider).whenData((data) {
        _pins = data;
        _pagingController.refresh();
      });
    });
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final height = MediaQuery.of(context).size.height;
    final windowsState = ref.watch(markerWindowStateProvider);
    ref.listen(pinsSortedByDistanceProvider, (previous, next) {
      _pins = next.value ?? [];
      _pagingController.refresh();
    });
    final mapState = ref.watch(mapStatesProvider);
    ref.watch(onlineInitServiceProvider);
    return Scaffold(
      appBar: null,
      body: SizedBox(
        height: height,
        width: MediaQuery.of(context).size.width,
        child: SlidingUpPanel(
          controller: _panelController,
          color: Theme.of(context).scaffoldBackgroundColor,
          backdropEnabled: false,
          panelSnapping: false,
          boxShadow: const [],
          minHeight: 20,
          maxHeight: height * 0.7,
          border: Border.all(color: Colors.grey),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
          onPanelSlide: (position) => panelPosition.value = position,
          body: FlutterMap(
            mapController: _controller,
            options: MapOptions(
              minZoom: 2,
              maxZoom: 18,
              initialZoom: 5,
              keepAlive: true,
              initialCenter: widget.centerInit ?? LatLng(49.01105, 8.25190),
              interactionOptions: InteractionOptions(
                  flags: InteractiveFlag.pinchZoom | InteractiveFlag.drag),
            ),
            children: [
              CustomTileLayer(),
              CurrentLocationLayer(),
              MarkerClusterLayerWidget(
                options: MarkerClusterLayerOptions(
                  disableClusteringAtZoom: 17,
                  maxClusterRadius: 45,
                  size: const Size(40, 40),
                  markers: mapState.markers,
                  centerMarkerOnClick: true,
                  onMarkerTap: (marker) async {
                    final m = marker as CustomMarkerProvider;
                    ref
                        .read(markerWindowStateProvider.notifier)
                        .openPopup(m.pinDto);
                    await _panelController.animatePanelToPosition(1.0, duration: const Duration(milliseconds: 200));
                    _tabController.animateTo(1, duration: const Duration(milliseconds: 200));
                  },
                  builder: (context, markers) {
                    return FloatingActionButton(
                      heroTag: markers.first.key,
                      key: markers.first.key,
                      onPressed: null,
                      child: Text(markers.length.toString()),
                    );
                  },
                ),
              ),
            ],
          ),
          panel: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 22,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
                child: Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Theme.of(context).hintColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(2.5))))),
              ),
              TabBar(controller: _tabController, tabs: [
                Tab(
                  text: 'Closest Pins',
                ),
                Tab(
                  text: 'Recently seen',
                ),
              ]),
              Expanded(child:
              TabBarView(controller: _tabController, children: [
                PagedListView<int, MapEntry<LocalPinDto, double>>(
                    pagingController: _pagingController,
                    scrollDirection: Axis.horizontal,
                    builderDelegate: PagedChildBuilderDelegate(
                      itemBuilder: (context, item, index) => ClosestPinCard(
                        item: item,
                        moveToLatLng: setLocation,
                      ),
                    )),
                windowsState == null
                    ? Center(child: Text('Click on a pin to see details here'))
                    : FeedCard(item: windowsState)
              ]))
            ],
          ),
        ),
      ),
      floatingActionButton: Align(
          alignment: Alignment.bottomRight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: moveToCurrentPosition,
                child: const Icon(Icons.my_location),
              ),
              ValueListenableBuilder(
                valueListenable: panelPosition,
                builder: (context, double value, child) {
                  return SizedBox(
                    height: value * height * 0.7 + 10,
                  );
                },
              ),
            ],
          )),
    );
  }

  Future<void> moveToCurrentPosition() async {
    if (!(await Permission.accessMediaLocation.isGranted)) {
      await Permission.accessMediaLocation.request();
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

    animateController.forward(from: 0.0);
  }

  Future<void> _fetchPage(pageKey, {pageSize = 5}) async {
    try {
      int end;
      if (pageKey + pageSize > _pins.length) {
        end = _pins.length;
      } else {
        end = pageKey + pageSize;
      }
      final idList = _pins.getRange(pageKey, end).toList();
      ref
          .read(pinImageServiceProvider.notifier)
          .addImages(idList.map((e) => e.key.id).toList());
      if (end == _pins.length) {
        _pagingController.appendLastPage(idList);
      } else {
        _pagingController.appendPage(idList, pageKey + pageSize);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  bool get wantKeepAlive => true;
}
