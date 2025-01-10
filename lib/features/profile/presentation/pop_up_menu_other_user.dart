
import 'package:buff_lisa/data/service/filter_service.dart';
import 'package:buff_lisa/widgets/report_issue/presentation/report_issue_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../util/routing/routing.dart';

class PopUpMenuOtherUser extends ConsumerWidget {

  const PopUpMenuOtherUser({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton(
        itemBuilder: (context) {
          return [
            const PopupMenuItem<int>(
                value: 0,
                child: Text("Hide user")
            ),
            const PopupMenuItem<int>(
                value: 1,
                child: Text("Report user")
            ),
          ];
        },
        onSelected:(value){
          switch (value) {
            case 0: ref.read(hiddenUserServiceProvider.notifier).addHiddenUser(userId); Navigator.pop(context);break;
            case 1: Routing.to(context, ReportIssuePage(issueTypes: ["Report user"], userId: userId,)); break;
          }
        }
    );
  }

}