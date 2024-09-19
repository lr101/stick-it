
import 'package:buff_lisa/data/dto/pin_dto.dart';
import 'package:buff_lisa/data/service/filter_service.dart';
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/data/service/pin_service.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:buff_lisa/features/settings/presentation/sub_widgets/report.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../util/routing/routing.dart';
import '../../../../widgets/custom_interaction/presentation/custom_error_snack_bar.dart';

class PopUpMenuFeed extends ConsumerWidget {

  const PopUpMenuFeed({super.key, required this.pinDto});

  final LocalPinDto pinDto;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(globalDataServiceProvider).userId;
    final adminId = ref.watch(groupByIdProvider(pinDto.groupId)).value?.groupAdmin;
    return PopupMenuButton(
        itemBuilder: (context) {
          return [
            const PopupMenuItem<int>(
                value: 0,
                child: Text("Hide post")
            ),
            const PopupMenuItem<int>(
                value: 1,
                child: Text("Report stick")
            ),
            const PopupMenuItem<int>(
                value: 2,
                child: Text("Hide user")
            ),
            const PopupMenuItem<int>(
                value: 3,
                child: Text("Report user")
            ),
            if (userId == adminId || userId == pinDto.creatorId) const PopupMenuItem<int>(
              value: 4,
              child: Text("Delete stick"),
            )
          ];
        },
        onSelected:(value){
          switch (value) {
            case 0: ref.read(hiddenPostsServiceProvider.notifier).addHiddenPost(pinDto.id);break;
            case 1: Routing.to(context, ReportIssuePage(issueTypes: ["Report stick"], pinId: pinDto.id,)); break;
            case 2: ref.read(hiddenUserServiceProvider.notifier).addHiddenUser(pinDto.creatorId);break;
            case 3: Routing.to(context, ReportIssuePage(issueTypes: ["Report user"], pinId: pinDto.creatorId,)); break;
            case 4: leaveGroup(ref, context); break;
          }
        }
    );
  }

  Future<void> leaveGroup(WidgetRef ref, BuildContext context) async {
    final result = await ref.read(pinServiceProvider(pinDto.groupId).notifier).deletePinFromGroup(pinDto.id);
    if (result != null) {
      CustomErrorSnackBar.message(context: context, message: result);
    }
  }
}