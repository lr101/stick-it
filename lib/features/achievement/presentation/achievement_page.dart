import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/features/achievement/data/achievement_provider.dart';
import 'package:buff_lisa/util/types/achievement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class AchievementsPage extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final achievementProgress = ref.watch(achievementsProvider);
    final selectedBatch = ref.watch(currentUserServiceProvider.select((e) => e.selectedBatch));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Achievements'),
      ),
      body: ListView.builder(
        itemCount: Achievement.values.length,
        itemBuilder: (context, index) {
          final achievement = Achievement.getById(index);
          final userAchievement = achievementProgress.whenOrNull(data: (data) => data.firstWhere((e) => e.achievementId == index));

          final progress = userAchievement != null ? userAchievement.currentValue / userAchievement.thresholdValue : 0.0;

          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.asset(
                achievement.imagePath,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(achievement.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(achievement.description),
                  const SizedBox(height: 5),
                  LinearProgressIndicator(
                    value: progress > 1.0 ? 1.0 : progress,
                    color: progress >= 1.0 ? Colors.green : Colors.blue,
                    backgroundColor: Colors.grey[300],
                  ),
                  const SizedBox(height: 5),
                  Text( userAchievement != null ?
                    '${userAchievement.currentValue}/${userAchievement.thresholdValue}' : "---/---",
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
              trailing: selectedBatch == index ?
                  const Icon(Icons.check_circle, color: Colors.green)
                  : userAchievement != null && userAchievement.claimed
                  ? ElevatedButton(
                    onPressed: () => setBatch(achievement.id, ref),
                    child: const Text('Set batch'))
                  : progress >= 1.0
                  ? ElevatedButton(
                    onPressed: () => claimAchievement(achievement.id, ref),
                  child: const Text('Claim'),
              )
                  : null,
            ),
          );
        },
      ),
    );
  }

  Future<void> claimAchievement(int achievementId, WidgetRef ref) async {
    ref.read(achievementsProvider.notifier).claimAchievement(achievementId);
  }

  Future<void> setBatch(int batchId, WidgetRef ref) async {
    ref.read(currentUserServiceProvider.notifier).update(
      selectedBatch: batchId
    );
  }
}
