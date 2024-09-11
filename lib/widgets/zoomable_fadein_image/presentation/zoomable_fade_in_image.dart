import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transparent_image/transparent_image.dart';

class ZoomableFadeInImage extends ConsumerStatefulWidget {
  const ZoomableFadeInImage({super.key, required this.image});

  final Uint8List image;

  @override
  ConsumerState<ZoomableFadeInImage> createState() =>
      _ZoomableFadeInImageState();
}

class _ZoomableFadeInImageState extends ConsumerState<ZoomableFadeInImage> {
  final TransformationController _controller = TransformationController();

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
        transformationController: _controller,
        boundaryMargin: const EdgeInsets.all(0),
        onInteractionEnd: (ScaleEndDetails endDetails) {
          _controller.value = Matrix4.identity();
        },
        child: FadeInImage(
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
            placeholder: MemoryImage(kTransparentImage),
            image: MemoryImage(widget.image)));
  }
}
