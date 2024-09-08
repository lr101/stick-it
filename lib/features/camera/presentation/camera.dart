import 'dart:typed_data';

import 'package:buff_lisa/data/dto/group_dto.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:buff_lisa/features/camera/data/camera_state.dart';
import 'package:buff_lisa/widgets/round_image/presentation/round_image.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mutex/mutex.dart';
import 'package:snapping_page_scroll/snapping_page_scroll.dart';
import 'package:super_tooltip/super_tooltip.dart';

import '../../../data/service/global_data_service.dart';

class Camera extends ConsumerStatefulWidget {
  const Camera({super.key});

  @override
  ConsumerState<Camera> createState() => _CameraState();
}

class _CameraState extends ConsumerState<Camera> {

  final PageController pageController = PageController(viewportFraction: 0.3);
  late final CameraController controller;
  double scaleFactor = 1.0;
  double basScaleFactor = 1.0;
  final _m = Mutex();

  @override
  void initState() {
    super.initState();
    controller = CameraController(ref.read(globalDataServiceProvider).cameras[0], ResolutionPreset.medium, enableAudio: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // update torch mode
      ref.listen(globalDataServiceProvider.select((t) => t.cameraMode), (_, next) => controller.setFlashMode(next == 0 ? FlashMode.off : FlashMode.auto));
      // update selected camera and trigger reinitialization
      ref.listen(cameraIndexProvider, (_, next) async {
        await ref.read(cameraValuesProvider(controller).notifier).updateCamera(next);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(cameraValuesProvider(controller));
    final cameraIndex = ref.watch(cameraIndexProvider);
    final cameras = ref.watch(globalDataServiceProvider.select((t) => t.cameras));
    final cameraFlashMode = ref.read(globalDataServiceProvider.select((t) => t.cameraMode));
    final groups = ref.watch(userGroupServiceProvider).value ?? [];
    return Scaffold(appBar: null,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: state.when(
                      data: (data) => GestureDetector(
                            onDoubleTap: handleCameraChange,
                            onScaleStart: (_) => basScaleFactor = scaleFactor,
                            onScaleUpdate: handleZoom,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: CameraPreview(controller),
                            )
                        ),
                      error: (error, stackTrace) => Text(error.toString()),
                      loading: () =>  const Center(child: CircularProgressIndicator())
                  )
                ),
                Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: SizedBox(
                          height: 50,
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                    padding: const EdgeInsets.all(2.5),
                                    child: CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Colors.grey.withOpacity(0.5),
                                        child: Center(child: IconButton(
                                            onPressed: () => handleFlashChange(cameraFlashMode == 0 ? 1 : 0),
                                            icon: cameraFlashMode == 0 ? const Icon(Icons.flash_off) : const Icon(Icons.flash_auto)
                                        ),)
                                    )),
                              ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: cameras.length,
                                  itemBuilder: (context, index) => Padding(
                                      padding: const EdgeInsets.all(2.5),
                                      child: CircleAvatar(
                                          radius: 20,
                                          backgroundColor: cameraIndex == index ? Colors.grey.withOpacity(0.8) : Colors.grey.withOpacity(0.5),
                                          child: Center(child: IconButton(
                                              onPressed: handleCameraChange,
                                              icon: cameras[index].lensDirection == CameraLensDirection.back ? const Icon(Icons.landscape) : const Icon(Icons.person)
                                          ),)
                                      ))
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(2.5),
                                  child:CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.grey.withOpacity(0.5),
                                      child: Center(
                                          // child: SuperTooltip(
                                          //   controller: state.tooltipController,
                                          //   popupDirection: TooltipDirection.up,
                                          //   content: const Text("New: Upload an image with existing location metadata from your gallery"),
                                          //   child: GestureDetector(
                                          //     onTap: state.upload,
                                          //     onLongPress: () => state.tooltipController.showTooltip(),
                                          //     child: Container(child: const Icon(Icons.upload)),
                                          //   ),))
                                  ))
                              )
                            ],
                          ),
                        ))
                )
              ],
            ),
          ),
          SizedBox(
            height: (MediaQuery.of(context).size.height) * 0.15,
            child: Stack(
              children: [
                Center(
                  child: SnappingPageScroll(
                    controller: pageController,
                    onPageChanged: onPageChange,
                    children: groups.map(groupCard).toList(),
                    ),
                  ),
                IgnorePointer(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 3.0),
                      shape: BoxShape.circle,
                    ),
                    height: (MediaQuery.of(context).size.height) * 0.15,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 5,)
        ],
      ),
    );
  }

  Future<void> handleZoom(ScaleUpdateDetails scale) async {
    final state = ref.read(cameraValuesProvider(controller)).value;
    if (state != null) {
      if (scale.scale * basScaleFactor <= state.maxZoom && scale.scale * basScaleFactor >= state.minZoom) {
        scaleFactor = basScaleFactor * scale.scale;
        controller.setZoomLevel(scaleFactor);
      }
    }
  }

  void handleCameraChange() {
    ref.read(cameraIndexProvider.notifier).increment();
  }

  void handleFlashChange(int value) {
    ref.read(globalDataServiceProvider.notifier).setCameraMode(value);
  }

  void onPageChange(index) {
    ref.read(cameraGroupIndexProvider.notifier).updateIndex(index);
  }

  Widget groupCard(LocalGroupDto group) {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: GestureDetector(
            onTap: () => takePicture(group),
            child:  RoundImage(
              size: (MediaQuery.of(context).size.height) * 0.065,
              imageCallback: AsyncData(group.profileImage),
              clickable: false,
              child: Container(),
            )
        )
    );
  }

  Future<void> takePicture(LocalGroupDto group) async {
    if(group != ref.read(cameraGroupIndexProvider)) return;
    _m.protect(() async {
        try {
          final image = await controller.takePicture();
          Uint8List bytes = await image.readAsBytes();
          //await routeToCheckImage(bytes);
        } catch (e) {
          print(e);
        }
    });
  }

}