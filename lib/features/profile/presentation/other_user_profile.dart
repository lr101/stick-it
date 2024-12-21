import 'package:buff_lisa/data/service/user_image_service.dart';
import 'package:buff_lisa/data/service/user_service.dart';
import 'package:buff_lisa/features/profile/presentation/pop_up_menu_other_user.dart';
import 'package:buff_lisa/features/profile/presentation/user_image_feed.dart';
import 'package:buff_lisa/features/profile/presentation/user_like_icon.dart';
import 'package:buff_lisa/features/profile/service/other_user_pin_service.dart';
import 'package:buff_lisa/util/routing/routing.dart';
import 'package:buff_lisa/widgets/custom_scaffold/presentation/custom_avatar_scaffold.dart';
import 'package:buff_lisa/widgets/image_grid/presentation/image_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/tiles/presentation/batch.dart';
import '../../settings/presentation/settings.dart';

class OtherUserProfile extends ConsumerWidget {
  const OtherUserProfile({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPins = ref.watch(otherUserPinServiceProvider(userId));
    final username = ref.watch(userByIdUsernameProvider(userId));
    final description = ref.watch(userByIdProvider(userId).select((e) => e.value?.description));
    final selectedBatch = ref.watch(userByIdProvider(userId).select((e) => e.value?.selectedBatch));
    final profileImage = ref.watch(profilePictureByIdProvider(userId));
    return CustomAvatarScaffold(
      avatar: AsyncData(profileImage.value),
      title: Row(children: [
          Text(username ?? ""),
          SizedBox(width: 10,),
          if (selectedBatch != null) Batch(batchId: selectedBatch, fontSize: 10,)
      ]),
      actions: [
        PopUpMenuOtherUser(userId: userId)
      ],
      profileQuickViewBoxes: SizedBox(height: MediaQuery.of(context).size.width * 0.15, child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          UserLikeIcon(likeCount: ref.watch(userLikesByIdProvider(userId)).whenOrNull(data: (data) =>data.likeCount), icon: Icons.favorite),
          UserLikeIcon(likeCount: ref.watch(userLikesByIdProvider(userId)).whenOrNull(data: (data) =>data.likeLocationCount), icon: CupertinoIcons.location_solid),
          UserLikeIcon(likeCount: ref.watch(userLikesByIdProvider(userId)).whenOrNull(data: (data) =>data.likePhotographyCount), icon: Icons.photo_camera),
          UserLikeIcon(likeCount: ref.watch(userLikesByIdProvider(userId)).whenOrNull(data: (data) =>data.likeArtCount), icon: Icons.brush)

        ],
      )),
      boxes: [
        SliverToBoxAdapter(
            child: ListTile(
              title: Text("Sticks"),
              subtitle: Text(
                  userPins.whenOrNull(data: (data) => data.length.toString()) ??
                      "---"),
            )),
    if (description != null) SliverToBoxAdapter(
        child: ListTile(
        title: Text("Description"),
        subtitle:  Text(description,
          softWrap: true,
          maxLines: 10,
          style: TextStyle(fontStyle: FontStyle.italic),))),
      ],
      body: ImageGrid(
        pinProvider: otherUserPinProvider(userId),
        onTab: (index) =>
            Routing.to(context, UserImageFeed(index: index, userId: userId, userPinNotifier: otherUserPinProvider(userId))),
      ),
    );
  }
}
