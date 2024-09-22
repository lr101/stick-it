import 'package:buff_lisa/data/dto/pin_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../widgets/custom_feed/data/image_service.dart';
import '../../../widgets/custom_feed/presentation/feed_card_shimmer.dart';
import '../../../widgets/pin_header/presentation/pin_header.dart';

class ClosestPinCard extends ConsumerWidget {
  final MapEntry<LocalPinDto, double> item;
  final Function(LatLng, double) moveToLatLng;

  ClosestPinCard({super.key, required this.item, required this.moveToLatLng});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double screenWidth = MediaQuery.of(context).size.width;
    final data = ref.watch(getPinImageInfoProvider(item.key.id));
    return SizedBox(
      height: screenWidth * 1.334 + 80,
      width: screenWidth * 0.75,
      child: data.whenOrNull(
            data: (imageData) {
              if (imageData == null) return null;
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(children: [
                  PinHeader(
                      pinDto: item.key,
                      onLocationTab: () => moveToLatLng(
                          LatLng(item.key.latitude, item.key.longitude), 18),
                      distance: item.value),
                  SizedBox(
                    height: 3,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => moveToLatLng(LatLng(item.key.latitude, item.key.longitude), 18),
                      child: FadeInImage(
                          fadeInDuration: Duration(milliseconds: 100),
                          fit: BoxFit.fitHeight,
                          alignment: Alignment.topCenter,
                          placeholder: MemoryImage(kTransparentImage),
                          image: MemoryImage(imageData.image)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ]),
              );
            },
            error: (_, __) => Center(
              child: Icon(Icons.error),
            ),
          ) ??
          FeedCardShimmer(width: screenWidth, height: screenWidth * 1.778),
    );
  }
}
