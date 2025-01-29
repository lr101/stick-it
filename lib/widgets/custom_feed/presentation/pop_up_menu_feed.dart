
import 'package:buff_lisa/data/dto/pin_dto.dart';
import 'package:buff_lisa/data/service/filter_service.dart';
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/data/service/pin_service.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:buff_lisa/util/routing/routing.dart';
import 'package:buff_lisa/widgets/buttons/presentation/custom_menu_item.dart';
import 'package:buff_lisa/widgets/custom_interaction/presentation/custom_dialog.dart';
import 'package:buff_lisa/widgets/custom_interaction/presentation/custom_error_snack_bar.dart';
import 'package:buff_lisa/widgets/report_issue/presentation/report_issue_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PopUpMenuFeed extends ConsumerWidget {

  const PopUpMenuFeed({super.key, required this.pinDto});

  final LocalPinDto pinDto;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(globalDataServiceProvider).userId!;
    final adminId = ref.watch(groupByIdProvider(pinDto.groupId)).whenOrNull(data: (d) => d?.groupAdmin);
    final bool isNotCreator =  userId != pinDto.creatorId;
    return PopupMenuButton(
        itemBuilder: (context) {
          return [
            if(isNotCreator) CustomMenuItem<int>(
                value: 0,
                title: "Hide post",
                icon: Icons.hide_image,
            ),
            if(isNotCreator) CustomMenuItem<int>(
                value: 1,
                title: "Report stick",
              icon: Icons.report,
            ),
            if(isNotCreator) CustomMenuItem<int>(
                value: 2,
                title: "Hide user",
              icon: Icons.hide_source,
            ),
            if(isNotCreator) CustomMenuItem<int>(
                value: 3,
                title: "Report user",
              icon: Icons.report,
            ),
            if (userId == adminId || !isNotCreator) CustomMenuItem<int>(
              value: 4,
              title: "Delete",
              icon: Icons.delete,
            ),
          ];
        },
        onSelected:(value){
          switch (value) {
            case 0: ref.read(hiddenPostsServiceProvider.notifier).addHiddenPost(pinDto.id);
            case 1: Routing.to(context, ReportIssuePage(issueTypes: const ["Report stick"], pinId: pinDto.id,));
            case 2: ref.read(hiddenUserServiceProvider.notifier).addHiddenUser(pinDto.creatorId);
            case 3: Routing.to(context, ReportIssuePage(issueTypes: const ["Report user"], userId: pinDto.creatorId,));
            case 4: _deleteStick(ref, context);
          }
        },
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
    },);

  }
}
