

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/service/group_image_service.dart';
import '../../../data/service/user_group_service.dart';
import '../../clickable_names/presentation/clickable_group.dart';
import '../../round_image/presentation/round_image.dart';

class FeedTimelineHeader extends ConsumerWidget {
  const FeedTimelineHeader({super.key, required this.groupId, required this.creationDate, required this.height, this.isRotated = false});
  final String groupId;
  final DateTime creationDate;
  final double height;
  final bool isRotated;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RotatedBox(quarterTurns: isRotated ? 3 : 0, child: Stack(
      children: [
        Column(
          children: [
            Container(
              width: 2,
              height: 100,
              color: Colors.grey,
            ),
            RotatedBox(
                quarterTurns: isRotated ? 1 : 0,
                child: ClickableGroup(
                  groupId: groupId, child: RoundImage(
                    size: 15,
                    imageCallback: ref.watch(groupProfilePictureByIdProvider(groupId))
            ),)),
            Container(
              width: 2,
              height: height  - 130,
              color: Colors.grey,
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(width: 15,),
            Column(
              children: [
                SizedBox(
                    height: 95,
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: RotatedBox(quarterTurns: 1, child: Text(formatTime(), style: TextStyle(color: Colors.grey, fontSize: 12),),)
                    )
                ),
                SizedBox(height: 40,),
                  Align(
                    alignment: Alignment.topLeft,
                    child: ClickableGroup(
                      groupId: groupId,
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Text(ref.watch(groupByIdProvider(groupId).select((e) => e.value?.name)) ?? "",
                          style: TextStyle(color: Colors.grey, fontSize: 12),),
                      )
                ))
              ],
            )
          ],
        )
      ],
    )) ;
  }

  String formatTime() {
    DateTime now = DateTime.now().toUtc();
    DateTime time = creationDate.toUtc();
    final difference = now.difference(time);
    if (difference.inDays >= 365) {
      return "${difference.inDays ~/ 365} years ago";
    } else if (difference.inDays >= 7) {
      return "${difference.inDays ~/ 7} weeks ago";
    } else if (difference.inDays >= 1) {
      return "${difference.inDays} days ago";
    } else if (difference.inHours >= 1) {
      return "${difference.inHours} hours ago";
    } else {
      return "${difference.inMinutes} min. ago";
    }
  }

}