import 'package:buff_lisa/widgets/custom_feed/data/feed_description.dart';
import 'package:buff_lisa/widgets/custom_feed/data/feed_item_service.dart';
import 'package:buff_lisa/widgets/custom_feed/presentation/feed_card_image.dart';
import 'package:buff_lisa/widgets/custom_feed/presentation/feed_timeline_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedCard extends ConsumerWidget {
  const FeedCard({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(feedItemProvider);

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
          FeedTimelineHeader(groupId: item.groupId, creationDate: item.creationDate, height: maxHeight + ref.watch(feedDescriptionHeightProvider(item))),
          const SizedBox(width: 16),
          FeedCardImage(item: item, maxHeight: maxHeight, maxWidth: maxWidth - 55, ),
        ],
      ),
    );},);
  }


}
