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
      child: SizedBox(
        height: height,
        width: width,
        child:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            width: width - 30 - 15 - 10 - 10,
                            height: height - 55,
                            color: Colors.white,
                          )
            ),]),
            // Map
            Positioned(
                right: 0,
                bottom: 0,
                child: ClipRRect(
                      borderRadius: BorderRadius.circular(10), // Match the borderRadius of the decoration
                      child: Container(
                        height: 100,
                        width: 100,
                        color: Colors.white,
                      )))
          ],
        ),
        const Divider(),
      ],
    )));
  }
}
