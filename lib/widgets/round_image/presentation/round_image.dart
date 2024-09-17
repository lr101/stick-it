import 'dart:typed_data';

import 'package:buff_lisa/widgets/custom_marker/data/default_group_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transparent_image/transparent_image.dart';

class RoundImage extends ConsumerWidget {

  final AsyncValue<Uint8List?> imageCallback;
  final bool clickable;
  final double size;
  final Widget? child;
  final VoidCallback? handleOpenImage;

  RoundImage({super.key, required this.imageCallback, this.clickable = false, required this.size, this.child, this.handleOpenImage}) : assert (clickable && handleOpenImage != null || !clickable);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _clickable(
          context: context,
          child: imageCallback.when<Widget>(
              data: (data) => CircleAvatar(
                backgroundImage: getImage(data, ref.watch(defaultErrorImageProvider)),
                radius: size,
                backgroundColor: Colors.transparent,
                child: child,
              ),
              error: (_, __) => CircleAvatar(
                radius: size,
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: FadeInImage(
                      placeholder: MemoryImage(kTransparentImage),
                      image: MemoryImage(ref.watch(defaultErrorImageProvider)),
                    fadeInDuration: Duration(seconds: 1),
                    height: size * 2,
                    width: size * 2,
                    fit: BoxFit.cover,
                  )
                )
              ),
              loading: () => CircleAvatar(radius: size, backgroundColor: Colors.grey ,child: child)
          )
        );
  }

  ImageProvider<Object> getImage(Uint8List? data, Uint8List defaultImage) {
    if (data != null) {
      try {
        return MemoryImage(data);
      } catch (err) {
        if (kDebugMode) print(err);
      }
    }
    return MemoryImage(defaultImage);
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
