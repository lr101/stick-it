import 'package:buff_lisa/5_Feed/feed_ui.dart';
import 'package:buff_lisa/Ads/custom_native_ad.dart';
import 'package:buff_lisa/Files/DTOClasses/group.dart';
import 'package:buff_lisa/Files/DTOClasses/pin.dart';
import 'package:buff_lisa/Providers/cluster_notifier.dart';
import 'package:buff_lisa/Providers/date_notifier.dart';
import 'package:buff_lisa/Providers/theme_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import '../Files/Other/global.dart' as global;
import '../Files/ServerCalls/fetch_pins.dart';
import '../Files/Widgets/custom_round_image.dart';
import 'FeedCard/feed_card_logic.dart';


class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  FeedPageState createState() => FeedPageState();
}

class FeedPageState extends State<FeedPage>  with AutomaticKeepAliveClientMixin<FeedPage>{

  /// Controller for the Paged List-view
  /// always shows first item first and loads 3 items that are out of view
  final PagingController<int, Widget> pagingController = PagingController(firstPageKey: 0, invisibleItemsThreshold: 10);

  /// Set of Groups that are currently shown
  /// Used to reduce the amounts of Widgets that need to be created everytime the Provider updates its values
  late Set<Group> groups = {};

  /// Saves all Pins that could be seen in the feed with the Widget that is shown if already created
  late List<Pin> allWidgets = [];

  /// const value for adding an add for every x posts
  final _addEvery = 4;

  /// current last seen date
  DateTime? lastSeen;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FeedUI(state: this);
  }

  /// Inits the pagingController and adds the methods to its scroll listener
  @override
  void initState() {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DateNotifier>(context, listen: false).setDateNow();
    });
    super.initState();
  }

  /// Adds a new Feed Widget to the Listview by appending it to the pagingController
  /// Checks if the Pin at the position [pageKey] already has an existing Widget
  /// If not a new one is created
  void _fetchPage(int pageKey) async {
    try {
      List<Pin> pins = [];
      int page = pageKey;
      bool last = false;
      if (pageKey + 9 < allWidgets.length) {
        for (; pageKey < page + 9; pageKey++) {
         pins.add(allWidgets[pageKey]);
        }
      } else {
        last = true;
        for (; pageKey < allWidgets.length; pageKey++) {
          pins.add(allWidgets[pageKey]);
        }
      }
      List<Widget> widgets = [];
      await FetchPins.fetchImageOfPins(pins.where((element) => element.image.isEmpty).toList());
      for (Pin pin in pins) {
        Widget widget =  FeedCard(pin: pin, update: pullRefresh,);
        if (pin.group.active) {
          // no new posts in the middle
          if (lastSeen != null &&
              page > 0 &&
              allWidgets.elementAt(page - 1).creationDate.isAfter(lastSeen!) &&
              pin.creationDate.isBefore(lastSeen!)
          ) widgets.add(alreadySeenEverything("You have seen all new posts\nTry adding something yourself"));
          // no new posts at the start
          if (lastSeen != null &&
              page == 0 &&
              pin.creationDate.isBefore(lastSeen!)
          ) widgets.add(alreadySeenEverything("There are no new posts\nTry adding something yourself"));
          // add current feed page
          widgets.add(widget);
          // add an ad
          if (page % _addEvery == 0) widgets.add(const Card(child: CustomNativeAd()));
        }
        page++;
      }
      if (last) {
        pagingController.appendLastPage(widgets);
      } else {
        pagingController.appendPage(widgets, pageKey);
      }
    } catch (error) {
      if (kDebugMode) print(error);
      pagingController.appendLastPage([]);
    }
  }

  /// Triggers when new ClusterNotifier notifies changes.
  /// Updates groups and last seen.
  /// Rebuilds FeedCards.
  void init() {
    groups = Provider.of<ClusterNotifier>(context).getActiveGroups.toSet();
    lastSeen = Provider.of<DateNotifier>(context, listen:false).getDate();
    pullRefresh();
  }

  Widget alreadySeenEverything(String text) {
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: Provider.of<ThemeNotifier>(context, listen: false).getCustomTheme.c1)),
          height: 100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomRoundImage(
                size: 20,
                image: Image.asset("images/pinGui.png").image,
                clickable: false,
              ),
              const SizedBox(width: 10,),
              Text(text,textAlign: TextAlign.center,)
            ],
          )
        )
    );
  }

  /// Rebuilds all FeedCards by using all active pins of groups or reloading them from server.
  /// Sorts all pins by creation date desc.
  Future<void> pullRefresh({refresh = false}) async {
    if (refresh) {
      lastSeen = Provider.of<DateNotifier>(context, listen:false).getDate();
      Provider.of<DateNotifier>(context, listen: false).setDateNow();
    }
    allWidgets.clear();
    for (Group group in groups) {
      Set<Pin> pins = refresh ? await group.pins.refresh() : await group.pins.asyncValue();
      allWidgets.addAll(pins);
    }
    allWidgets.sort((k1, k2) => k1.creationDate.compareTo(k2.creationDate) * -1);
    pagingController.refresh();
  }

  /// disposed the controller when the page is closed
  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }

  /// keeps Widget alive when changing tabs in navbar
  @override
  bool get wantKeepAlive => true;
}