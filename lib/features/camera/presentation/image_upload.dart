import 'dart:typed_data';

import 'package:buff_lisa/data/dto/pin_dto.dart';
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/data/service/pin_service.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:buff_lisa/data/service/user_image_service_small.dart';
import 'package:buff_lisa/data/service/user_service.dart';
import 'package:buff_lisa/features/camera/data/app_review_state.dart';
import 'package:buff_lisa/features/camera/data/camera_state.dart';
import 'package:buff_lisa/widgets/buttons/presentation/custom_submit_button.dart';
import 'package:buff_lisa/widgets/custom_feed/presentation/feed_card.dart';
import 'package:buff_lisa/widgets/round_image/presentation/round_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:latlong2/latlong.dart';
import 'package:mutex/mutex.dart';
import 'package:select_dialog/select_dialog.dart';
import 'package:uuid/uuid.dart';
import '../../../data/dto/group_dto.dart';
import '../../../widgets/custom_feed/presentation/feed_timeline_header.dart';
import '../../../widgets/custom_interaction/presentation/custom_error_snack_bar.dart';
import '../../../widgets/tiles/presentation/group_tile.dart';

class ImageUpload extends ConsumerStatefulWidget {
  const ImageUpload({super.key, required this.image, required this.position});

  final Uint8List image;
  final LatLng position;

  @override
  ConsumerState<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends ConsumerState<ImageUpload> {
  final TransformationController controller = TransformationController();

  Mutex _m = Mutex();
  late final groupIndexWhenOpened;

  @override
  void initState() {
    super.initState();
    groupIndexWhenOpened = ref.read(cameraGroupIndexProvider);
  }

  @override
  Widget build(BuildContext context) {
    final groups = ref.watch(userGroupServiceProvider).value ?? [];
        return Scaffold(
        appBar: AppBar(
          title: Text("Approve"),
        ),
        body: SingleChildScrollView(child:Padding(padding: EdgeInsets.all(10), child:  Column(
              children: [
                FeedTimelineHeader(groupId: groups[ref.watch(cameraGroupIndexProvider)].groupId, creationDate: DateTime.now(), height: MediaQuery.of(context).size.width - 20, isRotated: true,),
                const SizedBox(height: 10,),
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: InteractiveViewer(
                        panEnabled: false,
                        transformationController: controller,
                        boundaryMargin: const EdgeInsets.all(0),
                        onInteractionEnd: (ScaleEndDetails endDetails) {
                          controller.value = Matrix4.identity();
                        },
                        minScale: 1,
                        maxScale: 4,
                        child: Image.memory(widget.image))),
              ],))

          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(onPressed: handleEdit, child: Icon(Icons.edit), heroTag: "editHero",),
              const SizedBox(height: 10,),
              FloatingActionButton(onPressed: handleApprove, child: Icon(Icons.check), heroTag: "approveHero",),
            ],
          ),
    );
  }

  Future<void> handleApprove() async {
    if (_m.isLocked) return;
    await _m.acquire();
    final pin = LocalPinDto(
        id: const Uuid().v4(),
        latitude: widget.position.latitude,
        longitude: widget.position.longitude,
        creationDate: DateTime.now(),
        creatorId: ref.watch(globalDataServiceProvider).userId!,
        groupId: ref.watch(cameraSelectedGroupProvider).groupId,
        isHidden: false);
    _m.release();
    Future(() => ref.read(pinServiceProvider(ref.watch(cameraSelectedGroupProvider).groupId).notifier).addPinToGroup(pin, widget.image).then((result) {
          if (result != null) {
            CustomErrorSnackBar.message(message: result);
          } else {
            CustomErrorSnackBar.message(
                message: "Successfully synced to server");
          }
        }));
    if (ref.read(appReviewStateProvider)) {
      ref.read(appReviewStateProvider.notifier).updateLastReviewDate();
      Future(() async {
        final InAppReview inAppReview = InAppReview.instance;
        if (await inAppReview.isAvailable()) {
          inAppReview.requestReview();
        }
      });
    }
    ref.read(cameraGroupIndexProvider.notifier).updateIndex(groupIndexWhenOpened);
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  Future<void> handleEdit() async {
    final groups = ref.watch(userGroupServiceProvider).value ?? [];
    await SelectDialog.showModal<LocalGroupDto>(
      context,
      showSearchBox: false,
      label: Text("Change Group"),
      selectedValue: groups[ref.watch(cameraGroupIndexProvider)],
      itemBuilder: (context, group, b) => GroupTile(groupDto: group),
      items: groups,
      onChange: (group) {
        ref.read(cameraGroupIndexProvider.notifier).updateIndex(groups.indexOf(group));
      },
    );
  }
}
