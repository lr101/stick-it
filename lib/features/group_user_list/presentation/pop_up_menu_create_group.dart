import 'package:buff_lisa/features/group_create/presentation/group_create.dart';
import 'package:buff_lisa/features/group_search/presentation/group_search.dart';
import 'package:buff_lisa/util/routing/routing.dart';
import 'package:flutter/material.dart';

class PopUpMenuCreateGroup extends StatelessWidget {

  const PopUpMenuCreateGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        icon: const Icon(Icons.add),
        itemBuilder: (context) {
          return [
            const PopupMenuItem<int>(
                value: 0,
                child: Text("Search existing groups"),
            ),
            const PopupMenuItem<int>(
                value: 1,
                child: Text("Create a new group"),
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