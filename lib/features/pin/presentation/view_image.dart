
import 'package:buff_lisa/data/entity/pin_entity.dart';
import 'package:buff_lisa/widgets/custom_feed/presentation/feed_card_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewImage extends ConsumerWidget {
  const ViewImage({super.key, required this.pin});

  final PinEntity pin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          child: FeedCardImage(item: pin, maxHeight: maxHeight, maxWidth: maxWidth ),
        )
      )
    );


  
  }

}
