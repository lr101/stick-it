
import 'package:buff_lisa/data/service/group_service.dart';
import 'package:buff_lisa/features/group_overview/presentation/sub_widgets/group_overview.dart';
import 'package:buff_lisa/features/group_overview/presentation/user_group_overview.dart';
import 'package:buff_lisa/util/routing/routing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ClickableGroup extends ConsumerWidget {

  final String groupId;
  final Widget child;

  const ClickableGroup({super.key, required this.groupId, required this.child});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
      return GestureDetector(
        onTap: () => context.pushNamed("groupOverview", pathParameters: {"id": groupId}),
        child: child,
      );
  }

}
