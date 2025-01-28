import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/data/service/image_service.dart';
import 'package:buff_lisa/data/service/user_service.dart';
import 'package:buff_lisa/features/profile/presentation/other_user_profile.dart';
import 'package:buff_lisa/util/routing/routing.dart';
import 'package:buff_lisa/widgets/round_image/presentation/round_image.dart';
import 'package:buff_lisa/widgets/tiles/presentation/batch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/api.dart';

class UserRankingTile extends ConsumerWidget {

  final UserRankingDtoInner user;

  const UserRankingTile({super.key, required this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(globalDataServiceProvider).userId!;
    final isCurrentUser = userId == user.userInfoDto!.userId;
    final int? batch;
    if (isCurrentUser) {
       batch = ref.watch(currentUserProvider.select((e) => e.value?.selectedBatch));
    } else {
       batch = user.userInfoDto!.selectedBatch;
    }
      final listTile = ListTile(
        minTileHeight: 60,
      tileColor: userId == user.userInfoDto!.userId ? Theme.of(context).highlightColor: null,
      title: Text(user.userInfoDto!.username),
      subtitle: batch != null ? Row(children: [Batch(batchId: batch, fontSize: 8,)]) : null,
      leading: SizedBox(
        width: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (user.rankNr! <= 3) Icon(Icons.emoji_events, color: user.rankNr == 1 ? Colors.yellow : user.rankNr == 2 ? Colors.grey : Colors.brown,) else Text("${user.rankNr}.",),
            RoundImage(imageCallback: ref.watch(getUserProfileSmallProvider(user.userInfoDto!.userId)), size: 25.0),
          ],
        ),
      ),
      trailing: Text("${user.points}p"),
    );
    if (isCurrentUser) {
      return listTile;
    } else {
      return GestureDetector(
        onTap: () =>
            Routing.to(context, OtherUserProfile(userId: user.userInfoDto!.userId)),
        child: listTile,
      );
    }
  }
}
