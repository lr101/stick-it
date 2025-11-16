import 'dart:typed_data';

import 'package:buff_lisa/data/dto/pin_dto.dart';
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/data/service/pin_service.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:buff_lisa/features/camera/data/app_review_state.dart';
import 'package:buff_lisa/features/camera/data/camera_state.dart';
import 'package:buff_lisa/widgets/buttons/presentation/custom_submit_button.dart';
import 'package:buff_lisa/widgets/custom_interaction/presentation/custom_error_snack_bar.dart';
import 'package:buff_lisa/widgets/custom_scaffold/presentation/custom_close_keyboard_scaffold.dart';
import 'package:buff_lisa/widgets/group_selector/service/group_order_service.dart';
import 'package:buff_lisa/widgets/tiles/presentation/group_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:latlong2/latlong.dart';
import 'package:mutex/mutex.dart';
import 'package:posthog_flutter/posthog_flutter.dart';
import 'package:select_dialog/select_dialog.dart';
import 'package:uuid/uuid.dart';

class ImageUpload extends ConsumerStatefulWidget {
  const ImageUpload({super.key, required this.image, required this.position});

  final Uint8List image;
  final LatLng position;

  @override
  ConsumerState<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends ConsumerState<ImageUpload> {
  final _controller = TextEditingController();

  final Mutex _m = Mutex();
  late final int _groupIndexWhenOpened;

  @override
  void initState() {
    super.initState();
    _groupIndexWhenOpened = ref.read(cameraGroupIndexProvider);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final group = ref.watch(cameraSelectedGroupProvider);
    final bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
    return CustomCloseKeyboardScaffold(
      appBar: AppBar(
        title: const Text("Approve", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Card(
                      clipBehavior: Clip.antiAlias,
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.33,
                        alignment: Alignment.center,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.memory(
                            widget.image,
                            height: MediaQuery.of(context).size.height * 0.33,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                    if (group.value != null) Card(child: GroupTile(groupDto: group.value!, onTap: handleEdit)) else const Card(),
                    Card(
                      child: TextFormField(
                        controller: _controller,
                        minLines: 1,
                        maxLines: 10,
                        textInputAction: TextInputAction.newline,
                        decoration: const InputDecoration(
                          hintText: 'Add a description ...',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.multiline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
            Visibility(
            visible: !isKeyboardVisible,
            child:Padding(padding: const EdgeInsets.all(10), child:SubmitButton(onPressed: handleApprove, text: "Upload")),),
        ],
      ),
    );
  }


  Future<void> handleApprove() async {
    if (_m.isLocked) return;
    await _m.acquire();
    final group = await ref.watch(cameraSelectedGroupProvider.future);
    final pin = LocalPinDto(
        id: const Uuid().v4(),
        latitude: widget.position.latitude,
        longitude: widget.position.longitude,
        creationDate: DateTime.now(),
        description: _controller.text.isEmpty ? null : _controller.text,
        creatorId: ref.watch(globalDataServiceProvider).userId!,
        groupId: group.groupId,
        isHidden: false,);
    _m.release();
    final returnValue = await ref.read(pinServiceProvider(group.groupId).notifier).addPinToGroup(pin, widget.image);
    if (returnValue != null) {
      CustomErrorSnackBar.message(message: returnValue);
    } else {
      CustomErrorSnackBar.message(message: "Successfully synced to server",);
    }
    await Posthog().screen(screenName: "uploadPin", properties: {"result": returnValue != null, "error": returnValue?.toString() ?? ""});
    if (ref.read(appReviewStateProvider)) {
      ref.read(appReviewStateProvider.notifier).updateLastReviewDate();
      final InAppReview inAppReview = InAppReview.instance;
      if (await inAppReview.isAvailable()) {
        await inAppReview.requestReview();
      }
    }
    ref.read(cameraGroupIndexProvider.notifier).updateIndex(_groupIndexWhenOpened);
    if (!mounted) return;
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  Future<void> handleEdit() async {
    final groups = ref.read(groupOrderServiceProvider);
    await SelectDialog.showModal<String>(
      context,
      showSearchBox: false,
      label: const Text("Change Group"),
      selectedValue: groups[ref.watch(cameraGroupIndexProvider)],
      itemBuilder: (context, group, b) => GroupTile(groupDto: ref.read(userGroupServiceProvider).value!.firstWhere((e) => e.groupId == group),),
      items: groups,
      onChange: (group) {
        ref.read(cameraGroupIndexProvider.notifier).updateIndex(groups.indexOf(group));
      },
    );
  }
}
