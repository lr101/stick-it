import 'package:buff_lisa/data/service/user_image_service.dart';
import 'package:buff_lisa/data/service/user_service.dart';
import 'package:buff_lisa/features/profile/presentation/pop_up_menu_other_user.dart';
import 'package:buff_lisa/features/profile/presentation/user_image_feed.dart';
import 'package:buff_lisa/features/profile/service/other_user_pin_service.dart';
import 'package:buff_lisa/util/routing/routing.dart';
import 'package:buff_lisa/widgets/custom_scaffold/presentation/custom_avatar_scaffold.dart';
import 'package:buff_lisa/widgets/image_grid/presentation/image_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../settings/presentation/settings.dart';

class OtherUserProfile extends ConsumerWidget {
  const OtherUserProfile({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPins = ref.watch(otherUserPinServiceProvider(userId));
    final userData = ref.watch(userByIdProvider(userId));
    final profileImage = ref.watch(profilePictureByIdProvider(userId));
    return CustomAvatarScaffold(
      avatar: AsyncData(profileImage.value),
      title: userData.whenOrNull(data: (data) => data.username) ?? "...",
      actions: [
        PopUpMenuOtherUser(userId: userId)
      ],
      boxes: [
        SliverToBoxAdapter(
            child: ListTile(
              title: Text("Sticks"),
              subtitle: Text(
                  userPins.whenOrNull(data: (data) => data.length.toString()) ??
                      "---"),
            )),
    if (userData.whenOrNull(data: (data) => data.description) != null) SliverToBoxAdapter(
        child: ListTile(
        title: Text("Description"),
        subtitle:  Text(userData.value!.description!,
        softWrap: true,
        maxLines: 10,
        style: TextStyle(fontStyle: FontStyle.italic),)))
      ],
      body: ImageGrid(
        pinProvider: otherUserPinProvider(userId),
        onTab: (index) =>
            Routing.to(context, UserImageFeed(index: index, userId: userId, userPinNotifier: otherUserPinProvider(userId))),
      ),
    );
  }
}
