import 'package:buff_lisa/data/service/user_image_service_small.dart';
import 'package:buff_lisa/data/service/user_service.dart';
import 'package:buff_lisa/widgets/custom_feed/presentation/feed_card_image.dart';
import 'package:buff_lisa/widgets/custom_feed/presentation/feed_card_shimmer.dart';
import 'package:buff_lisa/widgets/custom_feed/presentation/feed_map.dart';
import 'package:buff_lisa/widgets/custom_feed/presentation/feed_timeline_header.dart';
import 'package:buff_lisa/widgets/custom_feed/presentation/pop_up_menu_feed.dart';
import 'package:buff_lisa/widgets/round_image/presentation/round_image.dart';
import 'package:buff_lisa/widgets/tiles/presentation/batch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import 'package:openapi/api.dart';
import 'package:transparent_image/transparent_image.dart';
import '../../../data/dto/pin_dto.dart';
import '../../../widgets/custom_feed/presentation/like_buttons.dart';
import '../../clickable_names/presentation/clickable_user.dart';
import '../data/feed_map_state.dart';
import '../data/image_service.dart';
import '../data/like_service.dart';

class FeedCard extends ConsumerStatefulWidget {

  final LocalPinDto item;

  const FeedCard({Key? key, required this.item}) : super(key: key);


  @override
  FeedCardState createState() => FeedCardState();
}

class FeedCardState extends ConsumerState<FeedCard> {





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
        height: maxHeight + 2,
        width: maxWidth,
        child:  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FeedTimelineHeader(groupId: widget.item.groupId, creationDate: widget.item.creationDate, height: maxHeight),
          const SizedBox(width: 16),
          FeedCardImage(item: widget.item, maxHeight: maxHeight, maxWidth: maxWidth - 55)
        ],
      ),
    ));});
  }


}
