import 'package:buff_lisa/data/dto/group_dto.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:buff_lisa/widgets/round_image/presentation/round_image.dart';
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
    final groups = ref.watch(userGroupServiceProvider);

    return Container(
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
                  color: Colors.grey.withOpacity(0.4)
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
                              Radius.circular(widget.height / 2)),
                          color: Colors.transparent
                      ),
                      child: groups.when(
                          data: (d) {
                            print(d);
                            return ListView(
                            children: d.map((e) => groupCard(context, e)).toList(),
                            scrollDirection: Axis.horizontal,
                          );},
                          error: (_,__) => Text("Upps something went wrong. Try again later."),
                          loading: () => const CircularProgressIndicator()
                      )
                  )
              )
          )
          //editColumn()
          ],
        )
    ),);
  }


  Widget groupCard(BuildContext context, LocalGroupDto group) {
    double baseHeight =( MediaQuery.of(context).size.height * 0.09) - 15;
    Color color = Colors.grey.withOpacity(0.8);
    Widget num = const SizedBox.shrink();
    if ((group.isActivated)) {
      color = Colors.transparent;
      // num = getNumNewPosts(group, context);
    }
    return Padding(
        padding: const EdgeInsets.all(5),
        child: GestureDetector(
            onTap: () => {
              ref.read(userGroupServiceProvider.notifier).setIsActive(group.groupId, !group.isActivated),
            },
            child: RoundImage(
              size: baseHeight / 2,
              clickable: false,
              imageCallback: AsyncData(group.profileImage),
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: baseHeight / 2 + 1,
                    backgroundColor: color,
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: num
                  ),
                ],
              ),
            )
        )
    );

  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive =>  true;

}