import 'package:buff_lisa/data/dto/group_dto.dart';
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/widgets/round_image/presentation/round_cached_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/api.dart';

import '../../../data/service/group_image_service.dart';
import '../../../data/service/user_group_service.dart';
import '../../../features/group_overview/presentation/no_user_group_overview.dart';
import '../../../features/group_overview/presentation/user_group_overview.dart';
import '../../../util/routing/routing.dart';
import '../../round_image/presentation/round_image.dart';

class GroupRankingTile extends ConsumerWidget {

  final GroupRankingDtoInner groupDto;

  GroupRankingTile({super.key, required this.groupDto});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isUserGroups = ref.watch(userGroupServiceProvider.select((e) => e.value?.where((i) => i.groupId == groupDto.groupInfoDto!.id).isNotEmpty));
    return ListTile(
      onTap: () =>  isUserGroups == true
          ? Routing.to(context, UserGroupOverview(groupId: groupDto.groupInfoDto!.id))
          : Routing.to(context, NoUserGroupOverview(groupId: groupDto.groupInfoDto!.id)),
      trailing: Text("${groupDto.points}p"),
      title: Text(groupDto.groupInfoDto!.name),
      subtitle:  Align(
        alignment: Alignment.centerLeft,
       child: groupDto.groupInfoDto!.description == null ? Icon(Icons.lock, size: 12,) : Text(groupDto.groupInfoDto!.description!, overflow: TextOverflow.ellipsis, maxLines: 1, style: TextStyle(fontStyle:  FontStyle.italic, fontSize: 12)),
      ),
      leading: SizedBox(
        width: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          groupDto.rankNr! <= 3 ? Icon(Icons.emoji_events, color: groupDto.rankNr == 1 ? Colors.yellow : groupDto.rankNr == 2 ? Colors.grey : Colors.brown,) : Text("${groupDto.rankNr}.",),
          RoundImage(imageCallback: ref.watch(groupProfilePictureSmallByIdProvider(groupDto.groupInfoDto!.id)), size: 20.0),
        ],
      ))
    );
  }
}
