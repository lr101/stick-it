import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/data/service/image_service.dart';
import 'package:buff_lisa/data/service/like_service.dart';
import 'package:buff_lisa/data/service/user_service.dart';
import 'package:buff_lisa/features/achievement/presentation/achievement_page.dart';
import 'package:buff_lisa/features/profile/presentation/user_image_feed.dart';
import 'package:buff_lisa/features/profile/presentation/user_like_icon.dart';
import 'package:buff_lisa/features/profile/service/user_pin_service.dart';
import 'package:buff_lisa/features/settings/presentation/settings.dart';
import 'package:buff_lisa/util/routing/routing.dart';
import 'package:buff_lisa/widgets/custom_scaffold/presentation/custom_avatar_scaffold.dart';
import 'package:buff_lisa/widgets/image_grid/presentation/image_grid.dart';
import 'package:buff_lisa/widgets/tiles/presentation/batch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserProfile extends ConsumerWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(userIdProvider);
    final userPins = ref.watch(userPinProvider(userId));
    final currentUser = ref.watch(currentUserProvider);
    final likes = ref.watch(userLikeServiceProvider(userId));
    final profileImage = ref.watch(getUserProfileProvider(userId));
    return CustomAvatarScaffold(
      avatar: profileImage,
      title: Row(children: [
        Text(currentUser.value?.username ?? "", style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(width: 10,),
        if (currentUser.value?.selectedBatch != null) GestureDetector(
          child: Batch(batchId: currentUser.value!.selectedBatch!, fontSize: 10,),
          onTap: () => Routing.to(context, const AchievementsPage()),
        ),
      ],),
      actions: [
        IconButton(
            onPressed: () => Routing.to(context, const AchievementsPage()),
            icon: const Icon(Icons.emoji_events),),
        IconButton(
            onPressed: () => Routing.to(context, const Settings()),
            icon: const Icon(Icons.settings),),
      ],
      hasBackButton: false,
      profileQuickViewBoxes: Column(
          children: [
            // First Row: Two Items
            SizedBox(height: MediaQuery.of(context).size.width * 0.15, child:
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: ListTile(
                    title: const Text("Sticks", maxLines: 1,),
                    subtitle: Text(userPins.whenOrNull(data: (data) => data.length.toString()) ?? "---"),
                  ),
                ),
                Flexible(
                  child: ListTile(
                    title: const Text("Groups", maxLines: 1,),
                    subtitle: Text(ref.watch(numberOfGroupProvider)?.toString() ?? "---"),
                  ),
                ),
              ],
            ),),
            SizedBox(height: MediaQuery.of(context).size.width * 0.15, child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                UserLikeIcon(likeCount: likes.value?.likeCount, icon: Icons.favorite),
                UserLikeIcon(likeCount: likes.value?.likeLocationCount, icon: CupertinoIcons.location_solid),
                UserLikeIcon(likeCount: likes.value?.likePhotographyCount, icon: Icons.photo_camera),
                UserLikeIcon(likeCount: likes.value?.likeArtCount, icon: Icons.brush),

              ],
            ),),
          ],
        ),
      boxes: [
        if (currentUser.value?.description != null)
          SliverToBoxAdapter(
              child: ListTile(
                  title: const Text("Description"),
                  subtitle: Text(
                    currentUser.value!.description!,
                    softWrap: true,
                    maxLines: 10,
                    style: const TextStyle(fontStyle: FontStyle.italic),
                  ),),),
      ],
      body: ImageGrid(
        pinProvider: userPinProvider(userId),
        onTab: (index) => Routing.to(
            context,
            UserImageFeed(
              index: index,
              userId: userId,
              userPinNotifier: userPinProvider(userId),
            ),),
      ),
    );
  }
}
