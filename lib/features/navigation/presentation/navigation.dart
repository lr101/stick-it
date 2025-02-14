import 'package:buff_lisa/features/camera/presentation/camera.dart';
import 'package:buff_lisa/features/feed/presentation/active_group_feed.dart';
import 'package:buff_lisa/features/group_user_list/presentation/user_groups.dart';
import 'package:buff_lisa/features/map_home/presentation/map_home.dart';
import 'package:buff_lisa/features/navigation/data/navigation_provider.dart';
import 'package:buff_lisa/features/navigation/presentation/syncing_preview.dart';
import 'package:buff_lisa/features/navigation/presentation/tab_group_preview.dart';
import 'package:buff_lisa/features/profile/presentation/user_profile.dart';
import 'package:buff_lisa/widgets/group_selector/presentation/group_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Navigation extends ConsumerStatefulWidget {
  const Navigation({super.key});

  @override
  ConsumerState<Navigation> createState() => _NavigationState();
}

class _NavigationState extends ConsumerState<Navigation> {
  late PageController _pageController;

  late final List<Widget> widgetOptions;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: ref.read(navigationStateProvider));
    widgetOptions = <Widget>[
      const UserGroups(),
      const Camera(),
      const MapHome(),
      const ActiveGroupFeed(),
      const UserProfile(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.09;
    final groupSelector = GroupSelector(height: height);

    final state = ref.watch(navigationStateProvider);
    return  Scaffold(
        backgroundColor: state == 2 ? Colors.transparent : null,
        body: Stack(
          children: [
            Column(
              children: [
                if (state == 3) SizedBox(height: height),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: widgetOptions,
                  ),
                ),
              ],
            ),
            if (state == 2 || state == 3)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  groupSelector,
                  if (state == 2) const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TopGroupsPreview(),
                      SyncingPreview(),
                    ],
                  ),

                ],),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: 'Groups',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_location_alt_outlined),
              label: 'Camera',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map_outlined),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dynamic_feed),
              label: 'Feed',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: state,
          onTap: onItemTapped,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Theme.of(context).hintColor,
        ),);
  }

  void onItemTapped(int index) {
    _pageController.jumpToPage(index);
    ref.read(navigationStateProvider.notifier).setIndex(index);
  }
}
