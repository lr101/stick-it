import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/features/map_home/data/map_state.dart';
import 'package:buff_lisa/widgets/map_layer/presentation/custom_tile_layer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MapHome extends ConsumerStatefulWidget {
  const MapHome({super.key});

  @override
  ConsumerState<MapHome> createState() => _MapHomeState();
}

class _MapHomeState extends ConsumerState<MapHome> {

  MapController _controller = MapController();

  @override
  Widget build(BuildContext context) {
    final global = ref.watch(globalDataServiceProvider);
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
                    child: Container()
                )
              ],
            ),
          ),
        )
    );
  }

}