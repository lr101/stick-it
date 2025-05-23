import 'dart:ui';

import 'package:buff_lisa/features/group_create/presentation/group_create.dart';
import 'package:buff_lisa/features/group_search/presentation/group_search.dart';
import 'package:buff_lisa/util/routing/routing.dart';
import 'package:buff_lisa/widgets/group_selector/presentation/round_dotted_group_card.dart';
import 'package:buff_lisa/widgets/group_selector/presentation/round_group_card.dart';
import 'package:buff_lisa/widgets/group_selector/service/group_order_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GroupSelector extends ConsumerStatefulWidget {
  const GroupSelector({super.key, required this.height});

  final double height;

  @override
  ConsumerState<GroupSelector> createState() => _GroupSelectorState();
}

class _GroupSelectorState extends ConsumerState<GroupSelector>  with AutomaticKeepAliveClientMixin<GroupSelector> {

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final groups = ref.watch(groupOrderServiceProvider);
    final groupsLength = ref.watch(groupOrderServiceProvider.select((e) => e.length));

    return ColoredBox(
        color: Colors.transparent,
        child: SafeArea(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(widget.height / 2)),
                  color: Colors.grey.withValues(alpha: 0.4),
              ),
              width: MediaQuery
                  .of(context)
                  .size
                  .width - 10,
              height: widget.height,
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.all(
                              Radius.circular(widget.height / 2),),
                          color: Colors.transparent,
                      ),
                      child: ReorderableListView.builder(
                                onReorder: (int start, int current) => _onReorder(start, current, groups),
                              scrollDirection: Axis.horizontal,
                             proxyDecorator: _proxyDecorator,
                             itemBuilder: (context, index) {
                                  if (index < groups.length) {
                                    return ProviderScope(
                                      key: ValueKey('reorder_${groups[index]}'),
                                        overrides: [roundGroupIdProvider.overrideWithValue(groups[index])],
                                        child: const RoundGroupCard(),
                                    );
                               } else if (index == groups.length) {
                                    return RoundDottedGroupCard(key: const ValueKey('search'), icon: Icons.search, onTab: () => Routing.to(context, const GroupSearch()));
                               } else {
                                  return RoundDottedGroupCard(key: const ValueKey('new'), icon: Icons.add, onTab: () => Routing.to(context, const GroupCreate()));
                               }
                             }, itemCount: groupsLength + 2,
                          ),
                      ),
                  ),
              ),
          //editColumn()
          ],
        ),
    ),);
  }

  void _onReorder(int start, int current, List<String> list) {
    if (start >= list.length) return;
    if (start < current) {
      final int end = current - 1;
      final String startItem = list[start];
      int i = 0;
      int local = start;
      do {
        list[local] = list[++local];
        i++;
      } while (i < end - start);
      list[end] = startItem;
    } else if (start > current) {
      final String startItem = list[start];
      for (int i = start; i > current; i--) {
        list[i] = list[i - 1];
      }
      list[current] = startItem;
    }
    ref.read(groupOrderServiceProvider.notifier).setList(list);
  }

  Widget _proxyDecorator(Widget child, int index, Animation<double> animation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        final double animValue = Curves.easeInOut.transform(animation.value);
        final double elevation = lerpDouble(0, 6, animValue)!;
        return Material(
          elevation: elevation,
          color: Colors.transparent,
          shadowColor: Colors.transparent,
          child: child,
        );
      },
      child: child,
    );
  }
  
  @override
  bool get wantKeepAlive =>  true;

}
