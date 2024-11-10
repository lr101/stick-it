import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DottedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double radius = size.width / 2;
    double dotRadius = 2; // Radius of each dot
    double gapBetweenDots = 12; // Space between dots

    final paint = Paint()
      ..color = Colors.grey.withOpacity(0.8) // Set your dot color
      ..style = PaintingStyle.fill;

    for (double angle = 0; angle < 360; angle += gapBetweenDots) {
      // Convert angle to radians
      final radians = angle * pi / 180;

      // Calculate x and y positions based on the angle
      final x = radius + radius * cos(radians);
      final y = radius + radius * sin(radians);

      // Draw dot at calculated position
      canvas.drawCircle(Offset(x, y), dotRadius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}