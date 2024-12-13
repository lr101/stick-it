import 'dart:math';

import 'package:buff_lisa/data/dto/pin_dto.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:buff_lisa/data/service/user_image_service_small.dart';
import 'package:buff_lisa/data/service/user_service.dart';
import 'package:buff_lisa/widgets/clickable_names/presentation/clickable_group.dart';
import 'package:buff_lisa/widgets/clickable_names/presentation/clickable_user.dart';
import 'package:buff_lisa/widgets/custom_feed/presentation/pop_up_menu_feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import '../../../data/service/global_data_service.dart';
import '../../round_image/presentation/round_image.dart';
import '../../tiles/presentation/batch.dart';

class PinHeader extends ConsumerWidget {
  final LocalPinDto pinDto;
  final VoidCallback onLocationTab;
  final double? distance;

  PinHeader({super.key, required this.pinDto, required this.onLocationTab, this.distance});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final username = ref.watch(userByIdProvider(pinDto.creatorId).select((e) => e.value?.username ?? " "));
    final isCurrentUser = pinDto.creatorId == ref.watch(globalDataServiceProvider).userId;
    final int? batch;
    if (isCurrentUser) {
      batch = ref.watch(currentUserServiceProvider.select((e) => e.selectedBatch));
    } else {
      batch = ref.watch(userByIdProvider(pinDto.creatorId).select((e) => e.value?.selectedBatch));
    }
    return Column(
      children: [
        SizedBox(
          height: 40,
          width: MediaQuery.of(context).size.width,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: RoundImage(
                    size: 16,
                    imageCallback: ref.watch(userProfilePictureSmallByIdProvider(pinDto.creatorId)),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 22,
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child:  Row(
                        children: [
                          ClickableUser(userId: pinDto.creatorId, username: username),
                          SizedBox(width: 5,),
                          if (batch != null) Batch(batchId: batch, fontSize: 8),
                        ],
                        ),
                    )),
                    SizedBox(
                        height: 18,
                        child: FittedBox(
                          fit: BoxFit.fitHeight,
                          child: ref
                                  .watch(groupByIdProvider(pinDto.groupId))
                                  .whenOrNull(
                                      data: (d) => ClickableGroup(
                                            groupDto: d!,
                                            textStyle: const TextStyle(
                                                fontStyle: FontStyle.italic),
                                          )) ??
                              Text(" "),
                        ))
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      formatTime(),
                      style: const TextStyle(fontSize: 10),
                    ),
                    if (distance != null) Text("~${distance! >= 1000 ? "${(distance! ~/1000).toInt()}km" : "${distance!.toInt()}m"}", style: const TextStyle(fontSize: 10),)
                  ],
                ),
                PopUpMenuFeed(pinDto: pinDto)
              ],
            )
          ]),
        ),
        GestureDetector(
          onTap: onLocationTab,
          child: Container(
              height: 40,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 5),
                    Icon(Icons.location_on),
                    FutureBuilder<List<Placemark>>(
                      future: placemarkFromCoordinates(
                          pinDto.latitude, pinDto.longitude),
                      builder: (context, snapshot) {
                        if (snapshot.hasData &&
                            snapshot.requireData.isNotEmpty) {
                          Placemark first = snapshot.requireData.first;
                          String near = "";
                          if (first.locality != null) {
                            near += first.locality!;
                            if (first.isoCountryCode != null)
                              near += " (${first.isoCountryCode})";
                          } else if (first.country != null) {
                            near += first.country!;
                          }
                          return Text(near);
                        } else {
                          return const Text("");
                        }
                      },
                    ),
                  ])),
        )
      ],
    );
  }

  String formatTime() {
    DateTime now = DateTime.now().toUtc();
    DateTime time = pinDto.creationDate.toUtc();
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
