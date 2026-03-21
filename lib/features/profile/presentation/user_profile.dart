import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/data/service/group_service.dart';
import 'package:buff_lisa/data/service/image_service.dart';
import 'package:buff_lisa/data/service/like_service.dart';
import 'package:buff_lisa/data/service/pin_service.dart';
import 'package:buff_lisa/data/service/user_service.dart';
import 'package:buff_lisa/widgets/custom_scaffold/presentation/custom_avatar_scaffold.dart';
import 'package:buff_lisa/widgets/image_grid/presentation/image_grid.dart';
import 'package:buff_lisa/widgets/slivers/season_tile.dart';
import 'package:buff_lisa/widgets/tiles/presentation/batch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UserProfile extends ConsumerWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(userIdProvider);
    final userPins = ref.watch(pinUserServiceProvider(userId));
    final currentUser = ref.watch(currentUserProvider);
    final likes = ref.watch(userLikeServiceProvider(userId));
    final profileImage = ref.watch(getUserProfileProvider(userId));
    return CustomAvatarScaffold(
      avatar: profileImage,
      title: Row(
        children: [
          Text(currentUser.value?.username ?? "",
              style: const TextStyle(fontWeight: FontWeight.bold),),
          const SizedBox(
            width: 10,
          ),
          if (currentUser.value?.selectedBatch != null)
            GestureDetector(
              child: Batch(
                batchId: currentUser.value!.selectedBatch!,
                fontSize: 10,
              ),
              onTap: () => context.pushNamed("achievements"),
            ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () => context.pushNamed("achievements"),
          icon: const Icon(Icons.emoji_events),
        ),
        IconButton(
          onPressed: () => context.pushNamed("settings"),
          icon: const Icon(Icons.settings),
        ),
      ],
      hasBackButton: false,
      profileQuickViewBoxes: Column(
        children: [
          // First Row: Two Items
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: ListTile(
                    title: const Text(
                      "Sticks",
                      maxLines: 1,
                    ),
                    subtitle: Text(userPins.whenOrNull(
                            data: (data) => data.length.toString(),) ??
                        "---",),
                  ),
                ),
                Flexible(
                  child: ListTile(
                    title: const Text(
                      "Groups",
                      maxLines: 1,
                    ),
                    subtitle: Text(
                        ref.watch(userGroupServiceProvider).value?.length.toString() ?? "---",),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      boxes: [
        if (currentUser.value?.description != null)
          SliverToBoxAdapter(
            child: ListTile(
              title: const Text("Description", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              subtitle: Text(
                currentUser.value!.description!,
                softWrap: true,
                maxLines: 10,
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
        if (currentUser.value?.bestSeason != null)
          SliverToBoxAdapter(
            child: SeasonTile(bestSeason: currentUser.value!.bestSeason!),
          ),
        SliverToBoxAdapter(
            child: ListTile(
              title: const Text("Likes", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              subtitle: Text(
                likes.valueOrNull?.likeCount.toString() ?? "-",
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
      ],
      body: ImageGrid(
        pinProvider: pinUserServiceProvider(userId),
      ),
    );
  }
}
