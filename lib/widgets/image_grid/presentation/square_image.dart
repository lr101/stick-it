import 'package:buff_lisa/data/service/pin_image_service.dart';
import 'package:buff_lisa/features/group_overview/presentation/sub_widgets/group_image_feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../util/routing/routing.dart';

class SquareImage extends ConsumerWidget {
  final String pinId;
  final String groupId;
  final int index;
  final Function(int index) onTap;

  SquareImage(
      {super.key,
      required this.pinId,
      required this.index,
      required this.groupId,
      required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(GetPinImageProvider(pinId));
    return item.when(
        data: (data) => data == null
            ? const SizedBox()
            : GestureDetector(
                onTap: () => onTap(index),
                child: FadeInImage(
                    fadeInDuration: Duration(milliseconds: 100),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    placeholder: MemoryImage(kTransparentImage),
                    image: MemoryImage(data))),
        error: (_, __) => const Center(child: Icon(Icons.error)),
        loading: () => Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            enabled: true,
            child: Container()));
  }
}
