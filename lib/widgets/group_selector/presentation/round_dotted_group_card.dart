import 'package:buff_lisa/features/group_create/presentation/group_create.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import '../../../util/routing/routing.dart';
import '../helper/dotted_border_painter.dart';

class RoundDottedGroupCard extends StatelessWidget {

  const RoundDottedGroupCard({super.key, required this.icon, required this.onTab});
  
  final IconData icon;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    double baseHeight = (MediaQuery.of(context).size.height * 0.09) - 15;

    return Padding(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: onTab,
        onLongPress: () => {},
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Dotted border using CustomPainter
            CustomPaint(
              size: Size(baseHeight - 5, baseHeight - 5),
              painter: DottedBorderPainter(),
            ),
            // CircleAvatar in the center
            CircleAvatar(
              radius: baseHeight / 2 - 5, // Reduced radius for dot visibility
              backgroundColor: Colors.transparent,
              child: Icon(icon, color: Colors.grey.withOpacity(0.8),),
            ),
          ],
        ),
      ),
    );
  }
}


