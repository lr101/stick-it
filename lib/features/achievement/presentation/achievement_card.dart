import 'package:flutter/material.dart';

class AchievementCard extends StatelessWidget {
  final double progress; // Progress between 0.0 and 1.0
  final Color progressColor; // Color for the progress border
  final Widget child; // Content inside the card
  final Color claimedBorderColor;
  final bool isSelected;
  final Color? color;
  final EdgeInsetsGeometry? margin;
  
  const AchievementCard({
    Key? key,
    required this.progress,
    this.progressColor = Colors.blue,
    required this.child,
    required this.claimedBorderColor,
    required this.isSelected,
    this.color,
    this.margin
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isSelected) {
      return Card(
      color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(color: claimedBorderColor, width: 2.0),
        ),
        child: child,
        margin: margin,
      );
    }
    return Padding(
        padding: margin ?? EdgeInsets.zero,
      child: CustomPaint(
        painter: ProgressBorderPainter(
          progress: progress,
          progressColor: progressColor,
        ),
        child: Card(
          color: color,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: child,
        ),
      ));
  }
}

class ProgressBorderPainter extends CustomPainter {
  final double progress;
  final Color progressColor;

  ProgressBorderPainter({required this.progress, required this.progressColor});

  @override
  void paint(Canvas canvas, Size size) {
    const double strokeWidth = 2.0;
    final radius = 12.0;

    // Adjust the drawing rect to account for the stroke width
    final rect = Rect.fromLTWH(
      strokeWidth / 2,
      strokeWidth / 2,
      size.width - strokeWidth,
      size.height - strokeWidth,
    );

    final paintBackground = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final paintProgress = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // Draw full border as a transparent background
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, Radius.circular(radius)),
      paintBackground,
    );

    // Draw the progress border
    final progressPath = Path()
      ..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(radius)));
    final totalLength = progressPath.computeMetrics().fold(0.0, (sum, metric) => sum + metric.length);

    for (final metric in progressPath.computeMetrics()) {
      final length = metric.length * progress; // Adjust length based on progress
      canvas.drawPath(
        metric.extractPath(0, length),
        paintProgress,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Redraw when progress changes
  }
}
