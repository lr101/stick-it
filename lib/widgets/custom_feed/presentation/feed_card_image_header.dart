
import 'package:buff_lisa/data/dto/pin_dto.dart';
import 'package:buff_lisa/data/service/image_service.dart';
import 'package:buff_lisa/widgets/custom_feed/presentation/pop_up_menu_feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import '../../../data/service/user_service.dart';
import '../../clickable_names/presentation/clickable_user.dart';
import '../../round_image/presentation/round_image.dart';
import '../../tiles/presentation/batch.dart';

class FeedCardImageHeader extends ConsumerWidget {

  final LocalPinDto pin;
  final double? distance;

  const FeedCardImageHeader({super.key, required this.pin, this.distance});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userImage = ref.watch(getUserProfileSmallProvider(pin.creatorId));
    final selectedBatch = ref.watch(userByIdSelectedBatchProvider(pin.creatorId));
    final username = ref.watch(userByIdUsernameProvider(pin.creatorId));
    return Padding(
        padding: const EdgeInsets.all(10), child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const SizedBox(width: 5,),
            ClickableUser(
              userId: pin.creatorId,
              child: RoundImage(imageCallback: userImage, size: 15,),
            ),
            const SizedBox(width: 5,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClickableUser(
                        userId: pin.creatorId,
                        child: Text(username.value ?? "",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 13))),
                    const SizedBox(width: 5,),
                    if (selectedBatch.value != null) Batch(
                        batchId: selectedBatch.value!, fontSize: 7)
                  ],
                ),
                if (distance !=
                    null) getDistance(selectedBatch.value),
                if (distance ==
                    null) getPinLocation(selectedBatch.value)
              ],
            ),
            Expanded(child: Align(
              alignment: Alignment.centerRight,
              child: PopUpMenuFeed(pinDto: pin),
            ))

          ],))
    );
  }


  Widget getDistance(int? selectedBatch) {
    final text = "~ ${distance! >= 1000 ? "${(distance! ~/ 1000)
        .toInt()}km near you" : "${distance!.toInt()}m near you"}";
    return Text(text, style: TextStyle(fontStyle: FontStyle.italic,
        color: Colors.white,
        fontSize: 10),
    );
  }

  Widget getPinLocation(int? selectedBatch) {
    return FutureBuilder<List<Placemark>>(
        future: placemarkFromCoordinates(
            pin.latitude, pin.longitude),
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