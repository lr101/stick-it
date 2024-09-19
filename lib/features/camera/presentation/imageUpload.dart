
import 'dart:typed_data';

import 'package:buff_lisa/data/dto/pin_dto.dart';
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/data/service/pin_service.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:buff_lisa/data/service/user_service.dart';
import 'package:buff_lisa/features/camera/data/camera_state.dart';
import 'package:buff_lisa/widgets/round_image/presentation/round_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:mutex/mutex.dart';
import 'package:select_dialog/select_dialog.dart';
import 'package:uuid/uuid.dart';

import '../../../data/dto/group_dto.dart';
import '../../../widgets/custom_interaction/presentation/custom_error_snack_bar.dart';
import '../../../widgets/tiles/presentation/group_tile.dart';

class ImageUpload extends ConsumerStatefulWidget {
  const ImageUpload({super.key, required this.image, required this.position});

  final Uint8List image;
  final Position position;

  @override
  ConsumerState<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends ConsumerState<ImageUpload> {

  final TransformationController controller = TransformationController();

  Mutex _m = Mutex();

  @override
  Widget build(BuildContext context) {
    final global = ref.watch(globalDataServiceProvider);
    final userImage = ref.watch(profilePictureByIdProvider(global.userId!));
    return Scaffold(
      appBar: AppBar(
        title: Text("Approve"),

      ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2),
                            child: RoundImage(
                              size: 16,
                              imageCallback: userImage,
                              child: Container(),
                            ),
                          ),
                          Column(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 22,
                                child: FittedBox(fit: BoxFit.fitHeight, child: Text(global.username!)),
                              ),
                              SizedBox(
                                  height: 18,
                                  child: FittedBox(fit: BoxFit.fitHeight, child:  Text(
                                    ref.watch(cameraSelectedGroupProvider).name,
                                    style: const TextStyle(
                                        fontStyle: FontStyle.italic),
                                  )))
                            ],
                          )
                        ]),
                  ],
                ),
              ),
              Expanded(
                  child: InteractiveViewer(
                      panEnabled: false,
                      transformationController: controller,
                      boundaryMargin: const EdgeInsets.all(0),
                      onInteractionEnd: (ScaleEndDetails endDetails) {
                        controller.value = Matrix4.identity();
                      },
                      minScale: 1,
                      maxScale: 4,
                      child: Image.memory(widget.image)
                  )),
              const SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    heroTag: "editCameraImage",
                    onPressed: handleEdit,
                    child: const Icon(Icons.edit),
                  ),
                  FloatingActionButton(
                    heroTag: "uploadCameraImage",
                    onPressed: handleApprove,
                    child: const Icon(Icons.check),
                  )
                ],
              )
            ],
          ),
        )
    );
  }

  Future<void> handleApprove() async {
    if (_m.isLocked) return;
    await _m.acquire();
    final pin = LocalPinDto(
        id: const Uuid().v4() ,
        latitude: widget.position.latitude,
        longitude: widget.position.longitude,
        creationDate: DateTime.now(),
        image: widget.image,
        creatorId: ref.watch(globalDataServiceProvider).userId!,
        groupId: ref.watch(cameraSelectedGroupProvider).groupId,
        isHidden: false
    );
    final result = await ref.read(pinServiceProvider(ref.watch(cameraSelectedGroupProvider).groupId).notifier).addPinToGroup(pin);
    _m.release();
    if (result != null) {
      CustomErrorSnackBar.message(context: context, message: result);
      Navigator.pop(context);
    } else {
      Navigator.pop(context);
    }

  }


  Future<void> handleEdit() async {
    final groups = ref.watch(userGroupServiceProvider).value ?? [];
    await SelectDialog.showModal<LocalGroupDto>(
      context,
      showSearchBox: false,
      label: "Change Group",
      selectedValue: groups[ref.watch(cameraGroupIndexProvider)],
      itemBuilder: (context, group, b) => GroupTile(groupDto: group),
      items: groups,
      onChange: (group) {
        ref.read(cameraGroupIndexProvider.notifier).updateIndex(groups.indexOf(group));
      },
    );
  }

}