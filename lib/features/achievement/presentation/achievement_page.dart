import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/features/achievement/data/achievement_provider.dart';
import 'package:buff_lisa/util/types/achievement.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class AchievementsPage extends ConsumerWidget {

  const AchievementsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final achievementProgress = ref.watch(achievementsProvider);
    final selectedBatch = ref.watch(currentUserServiceProvider.select((e) => e.selectedBatch));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Achievements'),
      ),
      body: ListView.builder(
        itemCount: Achievement.values.where((e) => e.id >= 0).length,
        itemBuilder: (context, index) {
          final achievement = Achievement.getById(index);
          final userAchievement = achievementProgress.whenOrNull(data: (data) => data.firstWhere((e) => e.achievementId == index));

          final progress = userAchievement != null ? userAchievement.currentValue / userAchievement.thresholdValue : 0.0;

          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(Icons.emoji_events, color: progress >= 1.0 ? Theme.of(context).colorScheme.primary : Colors.grey,),
              title: Text(achievement.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(achievement.description, style: const TextStyle(fontStyle: FontStyle.italic)),
                  const SizedBox(height: 5),
                  LinearProgressIndicator(
                    value: progress > 1.0 ? 1.0 : progress,
                    color: progress >= 1.0 ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.tertiary,
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
                  IconButton(onPressed: () => (), icon: Icon(Icons.check_circle, color:  Theme.of(context).colorScheme.primary), tooltip: "Already selected",)
                  : userAchievement != null && userAchievement.claimed
                  ? IconButton(onPressed: () => setBatch(index, ref), icon: Icon(Icons.person, color:  Theme.of(context).colorScheme.primary), tooltip: "Set as profile batch",)
                  : progress >= 1.0
                  ? IconButton(
                    onPressed: () => claimAchievement(achievement.id, ref),
                  tooltip: "Redeem achievement",
                  icon: Icon(Icons.redeem, color: Theme.of(context).colorScheme.primary,),)
                  : IconButton(onPressed: () => (), icon: const Icon(Icons.lock, color: Colors.grey,), tooltip: "Achievement not reached",),
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
