
import 'package:buff_lisa/data/service/filter_service.dart';
import 'package:buff_lisa/util/routing/routing.dart';
import 'package:buff_lisa/widgets/buttons/presentation/custom_menu_item.dart';
import 'package:buff_lisa/widgets/report_issue/presentation/report_issue_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PopUpMenuOtherUser extends ConsumerWidget {

  const PopUpMenuOtherUser({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton(
        itemBuilder: (context) {
          return [
            CustomMenuItem<int>(
                value: 0,
                title: "Hide user",
              icon: Icons.hide_image,
            ),
            CustomMenuItem<int>(
                value: 1,
                title: "Report user",
                icon: Icons.report,
            ),
          ];
        },
        onSelected:(value){
          switch (value) {
            case 0: ref.read(hiddenUserServiceProvider.notifier).addHiddenUser(userId); Navigator.pop(context);
            case 1: Routing.to(context, ReportIssuePage(issueTypes: const ["Report user"], userId: userId,));
          }
        },
    );
  }

}
