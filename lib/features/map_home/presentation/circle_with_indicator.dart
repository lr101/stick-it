import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleWithIndicator extends StatelessWidget {
  final Color color;
  final int number;

  const CircleWithIndicator({
    Key? key,
    required this.color,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        shape: BoxShape.circle,
      ),
      child: Text(
        number.toString(),
        style: const TextStyle(
          fontSize: 10.0,
          fontWeight: FontWeight.bold,
        ),
    )));
  }
}