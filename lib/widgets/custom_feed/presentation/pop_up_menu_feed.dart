
import 'package:buff_lisa/data/dto/pin_dto.dart';
import 'package:buff_lisa/data/service/filter_service.dart';
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/data/service/pin_service.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:buff_lisa/widgets/custom_interaction/presentation/custom_dialog.dart';
import 'package:buff_lisa/widgets/report_issue/presentation/report_issue_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../util/routing/routing.dart';
import '../../../../widgets/custom_interaction/presentation/custom_error_snack_bar.dart';

class PopUpMenuFeed extends ConsumerWidget {

  const PopUpMenuFeed({super.key, required this.pinDto});

  final LocalPinDto pinDto;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(globalDataServiceProvider).userId!;
    final adminId = ref.watch(groupByIdProvider(pinDto.groupId)).whenOrNull(data: (d) => d?.groupAdmin);
    bool isNotCreator =  userId != pinDto.creatorId;
    return PopupMenuButton(
        itemBuilder: (context) {
          return [
            if(isNotCreator) const PopupMenuItem<int>(
                value: 0,
                child: Text("Hide post")
            ),
            if(isNotCreator) const PopupMenuItem<int>(
                value: 1,
                child: Text("Report stick")
            ),
            if(isNotCreator) const PopupMenuItem<int>(
                value: 2,
                child: Text("Hide user")
            ),
            if(isNotCreator) const PopupMenuItem<int>(
                value: 3,
                child: Text("Report user")
            ),
            if (userId == adminId || !isNotCreator) const PopupMenuItem<int>(
              value: 4,
              child: Text("Delete"),
            )
          ];
        },
        onSelected:(value){
          switch (value) {
            case 0: ref.read(hiddenPostsServiceProvider.notifier).addHiddenPost(pinDto.id);break;
            case 1: Routing.to(context, ReportIssuePage(issueTypes: ["Report stick"], pinId: pinDto.id,)); break;
            case 2: ref.read(hiddenUserServiceProvider.notifier).addHiddenUser(pinDto.creatorId);break;
            case 3: Routing.to(context, ReportIssuePage(issueTypes: ["Report user"], userId: pinDto.creatorId,)); break;
            case 4: _deleteStick(ref, context); break;
          }
        }
    );
  }

  Future<void> _deleteStick(WidgetRef ref, BuildContext context) async {
    CustomDialog.show(
        context,
        acceptText: "Delete",
        title: "Delete this sticker?",
        cancelText: "Cancel",
        onPressed: () async {
          final result = await ref.read(pinServiceProvider(pinDto.groupId).notifier).deletePinFromGroup(pinDto.id);
          if (result != null) {
            CustomErrorSnackBar.message(message: result);
          }
    });

  }
}