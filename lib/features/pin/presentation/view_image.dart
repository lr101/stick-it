
import 'package:buff_lisa/data/service/pin_service.dart';
import 'package:buff_lisa/widgets/custom_feed/presentation/feed_card_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewImage extends ConsumerWidget {
  const ViewImage({super.key, required this.pinId});

  final String pinId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pin = ref.watch(pinByIdProvider(pinId));
    double maxWidth = MediaQuery.of(context).size.width;
      double maxHeight = MediaQuery.of(context).size.height;
      if (maxWidth / maxHeight > 3 / 4) {
        maxWidth = maxHeight * 3 / 4;
      } else {
        maxHeight = maxWidth * 4 / 3;
      }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Overview", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 9),
          child: pin.whenOrNull(
            data: (p) => p != null ? FeedCardImage(item: p , maxHeight: maxHeight, maxWidth: maxWidth ) : const Center(child: CircularProgressIndicator()))
            ?? const Center(child: CircularProgressIndicator())
        )
      )
    );


  
  }

}
