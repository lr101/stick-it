import 'package:buff_lisa/6_Group_Search/ClickOnExplore/ClickOnCreateGroup/create_group_logic.dart';
import 'package:buff_lisa/6_Group_Search/ClickOnExplore/search_notifier.dart';
import 'package:buff_lisa/6_Group_Search/ClickOnExplore/search_ui.dart';
import 'package:buff_lisa/6_Group_Search/ClickOnGroup/show_group_logic.dart';
import 'package:buff_lisa/Files/DTOClasses/group.dart';
import 'package:buff_lisa/Files/ServerCalls/fetch_groups.dart';
import 'package:buff_lisa/Files/Widgets/custom_round_image.dart';
import 'package:buff_lisa/Providers/cluster_notifier.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';


class SearchGroupPage extends StatefulWidget {
  const SearchGroupPage({super.key});

  @override
  SearchGroupPageState createState() => SearchGroupPageState();
}

class SearchGroupPageState extends State<SearchGroupPage> {

  /// number of items loaded into every page of page list
  final int _numPages = 15;

  /// controller of page list
  final PagingController<dynamic, Widget> pagingController = PagingController(firstPageKey: 0, invisibleItemsThreshold: 1);


  /// List of all group ids that could be shown in page list
  late List<int> groups = [];

  /// Boolean to track if groups in list are currently filtered in list view
  /// Used to know if reset is needed when deactivating search
  /// true: groups in list are filtered currently
  /// false: groups in list are not filtered currently
  bool filtered = false;

  @override
  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    final state = this;
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: SearchNotifier(pullRefresh: pullRefresh),
          ),
        ],
        builder: (context, child) {
          this.context = context;
          return SearchUI(state: state);
        },
    );
  }

  /// add page list scroll listener and its callback function
  @override
  void initState() {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    pullRefresh(null);
    super.initState();
  }

  /// Get Card with button to navigate to create group page
  /// Is always at the first postion of the list
  Widget getCardCreateNewGroup() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: ListTile(
        onTap: handlePressNewGroup,
        title: const Text("Create a new group",),
        leading: const Icon(Icons.add),
      ),
    );
  }

  /// Gets group information of ids from index range [pageKey, pageKey + _numPages -1]
  /// Adds the Groups to [pagingController] to be build in page List
  Future<void> _fetchPage(int pageKey) async {
    if (pageKey == 0) {
      pagingController.appendPage([getCardCreateNewGroup()], pageKey + 1);
    } else {
      if (pageKey + 50 < groups.length + 1) {
        List<Widget> widgets = [];
        int i = pageKey;
        for (; pageKey < i + 50; pageKey++) {
          widgets.add(await getCardOfOtherGroups(pageKey - 1));
        }
        pagingController.appendPage(widgets, pageKey);
      } else {
        List<Widget> widgets = [];
        for (; pageKey < groups.length + 1; pageKey++) {
          widgets.add(await getCardOfOtherGroups(pageKey - 1));
        }
        pagingController.appendLastPage(widgets);
      }
    }
  }

  /// gets all Group ids that could be shown in page list
  /// [value] is the search term passed to the server to get the corresponding results
  Future<void> pullRefresh(String? value) async {
    value = (value == null || value.isEmpty ? null : value);
    groups = await FetchGroups.fetchAllGroupsWithoutUserGroupsIds(value);
    filtered = value != null;
  }


  /// opens the CreateGroupPage Widget when the create group page button is pressed
  void handlePressNewGroup() {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => const CreateGroupPage()
      ),
    );
  }

/// Get Card of a Group
/// Shows the name, group image, visibility
Future<Widget> getCardOfOtherGroups(int index) async {
    Group group;
    try {
      group = Provider.of<ClusterNotifier>(context, listen: false).otherGroups.firstWhere((element) => element.groupId == groups[index]);
    } catch(_) {
      group = await FetchGroups.getGroup(groups[index]);
      if (!mounted) return const SizedBox.shrink();
      Provider.of<ClusterNotifier>(context,listen: false).addOtherGroup(group);
    }
  return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: GestureDetector(
        onTap: () => handleJoinGroupPress(group),
        child: ListTile(
          leading: CustomRoundImage(
            size: 20,
            imageCallback: group.profileImage.asyncValue,
            clickable: false,
          ),
          title: Text(group.name),
          trailing: (group.visibility != 0 ? const Icon(Icons.lock_outline) : const Icon(Icons.lock_open)),
        ),
      )
  );
}

  /// opens the ShowGroupPage Widget when a group card is pressed and wait for the result
  /// If the group was joined the group card is removed from the list of join able groups
  Future<void> handleJoinGroupPress(Group group) async {
    Map<String, dynamic>? result = await Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => ShowGroupPage(group: group, myGroup: false)),
    );
    if (result != null && result["joined"] != null && result["joined"] as bool) {
      groups.removeWhere((element) => element == group.groupId);
      pagingController.refresh();
    }
  }

}