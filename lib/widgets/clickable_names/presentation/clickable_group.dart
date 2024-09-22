
import 'package:buff_lisa/data/dto/group_dto.dart';
import 'package:flutter/cupertino.dart';
import '../../../features/group_overview/presentation/sub_widgets/group_overview.dart';
import '../../../util/routing/routing.dart';

class ClickableGroup extends StatelessWidget {

  final LocalGroupDto groupDto;
  final TextStyle? textStyle;

  const ClickableGroup({super.key, required this.groupDto, this.textStyle});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Routing.to(context, GroupOverview(group: groupDto)),
      child: Text(groupDto.name, style: textStyle,),
    );
  }


}