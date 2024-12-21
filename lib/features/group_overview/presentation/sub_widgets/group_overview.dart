import 'package:buff_lisa/data/dto/group_dto.dart';
import 'package:buff_lisa/data/service/group_image_service.dart';
import 'package:buff_lisa/data/service/member_service.dart';
import 'package:buff_lisa/data/service/pin_service.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:buff_lisa/widgets/custom_interaction/presentation/custom_error_snack_bar.dart';
import 'package:buff_lisa/widgets/custom_scaffold/presentation/custom_avatar_scaffold.dart';
import 'package:buff_lisa/widgets/image_grid/presentation/image_grid.dart';
import 'package:buff_lisa/widgets/tiles/presentation/member_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../util/routing/routing.dart';
import 'group_image_feed.dart';

class GroupOverview extends ConsumerStatefulWidget {
  const GroupOverview(
      {super.key, required this.groupId, this.floatingActionButton, this.actions});

  final String groupId;
  final Widget? floatingActionButton;
  final List<Widget>? actions;

  @override
  ConsumerState<GroupOverview> createState() => _GroupOverviewState();
}

class _GroupOverviewState extends ConsumerState<GroupOverview>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final members = ref.watch(memberServiceProvider(widget.groupId));
    final group = ref.watch(groupByIdProvider(widget.groupId)).value;
    return CustomAvatarScaffold(
        floatingActionButton: widget.floatingActionButton,
        avatar: ref.watch(groupProfilePictureByIdProvider(widget.groupId)),
        title: Text(group?.name ?? ""),
        actions: widget.actions,
        bottom: TabBar(controller: _tabController, tabs: const [
          Tab(icon: Icon(Icons.groups)),
          Tab(icon: Icon(Icons.image))
        ]),
        boxes: [
          SliverToBoxAdapter(
              child: ListTile(
            title: Text("Members"),
            subtitle: Text(
                members.whenOrNull(data: (data) => data.length.toString()) ??
                    0.toString()),
          )),
          SliverToBoxAdapter(
              child: ListTile(
            title: Text("Sticks"),
            subtitle: Text(members.whenOrNull(
                    data: (data) =>
                        data.fold(0, (p, e) => p + e.points).toString()) ??
                0.toString()),
          )),
          SliverToBoxAdapter(
              child: ListTile(
            title: Text("Description"),
            subtitle: group?.description != null
                ? Text(
                    group!.description!,
                    softWrap: true,
                    maxLines: 10,
                    style: TextStyle(fontStyle: FontStyle.italic),
                  )
                : Icon(Icons.lock),
          )),
          if (group?.link != null)
            SliverToBoxAdapter(
                    child: ListTile(
                      onTap: () => Routing.clickedOnLink(group!.link),
                    title: Row( children: [Text("External Link"), Spacer(), Icon(Icons.open_in_new_rounded)]),
                    subtitle: Text(group!.link ?? "No link set", maxLines: 1, overflow: TextOverflow.ellipsis,))),
          if (group != null && group.visibility != 0)
            SliverToBoxAdapter(
              child: ListTile(
                onTap: ()  => clickedOnInviteCode(group),
                title: Text("Invite code"),
                subtitle:
                    Text(group.inviteUrl ?? "Ups something went wrong"),
              ),
            )
        ],
        body: TabBarView(controller: _tabController, children: [
          members.when(
              data: (data) => ListView.builder(
                    itemBuilder: (context, index) =>
                        MemberTile(memberDto: data[index], adminId: group?.groupAdmin ?? "", ),
                    itemCount: data.length,
                  ),
              error: (err, __) => Center(child: Text("Ups something went wrong")),
              loading: () => const Center(child: CircularProgressIndicator())),
          ImageGrid(
            pinProvider: sortedGroupPinsProvider(widget.groupId),
            onTab: (index) => Routing.to(context,
                GroupImageFeed(index: index, groupId: widget.groupId)),
          ),
        ]));
  }



  void clickedOnInviteCode(LocalGroupDto? group) {
    if (group?.inviteUrl != null) {
      Clipboard.setData(ClipboardData(text: group!.inviteUrl!));
    }
  }
}
