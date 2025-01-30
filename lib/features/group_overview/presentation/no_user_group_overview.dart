import 'package:buff_lisa/data/service/group_image_service.dart';
import 'package:buff_lisa/data/service/no_user_group_service.dart';
import 'package:buff_lisa/features/group_overview/presentation/sub_widgets/group_join_action_button.dart';
import 'package:buff_lisa/features/group_overview/presentation/sub_widgets/group_overview.dart';
import 'package:buff_lisa/widgets/custom_scaffold/presentation/custom_avatar_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NoUserGroupOverview extends ConsumerWidget {

  final String groupId;

  const NoUserGroupOverview({super.key, required this.groupId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupAsync = ref.watch(noUserGroupServiceProvider(groupId));
    return groupAsync.when(
      data: (data) {
        if (data.visibility == 0) {
          return GroupOverview(groupId: data.groupId, floatingActionButton: GroupJoinActionButton(groupDto: data, key: Key("group-join-$groupId"),));
        } else {
          return CustomAvatarScaffold(
              floatingActionButton: GroupJoinActionButton(groupDto: data, key: Key("no-user-group-join-$groupId")),
              avatar: ref.watch(groupProfilePictureByIdProvider(groupId)),
              title: Text(data.name, style: const TextStyle(fontWeight: FontWeight.bold)),
            body: const Center(child: Icon(Icons.lock),),
          );
        }

      },
      error: (error, stackTrace) => const Icon(Icons.error),
      loading: () => const SizedBox.shrink(),
    );
  }
}
