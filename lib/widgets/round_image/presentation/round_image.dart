import 'dart:typed_data';

import 'package:buff_lisa/widgets/custom_marker/data/default_group_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RoundImage extends ConsumerWidget {

  final AsyncValue<Uint8List> imageCallback;
  final bool clickable;
  final double size;
  final Widget child;
  final VoidCallback? handleOpenImage;

  RoundImage({super.key, required this.imageCallback, this.clickable = false, required this.size, required this.child, this.handleOpenImage}) : assert (clickable && handleOpenImage != null || !clickable);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _clickable(
          context: context,
          child: imageCallback.when<Widget>(
              data: (data) => CircleAvatar(
                backgroundImage: MemoryImage(data),
                radius: size,
                backgroundColor: Colors.transparent,
                child: child,
              ),
              error: (_, __) => CircleAvatar(
                backgroundImage: MemoryImage(ref.watch(defaultErrorImageProvider)),
                radius: size,
                backgroundColor: Colors.transparent,
                child: child,
              ),
              loading: () => CircleAvatar(radius: size, backgroundColor: Colors.grey ,child: child)
          )
        ),
      ],
    );
  }

  Widget _clickable({required Widget child, required BuildContext context}) {
    if (clickable) {
      return GestureDetector(
          onTap: handleOpenImage,
          child: child
      );
    } else {
      return child;
    }
  }
}
