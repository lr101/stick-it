
import 'package:buff_lisa/data/dto/group_dto.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:buff_lisa/features/group_overview/presentation/user_group_overview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../features/group_overview/presentation/sub_widgets/group_overview.dart';
import '../../../util/routing/routing.dart';

class ClickableGroup extends ConsumerWidget {

  final LocalGroupDto groupDto;
  final TextStyle? textStyle;

  const ClickableGroup({super.key, required this.groupDto, this.textStyle});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMember = ref.watch(userGroupServiceProvider.select((e) => e.value!.any((a) => a.groupId == groupDto.groupId)));
    if (isMember) {
      return GestureDetector(
        onTap: () => Routing.to(context, UserGroupOverview(groupId: groupDto.groupId)),
        child: Text(groupDto.name, style: textStyle,),
      );
    } else {
      return GestureDetector(
        onTap: () => Routing.to(context, GroupOverview(group: groupDto)),
        child: Text(groupDto.name, style: textStyle,),
      );
    }
  }


}