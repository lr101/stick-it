import 'dart:math';

import 'package:buff_lisa/data/dto/pin_dto.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:buff_lisa/data/service/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';

import '../../../features/camera/data/camera_state.dart';
import '../../round_image/presentation/round_image.dart';

class PinHeader extends ConsumerWidget {
  final LocalPinDto pinDto;
  final VoidCallback onLocationTab;

  PinHeader({super.key, required this.pinDto, required this.onLocationTab});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(userByIdProvider(pinDto.creatorId));
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
                    imageCallback: AsyncData(
                        data.whenOrNull(data: (d) => d?.profileImage)),
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
                          child: Text(
                            data.whenOrNull(data: (d) => d?.username) ??
                                "Loading...",
                          )),
                    ),
                    SizedBox(
                        height: 18,
                        child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text(
                              ref
                                      .watch(groupByIdProvider(pinDto.groupId))
                                      .whenOrNull(data: (d) => d?.name) ??
                                  "Loading...",
                              style:
                                  const TextStyle(fontStyle: FontStyle.italic),
                            )))
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  formatTime(),
                  style: const TextStyle(fontSize: 10),
                )
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
                          return const Text("...");
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
