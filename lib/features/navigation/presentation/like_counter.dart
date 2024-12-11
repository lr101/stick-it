import 'package:buff_lisa/data/repository/global_data_repository.dart';
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/data/service/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LikeCounter extends ConsumerStatefulWidget {
  @override
  ConsumerState<LikeCounter> createState() => _LikeCounterState();
}

class _LikeCounterState extends ConsumerState<LikeCounter> {
  // Level titles
  final List<String> levelTitles = ["Newbie", "Beginner", "Intermediate", "Pro", "Expert", "Legend"];

  // Function to determine the level and next XP target
  Map<String, dynamic> _getLevelDetails(int xp) {
    int level = 0;
    int nextLevelXp = 100;
    while (xp >= nextLevelXp && level < levelTitles.length - 1) {
      level++;
      nextLevelXp += (level + 1) * 100; // Increment threshold for next levels
    }
    int prevLevelXp = nextLevelXp - (level + 1) * 100;
    return {
      "title": levelTitles[level],
      "level": level,
      "totalXp": xp,
      "xpToNextLevel": nextLevelXp - xp,
      "nextLevelXp": nextLevelXp,
      "prevLevelXp": prevLevelXp
    };
  }

  @override
  Widget build(BuildContext context) {
    final xp = AsyncData(1234);
    final levelDetails = xp.whenOrNull(
      data: (xp) => _getLevelDetails(xp),
    ) ??
        {
          "title": "Newbie",
          "level": 0,
          "totalXp": 0,
          "xpToNextLevel": 100,
          "nextLevelXp": 100,
        };

    double progress = (levelDetails['totalXp'] - levelDetails['prevLevelXp']) / (levelDetails['nextLevelXp'] - levelDetails['prevLevelXp']);
    print(progress);
    final xpText = '${levelDetails['totalXp']}xp / ${levelDetails['nextLevelXp']}xp';

    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.4),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              levelDetails['title'],
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey.shade800,
              ),
            ),
            const SizedBox(height: 8),
        LayoutBuilder(
          builder: (context, constraints) {
            // Measure the width of the text to constrain the progress bar
            final textPainter = TextPainter(
              text: TextSpan(
                text: xpText,
                style: TextStyle(
                  fontSize: 8,
                  color: Colors.blueGrey.shade600,
                ),
              ),
              textDirection: TextDirection.ltr,
            );
            textPainter.layout();

            final textWidth = textPainter.size.width;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: textWidth + 10,
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey.withOpacity(0.5),
                    color: Colors.amber,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  xpText,
                  style: TextStyle(
                    fontSize: 8,
                    color: Colors.blueGrey.shade600,
                  ),
                ),
              ],
            );
          },),
          ],
        ),
      ),
    );
  }
}
