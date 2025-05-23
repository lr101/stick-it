import 'package:buff_lisa/data/service/image_service.dart';
import 'package:buff_lisa/data/service/like_service.dart';
import 'package:buff_lisa/data/service/user_service.dart';
import 'package:buff_lisa/features/profile/presentation/pop_up_menu_other_user.dart';
import 'package:buff_lisa/features/profile/presentation/user_image_feed.dart';
import 'package:buff_lisa/features/profile/presentation/user_like_icon.dart';
import 'package:buff_lisa/features/profile/service/user_pin_service.dart';
import 'package:buff_lisa/util/routing/routing.dart';
import 'package:buff_lisa/widgets/custom_scaffold/presentation/custom_avatar_scaffold.dart';
import 'package:buff_lisa/widgets/image_grid/presentation/image_grid.dart';
import 'package:buff_lisa/widgets/slivers/season_tile.dart';
import 'package:buff_lisa/widgets/tiles/presentation/batch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtherUserProfile extends ConsumerWidget {
  const OtherUserProfile({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPins = ref.watch(userPinProvider(userId));
    final username = ref.watch(userByIdUsernameProvider(userId));
    final description = ref.watch(userByIdDescriptionProvider(userId));
    final bestSeason = ref.watch(userByIdBestSeasonProvider(userId));
    final selectedBatch = ref.watch(userByIdSelectedBatchProvider(userId));
    final profileImage = ref.watch(getUserProfileProvider(userId));
    final likes = ref.watch(userLikeServiceProvider(userId));
    return CustomAvatarScaffold(
      avatar: AsyncData(profileImage.value),
      title: Row(children: [
          Text(username.value ?? "", style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 10,),
          if (selectedBatch.value != null) Batch(batchId: selectedBatch.value!, fontSize: 10,),
      ],),
      actions: [
        PopUpMenuOtherUser(userId: userId),
      ],
      profileQuickViewBoxes: SizedBox(height: MediaQuery.of(context).size.width * 0.15, child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          UserLikeIcon(likeCount: likes.value?.likeCount, icon: Icons.favorite),
          UserLikeIcon(likeCount: likes.value?.likeLocationCount, icon: CupertinoIcons.location_solid),
          UserLikeIcon(likeCount: likes.value?.likePhotographyCount, icon: Icons.photo_camera),
          UserLikeIcon(likeCount: likes.value?.likeArtCount, icon: Icons.brush),

        ],
      ),),
      boxes: [
        SliverToBoxAdapter(
            child: ListTile(
              title: const Text("Sticks", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              subtitle: Text(
                  userPins.whenOrNull(data: (data) => data.length.toString()) ??
                      "---",),
            ),),
        if (description.value != null) SliverToBoxAdapter(
            child: ListTile(
            title: const Text("Description", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            subtitle:  Text(description.value!,
              softWrap: true,
              maxLines: 10,
              style: const TextStyle(fontStyle: FontStyle.italic),),),),
        if (bestSeason.value != null)
          SliverToBoxAdapter(
            child: SeasonTile(bestSeason: bestSeason.value!),
          ),
      ],
      body: ImageGrid(
        pinProvider: userPinProvider(userId),
        onTab: (index) => Routing.to(context, UserImageFeed(index: index, userId: userId, userPinNotifier: userPinProvider(userId))),
      ),
    );
  }
}
