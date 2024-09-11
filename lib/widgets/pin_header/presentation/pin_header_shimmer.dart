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
                   SizedBox(width: 100, height: 22,),
                   SizedBox(width: 150, height: 18,)
                  ],
                )
              ]),
        ],
      ),
    );
  }
}