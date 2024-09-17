
import 'package:buff_lisa/widgets/pin_header/presentation/pin_header_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FeedCardShimmer extends StatelessWidget {

  final double height;
  final double width;

  const FeedCardShimmer({super.key, required this.height, required this.width});


  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
        enabled: true,
        child: Column(
          children: [
            PinHeaderShimmer(),
            SizedBox(height: 3,),
            Expanded(child: Container())
          ],
        ),
    );
  }
}