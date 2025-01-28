
import 'package:buff_lisa/data/dto/group_dto.dart';
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:buff_lisa/widgets/group_selector/service/group_order_service.dart';
import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'camera_state.g.dart';

class CameraState {
  final double ratio;
  final double minZoom;
  final double maxZoom;

  CameraState({required this.ratio, required this.minZoom, required this.maxZoom});

}

@riverpod
class CameraIndex extends _$CameraIndex {

  @override
  int build() {
    return 0;
  }

  void increment() {
    state = (state + 1) % ref.watch(globalDataServiceProvider.select((t) => t.cameras)).length;
  }

  void setIndex(int index) {
    state = index;
  }

}

@riverpod
class CameraValues extends _$CameraValues {

  late final CameraController _controller;

  @override
  Future<CameraState> build(CameraController controller) async {
    _controller = controller;
    await _controller.initialize();
    return CameraState(
        ratio: _controller.value.aspectRatio,
        minZoom: await _controller.getMinZoomLevel(),
        maxZoom: await _controller.getMaxZoomLevel(),
    );
  }

  Future<void> updateCamera(int cameraIndex) async {
    state = const AsyncLoading();
    await _controller.setDescription(ref.read(globalDataServiceProvider).cameras[cameraIndex]);
    await _controller.initialize();
    state = AsyncData(CameraState(
        ratio: controller.value.aspectRatio,
        minZoom: await controller.getMinZoomLevel(),
        maxZoom: await controller.getMaxZoomLevel(),
    ),);
  }

}

@Riverpod(keepAlive: true)
class CameraGroupIndex extends _$CameraGroupIndex {

  @override
  int build() => 0;

  void updateIndex(int index) {
    state = index;
  }

}

@riverpod
Future<LocalGroupDto> cameraSelectedGroup(Ref ref) async {
  final groupIds = ref.watch(groupOrderServiceProvider);
  final groupCameraIndex = ref.watch(cameraGroupIndexProvider);
  return await ref.watch(groupByIdWithoutStateProvider(groupIds[groupCameraIndex]).future);
}

@riverpod
class CameraCapturing extends _$CameraCapturing {

  @override
  bool build() {
    return false;
  }

  void setCapturing(bool value) {
    state = value;
  }
}
