import 'package:buff_lisa/data/service/pin_service.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:buff_lisa/data/service/user_image_service.dart';
import 'package:buff_lisa/data/service/user_service.dart';
import 'package:buff_lisa/features/achievement/presentation/achievement_page.dart';
import 'package:buff_lisa/features/profile/presentation/user_image_feed.dart';
import 'package:buff_lisa/features/profile/presentation/user_like_icon.dart';
import 'package:buff_lisa/features/profile/service/user_pin_service.dart';
import 'package:buff_lisa/util/routing/routing.dart';
import 'package:buff_lisa/widgets/custom_scaffold/presentation/custom_avatar_scaffold.dart';
import 'package:buff_lisa/widgets/image_grid/presentation/image_grid.dart';
import 'package:buff_lisa/widgets/tiles/presentation/batch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/service/global_data_service.dart';
import '../../settings/presentation/settings.dart';

class UserProfile extends ConsumerWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(globalDataServiceProvider).userId!;
    final userPins = ref.watch(userPinProvider);
    final currentUser = ref.watch(currentUserServiceProvider);
    final likes = ref.watch(userLikesByIdProvider(userId));
    return CustomAvatarScaffold(
      avatar: AsyncData(ref
          .watch(profilePictureByIdProvider(userId)).value),
      title: Row(children: [
        Text(currentUser.username ?? ""),
        SizedBox(width: 10,),
        if (currentUser.selectedBatch != null) GestureDetector(
          child: Batch(batchId: currentUser.selectedBatch!, fontSize: 10,),
          onTap: () => Routing.to(context, const AchievementsPage()),
        )
      ]),
      actions: [
        IconButton(
            onPressed: () => Routing.to(context, AchievementsPage()),
            icon: Icon(Icons.emoji_events)),
        IconButton(
            onPressed: () => Routing.to(context, Settings()),
            icon: Icon(Icons.settings)),
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
                    title: Text("Sticks", maxLines: 1,),
                    subtitle: Text(userPins.whenOrNull(
                            data: (data) => data.length.toString()) ??
                        "---"),
                  ),
                ),
                Flexible(
                  child: ListTile(
                    title: Text("Groups", maxLines: 1,),
                    subtitle: Text(ref.watch(numberOfGroupProvider)?.toString() ?? "---"),
                  ),
                ),
              ],
            )),
            SizedBox(height: MediaQuery.of(context).size.width * 0.15, child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                UserLikeIcon(likeCount: likes?.likeCount, icon: Icons.favorite),
                UserLikeIcon(likeCount: likes?.likeLocationCount, icon: CupertinoIcons.location_solid),
                UserLikeIcon(likeCount: likes?.likePhotographyCount, icon: Icons.photo_camera),
                UserLikeIcon(likeCount: likes?.likeArtCount, icon: Icons.brush)

              ],
            )),
          ],
        ),
      boxes: [
        if (currentUser.description != null)
          SliverToBoxAdapter(
              child: ListTile(
                  title: Text("Description"),
                  subtitle: Text(
                    currentUser.description!,
                    softWrap: true,
                    maxLines: 10,
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ))),
      ],
      body: ImageGrid(
        pinProvider: sortedUserPinsProvider,
        onTab: (index) => Routing.to(
            context,
            UserImageFeed(
              index: index,
              userId: userId,
              userPinNotifier: sortedUserPinsProvider,
            )),
      ),
    );
  }
}
