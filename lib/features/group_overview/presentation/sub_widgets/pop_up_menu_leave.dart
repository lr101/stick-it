import 'package:buff_lisa/data/dto/group_dto.dart';
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/data/service/member_service.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:buff_lisa/features/group_create/presentation/group_create.dart';
import 'package:buff_lisa/features/group_edit/presentation/group_edit.dart';
import 'package:buff_lisa/widgets/custom_interaction/presentation/custom_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../util/routing/routing.dart';
import '../../../../widgets/custom_interaction/presentation/custom_error_snack_bar.dart';
import '../../../../widgets/report_issue/presentation/report_issue_page.dart';

class PopUpMenuLeave extends ConsumerWidget {

  const PopUpMenuLeave({super.key, required this.groupDto});

  final LocalGroupDto groupDto;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAdmin = ref.watch(globalDataServiceProvider).userId == groupDto.groupAdmin;
    final numMembers = ref.watch(memberServiceProvider(groupDto.groupId).select((e) => e.value?.length ?? 0));
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
            if (isAdmin) const PopupMenuItem<int>(
                value: 2,
                child: Text("Edit Group (as admin)"),
            )
          ];
        },
        onSelected:(value){
          switch (value) {
            case 0: CustomDialog.show(context, acceptText: "Leave", title: isAdmin && numMembers == 1 ? "Delete this group?" : "Leave this group?", onPressed: () => leaveGroup(ref, context));break;
            case 1: Routing.to(context, ReportIssuePage(issueTypes: ["Report Group"], groupId: groupDto.groupId,)); break;
            case 2: Routing.to(context, GroupEdit(groupDto: groupDto));break;
          }
        }
    );
  }

  Future<void> leaveGroup(WidgetRef ref, BuildContext context) async {
    final result = await ref.read(userGroupServiceProvider.notifier).leaveGroup(groupDto.groupId, () => Navigator.of(context).pop());
    if (result != null) {
      CustomErrorSnackBar.message(message: result, type: CustomErrorSnackBarType.error);
    }
  }
}