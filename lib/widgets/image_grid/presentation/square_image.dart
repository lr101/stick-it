import 'package:buff_lisa/data/service/pin_image_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SquareImage extends ConsumerWidget {

  final String pinId;

  SquareImage({super.key, required this.pinId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref. watch(GetPinImageProvider(pinId));
    return item.when(
        data: (data) => data == null ? const SizedBox() : Image.memory(data, fit: BoxFit.cover),
        error: (_,__) => const SizedBox(),
        loading: () => CircularProgressIndicator()
    );
  }
}
