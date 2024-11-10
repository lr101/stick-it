import 'package:buff_lisa/data/service/pin_service.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:buff_lisa/data/service/user_image_service.dart';
import 'package:buff_lisa/data/service/user_service.dart';
import 'package:buff_lisa/features/profile/presentation/user_image_feed.dart';
import 'package:buff_lisa/util/routing/routing.dart';
import 'package:buff_lisa/widgets/custom_scaffold/presentation/custom_avatar_scaffold.dart';
import 'package:buff_lisa/widgets/image_grid/presentation/image_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/service/global_data_service.dart';
import '../../settings/presentation/settings.dart';

class UserProfile extends ConsumerWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(globalDataServiceProvider).userId!;
    final userPins = ref.watch(sortedUserPinsProvider);
    final userData = ref.watch(userByIdProvider(userId));
    return CustomAvatarScaffold(
      avatar: AsyncData(ref
          .watch(profilePictureByIdProvider(userId))
          .whenOrNull(data: (data) => data)),
      title: userData.whenOrNull(data: (data) => data.username) ?? "...",
      actions: [
        IconButton(
            onPressed: () => Routing.to(context, Settings()),
            icon: Icon(Icons.settings))
      ],
      profileQuickViewBoxes: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
            switch (index) { case 0: return ListTile(
                    title: Text("Sticks"),
                    subtitle: Text(userPins.whenOrNull(
                            data: (data) => data.length.toString()) ??
                        "---"),
                  );
              case 1: return ListTile(
                title: Text("Groups"),
                subtitle: Text(ref.watch(userGroupServiceProvider).whenOrNull(
                    data: (data) => data.length.toString()) ??
                    "---"),
              );
            }},
              itemCount: 2),
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
