import 'package:buff_lisa/data/dto/group_dto.dart';
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:buff_lisa/features/group_create/presentation/group_create.dart';
import 'package:buff_lisa/features/group_edit/presentation/group_edit.dart';
import 'package:buff_lisa/features/group_search/presentation/group_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../util/routing/routing.dart';
import '../../../../widgets/custom_interaction/presentation/custom_error_snack_bar.dart';

class PopUpMenuLeave extends ConsumerWidget {

  const PopUpMenuLeave({super.key, required this.groupDto});

  final LocalGroupDto groupDto;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton(
        itemBuilder: (context) {
          return [
            const PopupMenuItem<int>(
                value: 0,
                child: Text("Leave Group")
            ),
            const PopupMenuItem<int>(
                value: 1,
                child: Text("Report Group")
            ),
            if (ref.watch(globalDataServiceProvider).userId == groupDto.groupAdmin) const PopupMenuItem<int>(
                value: 2,
                child: Text("Edit Group (as admin)"),
            )
          ];
        },
        onSelected:(value){
          switch (value) {
            case 0: leaveGroup(ref, context);break;
            case 1: break; //TODO route to report page
            case 2: Routing.to(context, GroupEdit(groupDto: groupDto));break;
          }
        }
    );
  }

  Future<void> leaveGroup(WidgetRef ref, BuildContext context) async {
    final result = await ref.read(userGroupServiceProvider.notifier).leaveGroup(groupDto.groupId);
    if (result != null) {
      CustomErrorSnackBar.message(context: context, message: result);
    } else {
      Navigator.of(context).pop();
    }
  }
}