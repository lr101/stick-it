import 'package:buff_lisa/features/group_overview/presentation/sub_widgets/group_overview.dart';
import 'package:buff_lisa/features/group_overview/presentation/sub_widgets/pop_up_menu_leave.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/service/user_group_service.dart';

class UserGroupOverview extends ConsumerWidget {


  const UserGroupOverview({super.key, required this.groupId});

  final String groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(groupByIdProvider(groupId)).when(
        data: (data) => GroupOverview(groupId: groupId,actions: [PopUpMenuLeave(groupDto: data!)],),
        error: (error, stackTrace) => Icon(Icons.error),
        loading: () => Center(child: CircularProgressIndicator())
    );
  }
}
