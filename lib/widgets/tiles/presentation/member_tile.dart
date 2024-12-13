import 'package:buff_lisa/data/dto/group_dto.dart';
import 'package:buff_lisa/data/dto/member_dto.dart';
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/data/service/user_image_service_small.dart';
import 'package:buff_lisa/data/service/user_service.dart';
import 'package:buff_lisa/features/achievement/data/achievement_provider.dart';
import 'package:buff_lisa/features/profile/presentation/other_user_profile.dart';
import 'package:buff_lisa/util/types/achievement.dart';
import 'package:buff_lisa/widgets/tiles/presentation/batch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/group_overview/presentation/user_group_overview.dart';
import '../../../util/routing/routing.dart';
import '../../round_image/presentation/round_image.dart';

class MemberTile extends ConsumerWidget {

  final MemberDto memberDto;
  final String adminId;

  MemberTile({super.key, required this.memberDto, required this.adminId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(globalDataServiceProvider).userId!;
    final isCurrentUser = userId == memberDto.userId;
    final int? batch;
    if (isCurrentUser) {
       batch = ref.watch(currentUserServiceProvider.select((e) => e.selectedBatch));
    } else {
       batch = memberDto.selectedBatch;
    }
      final listTile = ListTile(
      tileColor: userId == memberDto.userId ? Theme.of(context).highlightColor: null,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(memberDto.username),
          Row(children: [
            if (memberDto.userId == adminId) Batch(batchId: Achievement.ADMIN.id, fontSize: 8,),
            if (memberDto.userId == adminId) SizedBox(width: 5,),
            if (batch != null) Batch(batchId: batch, fontSize: 8,)
          ],)
        ],
      ),
      leading: RoundImage(imageCallback: ref.watch(userProfilePictureSmallByIdProvider(memberDto.userId)), size: 20.0, child: Container()),
      trailing: Text(memberDto.points.toString() + " sticks"),
    );
    if (isCurrentUser) {
      return listTile;
    } else {
      return GestureDetector(
        onTap: () =>
            Routing.to(context, OtherUserProfile(userId: memberDto.userId)),
        child: listTile,
      );
    }
  }
}
