import 'dart:math';

import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/data/service/user_service.dart';
import 'package:buff_lisa/features/achievement/data/achievement_provider.dart';
import 'package:buff_lisa/features/achievement/presentation/achievement_card.dart';
import 'package:buff_lisa/util/types/achievement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/api.dart';

import '../../../widgets/custom_interaction/presentation/custom_error_snack_bar.dart';


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
      body: GridView.builder(
          gridDelegate: (SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 8.0, mainAxisSpacing: 8.0)),
          itemCount: Achievement.values.where((e) => e.id >= 0).length,
          itemBuilder: (context, index) {
          final achievement = Achievement.getById(index);
          final userAchievement = achievementProgress.whenOrNull(data: (data) => data.firstWhere((e) => e.achievementId == index));

          final progress = calculateProgress(userAchievement);
          final color = userAchievement != null && userAchievement.claimed ? Theme.of(context).highlightColor : null;
          return  GestureDetector(
              onTap: () => onTab(ref, achievement.id, selectedBatch, userAchievement, progress),
              child: AchievementCard(
                progress: progress,
                isSelected: selectedBatch == index,
                borderWidth: 2.0,
                claimedBorderColor: Theme.of(context).colorScheme.primary,
                progressColor: Theme.of(context).highlightColor,
                color: color,
                margin: const EdgeInsets.all(8.0),
                child: Padding(padding: EdgeInsets.all(10.0), child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10), // Match the borderRadius of the decoration
                    child: Image.asset(achievement.imagePath, height: 80, width: 80),
                  ),
                  const SizedBox(height: 5,),
                  Text(achievement.name, style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),),
                  const SizedBox(height: 5,),
                  Text(achievement.description, style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 8)),
                  const SizedBox(height: 5,),
                  Text( userAchievement != null ?
                  '${userAchievement.currentValue}/${userAchievement.thresholdValue}' : "---/---",
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              )),
            )
          );
        },
      ),
    );
  }

  double calculateProgress(UserAchievementsDtoInner? ach) {
    if (ach == null) return 0.0;
    if (ach.thresholdUp) return min(1.0, ach.currentValue / ach.thresholdValue);
    return min(1.0, ach.thresholdValue  / ach.currentValue);
  }

  Future<void> onTab(WidgetRef ref, int achievementId, int? selectedBatch, UserAchievementsDtoInner? achievement, double progress) async {
    if(selectedBatch == achievementId) {
      return;
    } else if (achievement != null && achievement.claimed) {
      setBatch(achievementId, ref);
    } else if (progress >= 1.0) {
      claimAchievement(achievementId, ref);
    }
  }

  Future<void> claimAchievement(int achievementId, WidgetRef ref) async {
    final result = await ref.read(achievementsProvider.notifier).claimAchievement(achievementId);
    final message = result ?? "Claimed '${Achievement.getById(achievementId).name}' achievement";
    CustomErrorSnackBar.message(message: message, type: result != null ? CustomErrorSnackBarType.error : CustomErrorSnackBarType.success);
  }

  Future<void> setBatch(int batchId, WidgetRef ref) async {
    final result = await ref.read(userServiceProvider.notifier).changeUser(selectedBatch: batchId);
    final message = result ?? "Set '${Achievement.getById(batchId).name}' as profile batch";
    CustomErrorSnackBar.message(message: message, type: result != null ? CustomErrorSnackBarType.error : CustomErrorSnackBarType.success);
  }
}
