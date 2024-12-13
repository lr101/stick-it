import 'package:buff_lisa/data/repository/global_data_repository.dart';
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/data/service/user_service.dart';
import 'package:buff_lisa/features/achievement/presentation/achievement_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../util/routing/routing.dart';
import '../../../util/types/level.dart';

class LikeCounter extends ConsumerStatefulWidget {
  @override
  ConsumerState<LikeCounter> createState() => _LikeCounterState();
}

class _LikeCounterState extends ConsumerState<LikeCounter> {

  @override
  Widget build(BuildContext context) {
    final levelDetails = ref.watch(xpProvider);

    double progress = (levelDetails.currentLevelXp == levelDetails.nextLevelXp) ? 1.0 : (levelDetails.totalXp - levelDetails.currentLevelXp) / (levelDetails.nextLevelXp - levelDetails.currentLevelXp);
    print(progress);
    final xpText = '${levelDetails.totalXp}xp / ${levelDetails.nextLevelXp}xp';

    return Padding(
      padding: EdgeInsets.all(10),
      child: GestureDetector(
          onTap: () => Routing.to(context, const AchievementsPage()),
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
              Level.getById(levelDetails.currentLevel).title,
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
      )),
    );
  }
}
