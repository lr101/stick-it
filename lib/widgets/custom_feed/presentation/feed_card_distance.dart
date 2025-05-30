import 'package:buff_lisa/data/dto/pin_dto.dart';
import 'package:buff_lisa/widgets/custom_feed/presentation/feed_card_image.dart';
import 'package:buff_lisa/widgets/custom_feed/presentation/feed_timeline_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

class FeedCardDistance extends ConsumerStatefulWidget {

  final LocalPinDto item;
  final double distance;
  final dynamic Function(LatLng location, double zoom) onTab;

  const FeedCardDistance({super.key, required this.distance, required this.onTab, required this.item});

  @override
  FeedCardDistanceState createState() => FeedCardDistanceState();
}

class FeedCardDistanceState extends ConsumerState<FeedCardDistance> {

  @override
  Widget build(BuildContext context) {


    return LayoutBuilder(builder: (context, constraints) {
      double maxWidth = constraints.maxWidth;
      double maxHeight = constraints.maxHeight;
      if (maxWidth / maxHeight > 3 / 4) {
        maxWidth = maxHeight * 3 / 4;
      } else {
        maxHeight = maxWidth * 4 / 3;
      }
      return SizedBox(
        height: maxHeight,
        width: maxWidth + 2,
        child:  Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FeedTimelineHeader(groupId: widget.item.groupId, creationDate: widget.item.creationDate, height: maxWidth, isRotated: true,),
          const SizedBox(height: 16),
          FeedCardImage(item: widget.item, maxHeight: maxHeight - 70, maxWidth: maxWidth - 20, rotateHeader: true, distance: widget.distance, onTab: widget.onTab,),
        ],
      ),
    ),);},);
  }


}
