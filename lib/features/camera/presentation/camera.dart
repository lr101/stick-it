import 'dart:typed_data';

import 'package:buff_lisa/data/dto/group_dto.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:buff_lisa/features/camera/data/camera_state.dart';
import 'package:buff_lisa/features/camera/presentation/imageUpload.dart';
import 'package:buff_lisa/util/routing/routing.dart';
import 'package:buff_lisa/widgets/round_image/presentation/round_image.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    // update torch mode
    ref.listen(cameraTorchProvider, (_, next) => controller.setFlashMode(next ? FlashMode.off : FlashMode.auto));
    // update selected camera and trigger reinitialization
    ref.listen(cameraIndexProvider, (_, next) async {
      await ref.read(cameraValuesProvider(controller).notifier).updateCamera(next);
    });
    final state = ref.watch(cameraValuesProvider(controller));
    final cameraIndex = ref.watch(cameraIndexProvider);
    final cameras = ref.watch(globalDataServiceProvider.select((t) => t.cameras));
    final cameraFlashMode = ref.watch(cameraTorchProvider);
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
                    padding: const EdgeInsets.only(bottom: 75),
                    child: ref.watch(cameraCapturingProvider) ? Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).highlightColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(padding: const EdgeInsets.all(5),
                      child:  Text("Hold steady capturing ...") ,
                      )
                    ) : SizedBox.shrink()
                )),
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
                                            onPressed: () => handleFlashChange(!cameraFlashMode),
                                            icon: cameraFlashMode ? const Icon(Icons.flash_off) : const Icon(Icons.flash_auto)
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
                    children: List.generate(groups.length, (index) => groupCard(groups[index], index)),
                    ),
                  ),
                Center(child: IgnorePointer(
                  child: Container(
                    padding: EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 5.0,
                        color: Theme.of(context).focusColor
                      ),
                      shape: BoxShape.circle,
                    ),
                    height: (MediaQuery.of(context).size.height) * 0.07 * 2,
                  ),
                ))
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

  void handleFlashChange(bool value) {
    ref.read(cameraTorchProvider.notifier).setTorch(value);
  }

  void onPageChange(index) {
    ref.read(cameraGroupIndexProvider.notifier).updateIndex(index);
  }

  Widget groupCard(LocalGroupDto group, int index) {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: GestureDetector(
            onTap: () => takePicture(group, index),
            child:  RoundImage(
              size: (MediaQuery.of(context).size.height) * 0.065,
              imageCallback: AsyncData(group.profileImage),
              clickable: false,
              child: Container(),
            )
        )
    );
  }

  Future<void> takePicture(LocalGroupDto group, int index) async {
    if(group.groupId != ref.read(cameraSelectedGroupProvider).groupId) {
      pageController.animateToPage(index, duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
      return;
    }
    if (_m.isLocked) return;
    await _m.acquire();
    ref.read(cameraCapturingProvider.notifier).setCapturing(true);
      try {
        final image = await controller.takePicture();
        Uint8List bytes = await image.readAsBytes();
        Position position = await Geolocator.getCurrentPosition();
        Routing.to(context, ImageUpload(image: bytes, position: position));
      } catch (e) {
        print(e);
      } finally {
        _m.release();
        ref.read(cameraCapturingProvider.notifier).setCapturing(false);
      }
  }

}