import 'package:buff_lisa/data/service/member_service.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:buff_lisa/widgets/custom_scaffold/presentation/custom_avatar_scaffold.dart';
import 'package:buff_lisa/widgets/image_grid/presentation/image_grid.dart';
import 'package:buff_lisa/widgets/tiles/presentation/member_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GroupOverview extends ConsumerStatefulWidget {
  const GroupOverview({super.key, required this.group});

  final GroupByIdProvider group;

  @override
  ConsumerState<GroupOverview> createState() => _GroupOverviewState();
}

class _GroupOverviewState extends ConsumerState<GroupOverview> with TickerProviderStateMixin {

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
    return ref.watch(widget.group).when(
        data: (data) {
          final members = ref.watch(memberServiceProvider(data!.groupId));
          return CustomAvatarScaffold(
              avatar: AsyncData(data.profileImage),
              title: data.name,
              bottom: TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(icon: Icon(Icons.groups)),
                    Tab(icon: Icon(Icons.image))
                  ]
              ),
              boxes: [
                SliverToBoxAdapter(
                    child: ListTile(
                      title: Text("Description"),
                      subtitle: data.description != null ? Text(data.description!, softWrap: true, maxLines: 10, style:  TextStyle(fontStyle: FontStyle.italic),) : Icon(Icons.lock),
                    )
                ),
                if (data.link != null) SliverToBoxAdapter(
                    child: ListTile(
                        title: Text("External Link"),
                        subtitle: Text(data.link ?? "No link set")
                    )
                ),
                if (data.visibility != 0) SliverToBoxAdapter(
                  child: ListTile(
                    title: Text("Invite code"),
                    subtitle: Text(data.inviteUrl ?? "Ups something went wrong"),
                  ),
                )
              ],
              body: TabBarView(
                  controller: _tabController,
                  children: [
                    members.when(
                        data: (data) => ListView.builder(
                          itemBuilder: (context, index) => MemberTile(memberDto: data[index]),
                          itemCount: data.length,
                        ),
                        error: (_,__) => Text("ups something went wrong"),
                        loading: () => const Center(child: CircularProgressIndicator())
                    ),
                    ImageGrid(groupId: data.groupId)
                  ]
              )
          );
        },
        error: (t,__) => Text(t.toString()),
        loading: () => const Center(child: CircularProgressIndicator())
    );
  }

}