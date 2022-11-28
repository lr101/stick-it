import 'package:buff_lisa/6_Group_Search/my_groups_ui.dart';
import 'package:buff_lisa/6_Group_Search/search_logic.dart';
import 'package:buff_lisa/6_Group_Search/show_group_logic.dart';
import 'package:flutter/material.dart';

import '../Files/DTOClasses/group.dart';


class MyGroupsPage extends StatefulWidget {
  const MyGroupsPage({super.key});

  @override
  MyGroupsPageState createState() => MyGroupsPageState();
}

class MyGroupsPageState extends State<MyGroupsPage> with AutomaticKeepAliveClientMixin<MyGroupsPage>{

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MyGroupsUI(state: this);
  }

  /// Opens the SearchGroupPage Widget as a new page
  void handlePressSearchGroup() {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => const SearchGroupPage()
      ),
    );
  }

  /// Opens the ShowGroupPage Widget as a new page
  Future<void> handlePressGroupCard(Group group) async {
    Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => ShowGroupPage(group: group, myGroup: true)
        )
    );
  }

  /// keep Widget alive when changing tabs in navbar
  @override
  bool get wantKeepAlive => true;
}