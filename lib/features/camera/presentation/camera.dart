
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/data/service/image_service.dart';
import 'package:buff_lisa/features/camera/data/camera_state.dart';
import 'package:buff_lisa/widgets/custom_interaction/presentation/custom_error_snack_bar.dart';
import 'package:buff_lisa/widgets/group_selector/service/group_order_service.dart';
import 'package:buff_lisa/widgets/round_image/presentation/custom_image_picker.dart';
import 'package:buff_lisa/widgets/round_image/presentation/round_image.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:latlong2/latlong.dart';
import 'package:mutex/mutex.dart';
import 'package:native_exif/native_exif.dart';
import 'package:snapping_page_scroll/snapping_page_scroll.dart';

class Camera extends ConsumerStatefulWidget {
  const Camera({super.key});

  @override
  ConsumerState<Camera> createState() => _CameraState();
}

class _CameraState extends ConsumerState<Camera>  with WidgetsBindingObserver {

  final PageController pageController = PageController(viewportFraction: 0.3);
  double scaleFactor = 1.0;
  double basScaleFactor = 1.0;
  final _m = Mutex();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    pageController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    final route = ModalRoute.of(context);
    if (route?.isCurrent ?? false) {
      final controller = ref.read(cameraControllerProvider).value;
      if (controller != null && controller.value.isInitialized) {
        controller.resumePreview();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(cameraTorchProvider, (_, next) {
      ref.read(cameraControllerProvider).value?.setFlashMode(next ? FlashMode.off : FlashMode.auto);
    });
    final controllerAsync = ref.watch(cameraControllerProvider);
    final cameraStateAsync = ref.watch(cameraValuesProvider);
    final cameraIndex = ref.watch(cameraIndexProvider);
    final cameras = ref.watch(globalDataServiceProvider.select((t) => t.cameras));
    final cameraFlashMode = ref.watch(cameraTorchProvider);
    final groupIds = ref.watch(groupOrderServiceProvider);
    return Scaffold(body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  // We handle the AsyncValue of the CONTROLLER here
                  child: controllerAsync.when(
                    loading: () => const Center(child: CircularProgressIndicator()),
                    error: (err, stack) => Center(child: Text("Camera Error: $err")),
                    data: (controller) {
                      // Once controller is ready, we check the Values state
                      return cameraStateAsync.when(
                        loading: () => const Center(child: CircularProgressIndicator()),
                        error: (err, stack) => Text(err.toString()),
                        data: (cameraState) => GestureDetector(
                          onDoubleTap: ref.read(cameraIndexProvider.notifier).increment,
                          onScaleStart: (_) => basScaleFactor = scaleFactor,
                          onScaleUpdate: (details) => handleZoom(details, controller, cameraState),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: CameraPreview(controller),
                          ),
                        ),
                      );
                    },
                  ),
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
                      child: const Padding(padding: EdgeInsets.all(5),
                      child:  Text("Hold steady capturing ...") ,
                      ),
                    ) : const SizedBox.shrink(),
                ),),
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
                                        backgroundColor: Colors.grey.withValues(alpha: 0.5),
                                        child: Center(child: IconButton(
                                            onPressed: () => handleFlashChange(!cameraFlashMode),
                                            icon: cameraFlashMode ? const Icon(Icons.flash_off) : const Icon(Icons.flash_auto),
                                        ),),
                                    ),),
                              ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: cameras.length,
                                  itemBuilder: (context, index) => Padding(
                                      padding: const EdgeInsets.all(2.5),
                                      child: CircleAvatar(
                                          radius: 20,
                                          backgroundColor: cameraIndex == index ? Colors.grey.withValues(alpha: 0.8) : Colors.grey.withValues(alpha: 0.5),
                                          child: Center(child: IconButton(
                                              onPressed: () => handleCameraChange(index),
                                              icon: cameras[index].lensDirection == CameraLensDirection.back ? const Icon(Icons.landscape) : const Icon(Icons.person),
                                          ),),
                                      ),),
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(2.5),
                                  child:CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.grey.withValues(alpha: 0.5),
                                      child: Center(
                                          child: GestureDetector(
                                             onTap: uploadFileImage,
                                             child: const Icon(Icons.upload),
                                             ),),
                                  ),
                              ),
                            ],
                          ),
                        ),),
                ),
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
                    children: List.generate(groupIds.length, (index) => groupCard(groupIds[index], index)),
                    ),
                  ),
                Center(child: IgnorePointer(
                  child: Container(
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 5.0,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      shape: BoxShape.circle,
                    ),
                    height: (MediaQuery.of(context).size.height) * 0.07 * 2,
                  ),
                ),),
              ],
            ),
          ),
          const SizedBox(height: 5,),
        ],
      ),
    );
  }

  Future<void> handleZoom(ScaleUpdateDetails scale, CameraController controller, CameraState state) async {
    if (scale.scale * basScaleFactor <= state.maxZoom && scale.scale * basScaleFactor >= state.minZoom) {
      scaleFactor = basScaleFactor * scale.scale;
      await controller.setZoomLevel(scaleFactor);
    }
  }


  Future<void> uploadFileImage() async {
    final pickedFile = await CustomImagePicker.pick(context: context);

    if (pickedFile != null && mounted) {
      final controller = ref.read(cameraControllerProvider).value;
      try {
        // Pause preview while another screen is placed on top
        if (controller != null && controller.value.isInitialized) {
          await controller.pausePreview().catchError((_) {});
        }
        final croppedImage = await CustomImagePicker.crop(res: pickedFile, minHeight: 500, minWidth: 500, context: context, initAspectRatio: const CropAspectRatio(ratioX: 3, ratioY: 4));
        final exif = await Exif.fromPath(pickedFile.path);
        final coord = await exif.getLatLong();
        if (!mounted ) return;
        context.pushNamed('selectLocation', queryParameters: {"lat": coord?.latitude, "long": coord?.longitude}, extra: croppedImage);
      } catch (e) {
        CustomErrorSnackBar.message(message: "Could not load or crop image");
        debugPrint(e.toString());
      }
    }
  }

  void handleCameraChange(int index) {
    ref.read(cameraIndexProvider.notifier).setIndex(index);
  }

  void handleFlashChange(bool value) {
    ref.read(cameraTorchProvider.notifier).setTorch(value);
  }

  void onPageChange(int index) {
    ref.read(cameraGroupIndexProvider.notifier).updateIndex(index);
  }

  Widget groupCard(String groupId, int index) {
    return Center(child: Padding(
        padding: const EdgeInsets.all(5),
        child: GestureDetector(
            onTap: () => takePicture(groupId, index),
            child:  RoundImage(
              size: (MediaQuery.of(context).size.height) * 0.06,
              imageCallback: ref.watch(groupProfilePictureByIdProvider(groupId)),
              child: Container(),
            ),
        ),),
    );
  }

  Future<void> takePicture(String groupId, int index) async {
    final indexProvider = ref.read(cameraGroupIndexProvider);
    if(index != indexProvider) {
      pageController.animateToPage(index, duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
      return;
    }
    final controller = ref.read(cameraControllerProvider).value;
    if (_m.isLocked || controller == null) return;
    await _m.acquire();
    ref.read(cameraCapturingProvider.notifier).setCapturing(true);
      try {
        final image = await controller.takePicture();
        final Uint8List bytes = await image.readAsBytes();
        final Position position = await Geolocator.getCurrentPosition();
        final pos = LatLng(position.latitude, position.longitude);
        // Pause preview while the ImageUpload screen is on top
        if (controller.value.isInitialized) {
          await controller.pausePreview().catchError((_) {});
        }
        if (!mounted) return;
        context.pushNamed('imageUpload', queryParameters: {"lat": pos.latitude.toString(), "long": pos.longitude.toString()}, extra: bytes);
      } catch (e) {
        if(kDebugMode) print(e);
      } finally {
        _m.release();
        ref.read(cameraCapturingProvider.notifier).setCapturing(false);
      }
  }

}
