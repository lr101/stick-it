
import 'package:buff_lisa/widgets/custom_feed/presentation/feed_card_distance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:latlong2/latlong.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../data/dto/pin_dto.dart';
import '../../../data/service/pin_service.dart';
import '../../../widgets/custom_feed/presentation/feed_card.dart';
import '../data/marker_window_state.dart';

class MapPanel extends ConsumerStatefulWidget {
  const MapPanel({super.key, required this.moveToCurrentPosition, required this.tabController, required this.setLocation});

  final VoidCallback moveToCurrentPosition;
  final TabController tabController;
  final Future<void> Function(LatLng location, double zoom) setLocation;

  @override
  ConsumerState<MapPanel> createState() => _MapPanelState();
}

class _MapPanelState extends ConsumerState<MapPanel> {


  PagingController<int, MapEntry<LocalPinDto, double>> _pagingController =
  PagingController(firstPageKey: 0);

  List<MapEntry<LocalPinDto, double>> _pins = [];


  @override
  void initState() {

    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.moveToCurrentPosition();
      ref.watch(pinsSortedByDistanceProvider).whenData((data) {
        _pins = data;
        _pagingController.refresh();
      });
    });
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final windowsState = ref.watch(markerWindowStateProvider);
    ref.listen(pinsSortedByDistanceProvider, (previous, next) {
      _pins = next.valueOrNull ?? [];
      _pagingController.refresh();
    });
    return Column(
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
        TabBar(controller: widget.tabController, tabs: [
          Tab(
            text: 'Closest Pins',
          ),
          Tab(
            text: 'Recently seen',
          ),
        ]),
        Expanded(child:
        TabBarView(controller: widget.tabController, children: [
          PagedListView<int, MapEntry<LocalPinDto, double>>(
              pagingController: _pagingController,
              scrollDirection: Axis.horizontal,
              builderDelegate: PagedChildBuilderDelegate(
                itemBuilder: (context, item, index) => FeedCardDistance(
                  item: item.key,
                  distance: item.value,
                  onTab: widget.setLocation,
                ),
              )),
          windowsState == null
              ? Center(child: Text('Click on a pin to see details here'))
              : SingleChildScrollView(child: FeedCard(item: windowsState))
        ]))
      ],
    );
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