import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/data/service/pin_service.dart';
import 'package:buff_lisa/features/map_home/data/map_state.dart';
import 'package:buff_lisa/widgets/custom_feed/presentation/feed_card.dart';
import 'package:buff_lisa/widgets/map_layer/presentation/custom_tile_layer.dart';
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

class MapHome extends ConsumerStatefulWidget {
  const MapHome({super.key});

  @override
  ConsumerState<MapHome> createState() => _MapHomeState();
}

class _MapHomeState extends ConsumerState<MapHome> with TickerProviderStateMixin {

  MapController _controller = MapController();
  PagingController _pagingController = PagingController(firstPageKey: 0);

  List<MapEntry<LocalPinDto, double>> _pins = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setLocation();
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
    final global = ref.watch(globalDataServiceProvider);
    ref.listen(pinsSortedByDistanceProvider,(previous, next) {
      _pins = next.value ?? [];
      _pagingController.refresh();
    });
    final mapState = ref.watch(mapStatesProvider);
    return Scaffold(appBar: null,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SlidingUpPanel(
            color: Theme.of(context).scaffoldBackgroundColor,
            backdropEnabled: false,
            boxShadow: const [],
            minHeight: 20,
            maxHeight: 222,
            border: Border.all(color: Colors.grey),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0)),
            onPanelSlide: (position) => (),
            onPanelOpened: () => (),
            body: FlutterMap(
              mapController: _controller,
              options: MapOptions(
                minZoom: 2,
                maxZoom: 18,
                initialZoom: 5,
                keepAlive: true,
                interactionOptions:  InteractionOptions(flags: InteractiveFlag.pinchZoom | InteractiveFlag.drag),
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
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)
                    ),
                    //  border: Border(top: BorderSide(), right: BorderSide(), left: BorderSide(), bottom: BorderSide.none)
                  ),
                  child: Center(
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          height: 5,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(2.5))
                          )
                      )
                  ),
                ),
                SizedBox(
                    height: 200,
                    child: PagedListView(
                        pagingController: _pagingController,
                        builderDelegate: PagedChildBuilderDelegate<LocalPinDto>(
                          itemBuilder: (context, item, index) => FeedCard(item: item),
                        )
                    )
                )
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
              onPressed: () => setLocation(),
              child: const Icon(Icons.my_location),
            ),
            SizedBox(height: 10,)
          ],
        )
      ),
    );
  }

  Future<void> setLocation() async  {
    if (!(await Permission.accessMediaLocation.isGranted)) {
      await Permission.accessMediaLocation.request();
    }
    final destLocation = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    final latTween = Tween<double>(begin: _controller.camera.center.latitude, end: destLocation.latitude);
    final lngTween = Tween<double>(begin: _controller.camera.center.longitude, end: destLocation.longitude);
    final zoomTween = Tween<double>(begin: _controller.camera.zoom, end: 14);

    final animateController = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);

    final Animation<double> animation = CurvedAnimation(parent: animateController, curve: Curves.fastOutSlowIn);

    animateController.addListener(() {
      _controller.move(
          LatLng(latTween.evaluate(animation), lngTween.evaluate(animation)),
          zoomTween.evaluate(animation));
    });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animateController.forward();
      } else if (status == AnimationStatus.dismissed) {
        animateController.dispose();
      }
    });

    animateController.forward();
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
      ref.read(pinImageServiceProvider.notifier).addImages(idList.map((e) => e.key.id).toList());
      if (end == _pins.length) {
        _pagingController.appendLastPage(idList);
      } else {
        _pagingController.appendPage(idList, pageKey + pageSize);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

}