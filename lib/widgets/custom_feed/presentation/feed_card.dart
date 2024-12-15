import 'dart:math';

import 'package:buff_lisa/data/service/group_image_service.dart';
import 'package:buff_lisa/data/service/user_image_service_small.dart';
import 'package:buff_lisa/data/service/user_service.dart';
import 'package:buff_lisa/widgets/custom_feed/presentation/feed_card_shimmer.dart';
import 'package:buff_lisa/widgets/custom_feed/presentation/feed_map.dart';
import 'package:buff_lisa/widgets/custom_feed/presentation/pop_up_menu_feed.dart';
import 'package:buff_lisa/widgets/round_image/presentation/round_image.dart';
import 'package:buff_lisa/widgets/tiles/presentation/batch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:openapi/api.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../data/dto/pin_dto.dart';
import '../../../data/service/global_data_service.dart';
import '../../../data/service/pin_image_service.dart';
import '../../../data/service/user_group_service.dart';
import '../../../features/map_home/presentation/osm_copyright.dart';
import '../../../features/profile/presentation/other_user_profile.dart';
import '../../../util/routing/routing.dart';
import '../../../widgets/custom_feed/presentation/like_buttons.dart';
import '../../../widgets/custom_marker/presentation/custom_marker.dart';
import '../../../widgets/custom_map_setup/presentation/custom_tile_layer.dart';
import '../../clickable_names/presentation/clickable_group.dart';
import '../../clickable_names/presentation/clickable_user.dart';
import '../data/feed_map_state.dart';
import '../data/image_service.dart';
import '../data/like_service.dart';

class FeedCard extends ConsumerStatefulWidget {

  final LocalPinDto item;
  final double? distance;

  const FeedCard({Key? key, required this.item, this.distance}) : super(key: key);


  @override
  FeedCardState createState() => FeedCardState();
}

class FeedCardState extends ConsumerState<FeedCard> {



  late final Widget feedMap;

  @override
  void initState() {
    super.initState();
    feedMap = FeedMap(item: widget.item);
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(getPinImageInfoProvider(widget.item));
    final userId = ref.watch(globalDataServiceProvider).userId!;
    final user = ref.watch(userByIdProvider(widget.item.creatorId));


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
          // Timeline
          Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: 2,
                    height: 100,
                    color: Colors.grey,
                  ),
                  ClickableGroup(groupId: widget.item.groupId, child: RoundImage(
                      size: 15,
                      imageCallback: ref.watch(groupProfilePictureByIdProvider(widget.item.groupId))
                  ),),
                  Container(
                    width: 2,
                    height: maxHeight  - 130 + 2,
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
                        child: RotatedBox(quarterTurns: 1, child: Text(ref.watch(groupByIdProvider(widget.item.groupId).select((e) => e.value?.name)) ?? "", style: TextStyle(color: Colors.grey, fontSize: 12),),)
                      )
                    ],
                  )
                ],
              )
            ],
          ),
          const SizedBox(width: 16),
          // Card Content
          Expanded(
            child: data.whenOrNull(
              data: (imageData) {
                if (imageData == null) return null;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                          children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                    SizedBox(
                    width: maxWidth - 30 - 20 - 10 - 10,
                    height: maxHeight - 55,
                    child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: GestureDetector(
                                  onDoubleTap: () => like(userId) ,
                                  child:ref.watch(feedMapStateProvider(widget.item.id)) ? getImage(imageData): feedMap))),
                                SizedBox(height: 5,),
                                LikeButtons(pinId: widget.item.id, creatorId: widget.item.creatorId),]
                          ),
                            SizedBox(
                                width: maxWidth - 30 - 20 - 10 - 10,
                                height: 60,
                                child: Padding(padding: const EdgeInsets.all(10), child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                  children: [
                                    const SizedBox(width: 5,),
                                    RoundImage(imageCallback: ref.watch(userProfilePictureSmallByIdProvider(widget.item.creatorId)), size: 15,),
                                    const SizedBox(width: 5,),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            ClickableUser(userId: widget.item.creatorId, username: user.value?.username ?? "",
                                              textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize:  user.value?.selectedBatch != null ? 12: 14,)),
                                            FutureBuilder<List<Placemark>>(
                                              future: placemarkFromCoordinates(
                                                  widget.item.latitude, widget.item.longitude),
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
                                                  return Text(" - " + near, style: TextStyle(fontStyle: FontStyle.italic, color: Colors.white,  fontSize:  user.value?.selectedBatch != null ? 12: 14),);
                                                } else {
                                                  return const Text("");
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                        if (user.value?.selectedBatch != null) Batch(batchId: user.value!.selectedBatch!, fontSize: 7,)
                                      ],
                                    ),
                                    Expanded(child:Align(
                                      alignment: Alignment.centerRight,
                                      child: PopUpMenuFeed(pinDto: widget.item),
                                    ))

                                ],))
                            )),
                            // Map
                            Positioned(
                              right: 0,
                                bottom: 0,
                                child: SizedBox.square(
                              dimension: 100,
                              child: ClipRRect(
                              borderRadius: BorderRadius.circular(10), // Match the borderRadius of the decoration
                                child: GestureDetector(
                                    onTap: () => ref.read(feedMapStateProvider(widget.item.id).notifier).update(),
                                    child:
                                        ref.watch(feedMapStateProvider(widget.item.id)) ? feedMap : getImage(imageData),
                            ),)))
                          ],
                        ),
                    const Divider(),
                  ],
                );
              }) ?? FeedCardShimmer(height: maxHeight, width: maxWidth),
          ),
        ],
      ),
    ));});
  }

  String formatTime() {
    DateTime now = DateTime.now().toUtc();
    DateTime time = widget.item.creationDate.toUtc();
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

  Widget getImage(PinImageInfo image) {
    return FadeInImage(
      fadeInDuration: const Duration(milliseconds: 100),
      fit: BoxFit.cover,
      placeholder: MemoryImage(kTransparentImage),
      image: MemoryImage(image.image),
      width: double.infinity,

    );
  }

  void like(String userId) {
      ref.read(likeServiceProvider.notifier).addLike(
          widget.item.id, widget.item.creatorId,
          CreateLikeDto(userId: userId, like: ref.read(feedMapStateProvider(widget.item.id)) ? true: null, likeLocation: !ref.read(feedMapStateProvider(widget.item.id)) ? true: null, ));
  }
}
