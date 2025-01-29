import 'package:buff_lisa/features/group_create/presentation/group_create.dart';
import 'package:buff_lisa/features/group_search/presentation/group_search.dart';
import 'package:buff_lisa/util/routing/routing.dart';
import 'package:buff_lisa/widgets/buttons/presentation/custom_menu_item.dart';
import 'package:flutter/material.dart';

class PopUpMenuCreateGroup extends StatelessWidget {

  const PopUpMenuCreateGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        icon: const Icon(Icons.add),
        itemBuilder: (context) {
          return [
            CustomMenuItem<int>(
              value: 0,
              title: "Search existing groups",
              icon: Icons.search,
            ),
            CustomMenuItem<int>(
              value: 1,
              title: "Create a new group",
              icon: Icons.group_add_outlined,
            ),
          ];
        },
        onSelected:(value){
          switch (value) {
            case 0: Routing.to(context, const GroupSearch());
            case 1: Routing.to(context, const GroupCreate());
          }
        },
    );
  }
}
