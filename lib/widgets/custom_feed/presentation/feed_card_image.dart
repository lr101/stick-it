import 'package:buff_lisa/data/dto/pin_dto.dart';
import 'package:buff_lisa/widgets/custom_feed/presentation/pop_up_menu_feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import 'package:openapi/api.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../data/service/global_data_service.dart';
import '../../../data/service/user_image_service_small.dart';
import '../../../data/service/user_service.dart';
import '../../clickable_names/presentation/clickable_user.dart';
import '../../round_image/presentation/round_image.dart';
import '../../tiles/presentation/batch.dart';
import '../data/feed_map_state.dart';
import '../data/image_service.dart';
import '../data/like_service.dart';
import 'feed_card_shimmer.dart';
import 'feed_description.dart';
import 'feed_map.dart';
import 'like_buttons.dart';

class FeedCardImage extends ConsumerStatefulWidget{
  
  const FeedCardImage({super.key, required this.item, required this.maxHeight, required this.maxWidth, this.distance, this.rotateHeader = false, this.onTab});
  final LocalPinDto item;
  final double maxWidth;
  final double maxHeight;
  final double? distance;
  final bool rotateHeader;
  final dynamic Function(LatLng location, double zoom)? onTab;

  @override
  ConsumerState<FeedCardImage> createState() => _FeedCardImageState();
}

class _FeedCardImageState extends ConsumerState<FeedCardImage> {


  late final Widget feedMap;

  @override
  void initState() {
    super.initState();
    feedMap = FeedMap(item: widget.item);
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(getPinImageInfoProvider(widget.item));
    final selectedBatch = ref.watch(
        userByIdProvider(widget.item.creatorId).select((e) => e?.selectedBatch));
    final username = ref.watch(
        userByIdProvider(widget.item.creatorId).select((e) => e?.username));
    final renderDescription = !widget.rotateHeader && widget.item.description != null;
    return Expanded(
            child: Padding(padding: EdgeInsets.symmetric(horizontal: widget.rotateHeader ? 5 : 0, vertical: widget.rotateHeader ? 0 : 5), child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Padding(padding: EdgeInsets.only(right: 10), child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         SizedBox(
                           height: widget.maxHeight - 50 - (renderDescription ? 50 : 0),
                             child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: ref.watch(feedMapStateProvider(widget.item.id)) ? getImage(data.value) : feedMap)),
                          SizedBox(height: 5,),
                          LikeButtons(pinId: widget.item.id,
                              creatorId: widget.item.creatorId),
                          if (renderDescription) SizedBox(height: 5,),
                          if (renderDescription) FeedDescriptionExpandable(pin: widget.item,)
                        ]
                    )),
                    SizedBox(
                        width: widget.maxWidth - 20,
                        height: 65,
                        child: Padding(
                            padding: const EdgeInsets.all(10), child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                const SizedBox(width: 5,),
                                ClickableUser(
                                  userId: widget.item.creatorId,
                                  child: RoundImage(
                                    imageCallback: ref.watch(
                                      userProfilePictureSmallByIdProvider(
                                          widget.item.creatorId)), size: 15,),
                                ),
                                const SizedBox(width: 5,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        ClickableUser(
                                            userId: widget.item.creatorId,
                                            child: Text(username ?? "",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 13))),
                                        const SizedBox(width: 5,),
                                        if (selectedBatch != null) Batch(
                                          batchId: selectedBatch, fontSize: 7)
                                      ],
                                    ),
                                    if (widget.distance !=
                                        null) getDistance(selectedBatch),
                                    if (widget.distance ==
                                        null) getPinLocation(selectedBatch)
                                  ],
                                ),
                                Expanded(child: Align(
                                  alignment: Alignment.centerRight,
                                  child: PopUpMenuFeed(pinDto: widget.item),
                                ))

                              ],))
                        )),
                    // Map
                    Positioned(
                        right: 0,
                        top: widget.maxHeight - (renderDescription ? 170 : 120),
                        child: SizedBox.square(
                            dimension: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              // Match the borderRadius of the decoration
                              child: ref.watch(feedMapStateProvider(widget.item.id)) ? feedMap : getImage(data.value)
                              ),))
                  ],
                ),
              ],
            ))
    );
  }

  Widget getImage(PinImageInfo? image) {
    final switchFun = ref.read(feedMapStateProvider(widget.item.id).notifier).update;
    final isBig = ref.watch(feedMapStateProvider(widget.item.id));
    return GestureDetector(
        onDoubleTap: isBig ? () => likeImage() : null,
        onTap: isBig && widget.onTab != null ? () => widget.onTab!(
            LatLng(widget.item.latitude, widget.item.longitude), 18) : !isBig ? switchFun : null ,
        child: Container(
         color: Colors.grey.withOpacity(0.5),
          child: image != null ? FadeInImage(
          fadeInDuration: const Duration(milliseconds: 100),
          fit: BoxFit.cover,
          placeholder: MemoryImage(kTransparentImage),
          image:  MemoryImage(image.image),
          width: double.infinity,
        ) : FeedCardShimmer())
    );
  }

  void likeImage() {
    final userId = ref.watch(globalDataServiceProvider).userId!;
    ref.read(likeServiceProvider.notifier).addLike(
        widget.item.id, widget.item.creatorId,
        CreateLikeDto(userId: userId, like: true));
  }

  Widget getDistance(int? selectedBatch) {
    final text = "~ ${widget.distance! >= 1000 ? "${(widget.distance! ~/ 1000)
        .toInt()}km near you" : "${widget.distance!.toInt()}m near you"}";
    return Text(text, style: TextStyle(fontStyle: FontStyle.italic,
        color: Colors.white,
        fontSize: 10),
    );
  }

  Widget getPinLocation(int? selectedBatch) {
    return FutureBuilder<List<Placemark>>(
        future: placemarkFromCoordinates(
            widget.item.latitude, widget.item.longitude),
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.requireData.isNotEmpty) {
            Placemark first = snapshot.requireData.first;
            String near = "";
            if (first.locality != null) {
              near += first.locality!;
              if (first.isoCountryCode != null) {
                near += " (${first.isoCountryCode})";
              }
            } else if (first.country != null) {
              near += first.country!;
            }
            return Text(near, style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.white,
                fontSize: 10));
          } else {
            return const Text("");
          }
        }
    );
  }
}