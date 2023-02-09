import 'dart:typed_data';

import 'package:buff_lisa/8_SelectGroupWidget/select_group_widget_logic.dart';
import 'package:buff_lisa/Files/AbstractClasses/abstract_widget_ui.dart';
import 'package:buff_lisa/Providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import 'package:buff_lisa/Files/DTOClasses/group.dart';
import 'package:buff_lisa/Files/Other/global.dart' as global;
import 'package:buff_lisa/Providers/cluster_notifier.dart';


class SelectGroupWidgetUI extends StatefulUI<SelectGroupWidget, SelectGroupWidgetState>{

  const SelectGroupWidgetUI({super.key, required state}) : super(state: state);



  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).viewPadding.top + 80,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
                height: MediaQuery.of(context).viewPadding.top,
                width: double.infinity,
            ),
            Container(
                width: double.infinity,
                height: 80,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft:  Radius.circular(10), bottomRight: Radius.circular(10))
                ),
                child: ListView.builder(
                  itemCount: Provider.of<ClusterNotifier>(context).getGroups.length,
                  itemBuilder: groupCard,
                  scrollDirection: Axis.horizontal,
                )
            )
          ],
        )
    );
  }

  /// returns the circle avatar of the group and dynamically loads the image from the server
  Widget groupCard(BuildContext context,int index) {
    Group group = Provider.of<ClusterNotifier>(context, listen: false).getGroups[index];
    Group? lastSelected = Provider.of<ClusterNotifier>(context, listen: false).getLastSelected;
    Color color = Colors.grey;
    if ((group.active && state.widget.multiSelector) || (!state.widget.multiSelector && lastSelected != null && group == lastSelected)) {
      color = Provider.of<ThemeProvider>(context).getCustomTheme.c1;
    }
    return Padding(
        padding: const EdgeInsets.all(5),
        child: GestureDetector(
            onTap: () => state.onGroupTab(group),
            child: CircleAvatar(
                radius: 35,
                backgroundColor: color,
                child: FutureBuilder<Uint8List>(
                  future: group.profileImage.asyncValue(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return CircleAvatar(backgroundImage: Image.memory(snapshot.data!).image, radius: 33,);
                    } else {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.shade700,
                        highlightColor: Colors.grey.shade900,
                        child: const CircleAvatar(radius: 33,)
                      );
                    }
                  },
                ),
            )
        )
    );
  }
}