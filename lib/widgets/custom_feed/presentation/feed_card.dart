import 'package:buff_lisa/widgets/custom_feed/data/feed_description.dart';
import 'package:buff_lisa/widgets/custom_feed/presentation/feed_card_image.dart';
import 'package:buff_lisa/widgets/custom_feed/presentation/feed_timeline_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/dto/pin_dto.dart';

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
      return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FeedTimelineHeader(groupId: widget.item.groupId, creationDate: widget.item.creationDate, height: maxHeight + ref.watch(feedDescriptionHeightProvider(widget.item))),
          const SizedBox(width: 16),
          FeedCardImage(item: widget.item, maxHeight: maxHeight, maxWidth: maxWidth - 55, )
        ],
      ),
    );});
  }


}
