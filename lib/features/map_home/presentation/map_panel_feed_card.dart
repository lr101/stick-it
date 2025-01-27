
import 'package:buff_lisa/widgets/custom_feed/presentation/feed_card_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/custom_feed/data/feed_description.dart';
import '../../../widgets/custom_feed/data/feed_item_service.dart';
import '../../../widgets/custom_feed/presentation/feed_timeline_header.dart';

class MapPanelFeedCard extends ConsumerWidget {
  const MapPanelFeedCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(feedItemProvider);

    return LayoutBuilder(builder: (context, constraints) {
      double maxWidth = constraints.maxWidth;
      double maxHeight = constraints.maxHeight;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FeedTimelineHeader(groupId: item.groupId, creationDate: item.creationDate, height: maxHeight),
            const SizedBox(width: 16),
            FeedCardImage(item: item, maxHeight: maxHeight -  ref.watch(feedDescriptionHeightProvider(item)), maxWidth: maxWidth - 55)
          ],
        ),
      );});
  }


}