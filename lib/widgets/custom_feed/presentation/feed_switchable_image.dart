
import 'package:buff_lisa/data/dto/pin_dto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:transparent_image/transparent_image.dart';

import '../data/feed_map_state.dart';
import '../data/image_service.dart';

class FeedSwitchableImage extends ConsumerWidget {
  
  
  
  final LocalPinDto item;
  final PinImageInfo? image;
  final VoidCallback likeImage;
  final Function(LatLng, double)? onTab;

  const FeedSwitchableImage({super.key, required this.item, required this.image, required this.likeImage, required this.onTab});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final switchFun = ref.read(feedMapStateProvider(item.id).notifier).update;
    final isBig = ref.watch(feedMapStateProvider(item.id));
    return GestureDetector(
        onDoubleTap: isBig ? () => likeImage() : null,
        onTap: isBig && onTab != null ? () => onTab!(
            LatLng(item.latitude, item.longitude), 18) : !isBig ? switchFun : null ,
        child: Container(
            color: Colors.grey.withOpacity(0.5),
            child: FadeInImage(
              fadeInDuration: const Duration(milliseconds: 100),
              fit: BoxFit.cover,
              placeholder: MemoryImage(kTransparentImage),
              image:  MemoryImage(image?.image ?? kTransparentImage),
              width: double.infinity,
            ))
    );
  }

}