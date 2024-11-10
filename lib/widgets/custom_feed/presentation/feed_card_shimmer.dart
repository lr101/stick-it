import 'package:buff_lisa/widgets/pin_header/presentation/pin_header_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FeedCardShimmer extends StatelessWidget {
  final double height;
  final double width;

  const FeedCardShimmer({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: Column(
        children: [
          PinHeaderShimmer(),
          SizedBox(
            height: 3,
          ),
          SizedBox(
            height: 40,
            child: Align(
                alignment: Alignment.centerLeft,
                child:Container(
                    height: 10,
                    width: 60,
                    color:  Colors.white
                ),
            )
          ),
          SizedBox(
            height: 3,
          ),
          Expanded(
              child: Container(
                  height: screenWidth * 1.334 + 80,
                  width: screenWidth,
                  color: Colors.white))
        ],
      ),
    );
  }
}
