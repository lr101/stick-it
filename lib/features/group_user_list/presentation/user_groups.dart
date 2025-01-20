import 'package:buff_lisa/data/dto/group_dto.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:buff_lisa/features/group_user_list/presentation/pop_up_menu_create_group.dart';
import 'package:buff_lisa/widgets/custom_scaffold/presentation/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../util/routing/routing.dart';
import '../../../widgets/tiles/presentation/group_tile.dart';
import '../../group_overview/presentation/user_group_overview.dart';

class UserGroups extends ConsumerStatefulWidget {
  const UserGroups({super.key});

  @override
  ConsumerState<UserGroups> createState() => _UserGroupsState();
}

class _UserGroupsState extends ConsumerState<UserGroups> {

  final _pagingController = PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      updatePage(ref.watch(userGroupServiceProvider).value?.toList() ?? []);
    });
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
  
  
  @override
  Widget build(BuildContext context) {
    ref.listen(orderedGroupsProvider, (_, next) => updatePage(next.value ?? []));
    return CustomScaffold<LocalGroupDto>(
        title: Text("Your groups"),
        actions: [const PopUpMenuCreateGroup()],
        listBuilder: (context, item, index) => GroupTile(
          groupDto: item,
          onTap: () => openGroupOverview(item),
        ),
        pagingController: _pagingController
    );
  }
  
  void updatePage(List<LocalGroupDto> groups) {
    _pagingController.refresh();
    _pagingController.appendLastPage(groups);
  }

  void openGroupOverview(LocalGroupDto group) {
    Routing.to(context, UserGroupOverview(groupId: group.groupId));
  }

}