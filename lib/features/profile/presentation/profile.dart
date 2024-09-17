import 'package:buff_lisa/data/service/pin_service.dart';
import 'package:buff_lisa/data/service/user_service.dart';
import 'package:buff_lisa/features/profile/presentation/user_image_feed.dart';
import 'package:buff_lisa/util/routing/routing.dart';
import 'package:buff_lisa/widgets/custom_scaffold/presentation/custom_avatar_scaffold.dart';
import 'package:buff_lisa/widgets/image_grid/presentation/image_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/service/global_data_service.dart';

class Profile extends ConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(globalDataServiceProvider).userId!;
    final userPins = ref.watch(sortedUserPinsProvider);
    return ref.watch(userByIdProvider(userId)).whenOrNull(data: (data) {
          if (data == null) return null;
          return CustomAvatarScaffold(
            avatar: AsyncData(data.profileImage),
            title: data.username,
            actions: [
              IconButton(onPressed: () => (), icon: Icon(Icons.settings))
            ],
            boxes: [
              SliverToBoxAdapter(
                  child: ListTile(
                title: Text("Sticks"),
                subtitle: Text(userPins.whenOrNull(
                        data: (data) => data.length.toString()) ??
                    "---"),
              )),
            ],
            body: ImageGrid(
              pinProvider: sortedUserPinsProvider,
              onTab: (index) => Routing.to(
                  context, UserImageFeed(index: index, userId: userId)),
            ),
          );
        }) ??
        const CircularProgressIndicator();
  }
}
