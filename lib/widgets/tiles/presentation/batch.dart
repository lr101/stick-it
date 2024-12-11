
import 'package:buff_lisa/features/achievement/data/achievement_provider.dart';
import 'package:buff_lisa/util/types/achievement.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Batch extends StatelessWidget {

  final int batchId;

  const Batch({super.key, required this.batchId});

  @override
  Widget build(BuildContext context) {
    final achievement = Achievement.getById(batchId);
    return Container(
      decoration: BoxDecoration(
        color: achievement.color.withOpacity(0.5),
        border: Border.all(
          width: 2,
          color: achievement.color
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Text(achievement.name),
    );
  }
}