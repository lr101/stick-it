import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../round_image/presentation/round_image.dart';

class PinHeaderShimmer  extends StatelessWidget {
  const PinHeaderShimmer({super.key});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: CircleAvatar(
                    radius: 16,
                  )
                ),
                Column(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                   Container(width: 50, height: 15, decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(5), // Adjust the radius as needed
                   ),),
                   Container(width: 40, height: 10, decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(5), // Adjust the radius as needed
                   ),)
                  ],
                )
              ]),
        ],
      ),
    );
  }
}