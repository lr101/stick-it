import 'package:buff_lisa/features/camera/presentation/camera.dart';
import 'package:buff_lisa/features/feed/presentation/feed.dart';
import 'package:buff_lisa/features/map_home/presentation/map_home.dart';
import 'package:buff_lisa/features/navigation/data/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/group_selector/presentation/group_selector.dart';
import '../../group_user_list/presentation/user_groups.dart';

class Navigation extends ConsumerStatefulWidget {
  const Navigation({super.key});

  @override
  ConsumerState<Navigation> createState() => _NavigationState();
}

class _NavigationState extends ConsumerState<Navigation> {

  late PageController _pageController;

  final List<Widget> widgetOptions = <Widget>[
    const UserGroups(),
    const Camera(),
    const MapHome(),
    const Feed()
  ];

  final GroupSelector _groupSelector = GroupSelector();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: ref.read(navigationStateProvider));
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(navigationStateProvider);

    return Scaffold(appBar: null,
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: widgetOptions,
            ),
            state == 2 || state == 3 ? _groupSelector : const SizedBox.shrink(),
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
        )
    );
  }

  void onItemTapped(int index) {
     _pageController.jumpToPage(index);
     ref.read(navigationStateProvider.notifier).setIndex(index);
  }

}