import 'package:buff_lisa/2_ScreenMaps/ClickOnPin/image_widget_logic.dart';
import 'package:buff_lisa/5_Feed/FeedCard/feed_card_ui.dart';
import 'package:buff_lisa/6_Group_Search/ClickOnGroup/show_group_logic.dart';
import 'package:buff_lisa/9_Profile/profile_logic.dart';
import 'package:buff_lisa/Files/DTOClasses/pin.dart';
import 'package:buff_lisa/Providers/cluster_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

import '../../7_Settings/Report/report_user.dart';
import '../../Files/Other/global.dart' as global;
import '../../Files/Routes/routing.dart';

class FeedCard extends StatefulWidget {
  const FeedCard({super.key, required this.pin, this.update});

  /// Pin shown on this Card shown in the feed
  final Pin pin;



  final Future<void> Function()? update;

  @override
  FeedCardState createState() => FeedCardState();
}

class FeedCardState extends State<FeedCard> {

  late final LatLng center;

  /// controller of the flutter_map
  MapController controller = MapController();

  double currentZoom = global.feedZoom;

  @override
  void initState() {
    super.initState();
    center = LatLng(widget.pin.latitude, widget.pin.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return FeedCardUI(state: this);
  }

  /// Hides the current pin und reloads the view.
  Future<void> handleHidePost(BuildContext context) async {
    if (global.localData.userId != widget.pin.creatorId) {
      await global.localData.hiddenPosts.put(DateTime.now(), key: widget.pin.id);
      if (!mounted) return;
      await Provider.of<ClusterNotifier>(context, listen: false).hidePin(widget.pin);
      widget.update!();
    }
  }

  /// Hides the user of the current pin.
  Future<void> handleHideUsers(BuildContext context) async {
    if (global.localData.userId != widget.pin.creatorId) {
      await global.localData.hiddenUsers.put(DateTime.now(), key: widget.pin.creatorId);
      if (!mounted) return;
      await Provider.of<ClusterNotifier>(context, listen: false).updateFilter();
      widget.update!();
    }
  }

  /// Report user of current pin.
  Future<void> handleReportUser(BuildContext context) async {
    String userId = widget.pin.creatorId;
    if (userId != global.localData.userId) {
      Routing.to(context, ReportUser(content: userId, title: "Report User", hintText: "Why do you want to report this user?", userText:  'Report user: $userId'));
    }
  }

  /// Report current pin.
  Future<void> handleReportPost(BuildContext context) async {
    String userId = widget.pin.creatorId;
    if (userId != global.localData.userId) {
      Routing.to(context, ReportUser(content: widget.pin.id, title: "Report Content", hintText: "Why do you want to report this content?",userText: "Report content of user: $userId",));
    }
  }

  /// Zoom out in the map of this pin.
  void zoomOut() {
    currentZoom -= 1;
    controller.move(center, currentZoom);
  }

  /// Zoom in in the map of this pin.
  void zoomIn() {
    currentZoom += 1;
    controller.move(center, currentZoom);
  }

  /// Open group of current pin.
  void handleOpenGroup() {
    Routing.to(context, ShowGroupPage(group: widget.pin.group, myGroup: true));
  }

  /// Open profile of the user of the current pin.
  void handleOpenUserProfile() {
    if (widget.pin.creatorId == global.localData.userId) return;
    Routing.to(context, ProfilePage(userId: widget.pin.id));
  }

  /// Open a more detailed view of current pin image.
  void handleTabOnImage() {
    Routing.to(context, ShowImageWidget(pin: widget.pin));
  }

}