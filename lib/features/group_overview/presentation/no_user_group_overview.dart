import 'package:buff_lisa/data/service/no_user_group_service.dart';
import 'package:buff_lisa/features/group_overview/presentation/sub_widgets/group_join_action_button.dart';
import 'package:buff_lisa/features/group_overview/presentation/sub_widgets/group_overview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/service/group_image_service.dart';
import '../../../widgets/custom_scaffold/presentation/custom_avatar_scaffold.dart';

class NoUserGroupOverview extends ConsumerWidget {

  final String groupId;

  const NoUserGroupOverview({super.key, required this.groupId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupAsync = ref.watch(noUserGroupServiceProvider(groupId));
    return groupAsync.when(
      data: (data) {
        if (data.visibility == 0) {
          return GroupOverview(groupId: data.groupId, floatingActionButton: GroupJoinActionButton(groupDto: data, key: Key("group-join-${groupId}"),));
        } else {
          return CustomAvatarScaffold(
              floatingActionButton: GroupJoinActionButton(groupDto: data, key: Key("no-user-group-join-${groupId}")),
              avatar: ref.watch(groupProfilePictureByIdProvider(groupId)),
              title: Text(data.name),
            body: Center(child: Icon(Icons.lock),),
          );
        }

      },
      error: (error, stackTrace) => Icon(Icons.error),
      loading: () => SizedBox.shrink(),
    );
  }
}
