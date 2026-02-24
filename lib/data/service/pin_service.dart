import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/entity/group_entity.dart';
import 'package:buff_lisa/data/entity/pin_entity.dart';
import 'package:buff_lisa/data/repository/image_repository.dart';
import 'package:buff_lisa/data/repository/pin_repository.dart';
import 'package:buff_lisa/data/service/filter_service.dart';
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/data/service/group_service.dart';
import 'package:buff_lisa/data/service/view_service.dart';
import 'package:buff_lisa/widgets/custom_interaction/presentation/custom_error_snack_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:openapi/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pin_service.g.dart';


@riverpod
class PinUserService extends _$PinUserService {

  late final PinRepository _pinRepository;
  late final PinsApi _pinsApi;
  late final String _userId;

  @override
  Stream<List<PinEntity>> build(String userId) async* {
    final hiddenUsers = ref.watch(hiddenUserServiceProvider);
    final hiddenPosts = ref.watch(hiddenPostsServiceProvider);
    _pinRepository = ref.watch(pinRepositoryProvider);
    _pinsApi = ref.watch(pinApiProvider);
    _userId = ref.watch(userIdProvider);

    _remoteFetch();

    final pinStream = await _pinRepository.getPinsByUser(userId);
    yield* pinStream.map((e) {
      e.removeWhere((e) => hiddenUsers.contains(e.creator) || hiddenPosts.contains(e.pinId));
      e.sort((a,b) => b.creationDate.compareTo(a.creationDate));
      return e;
    }); 
  }

  // update non-user pins
  Future<void> _remoteFetch() async {
    final stream = await _pinRepository.getPinsByUser(_userId);
    final pins = await stream.first;
    final isUser = this.userId == _userId;
    if (pins.isEmpty && !isUser) {
      final remotePins = await _pinsApi.getPinImagesByIds(userId: this.userId, withImage: false);
      if (remotePins != null) {
        final pins = remotePins.items.map((e) => PinEntity.fromDto(e, true)).toList();
        await _pinRepository.putMultiple(pins);
      }
    }    
  }

}

@riverpod
Stream<PinEntity?> pinById(Ref ref, String pinId) async* {
  final repo = ref.watch(pinRepositoryProvider);
  final result = await repo.watchById(pinId);
  if (await result.last == null) {
    final pin = await  ref.watch(pinApiProvider).getPin(pinId);
    await repo.put(PinEntity.fromDto(pin!, true));
  }
  yield* result;
}

@riverpod
class PinGroupService extends _$PinGroupService {

  late final PinRepository _pinRepository;
  late final PinsApi _pinsApi;

  @override
  Stream<List<PinEntity>> build(String groupId) async* {
    final hiddenUsers = ref.watch(hiddenUserServiceProvider);
    final hiddenPosts = ref.watch(hiddenPostsServiceProvider);
    _pinRepository = ref.watch(pinRepositoryProvider);
    _pinsApi = ref.watch(pinApiProvider);
    final userGroups = ref.watch(userGroupServiceProvider).value ?? [];

    _remoteFetch(userGroups);

    final pinStream = await _pinRepository.getPinsByGroup(groupId);
    yield* pinStream.map((e) {
      e.removeWhere((e) => hiddenUsers.contains(e.creator) || hiddenPosts.contains(e.pinId));
      return e;
    });
  }


  // update non user groups
  Future<void> _remoteFetch(List<GroupEntity> userGroups) async {
    final stream = await _pinRepository.getPinsByGroup(groupId);
    final pins = await stream.first;
    final isUserGroup = userGroups.any((e) => e.groupId == groupId);
    if (pins.isEmpty && !isUserGroup) {
      final remotePins = await _pinsApi.getPinImagesByIds(groupId: groupId, withImage: false);
      if (remotePins != null) {
        final pins = remotePins.items.map((e) => PinEntity.fromDto(e, !isUserGroup)).toList();
        await _pinRepository.putMultiple(pins);
      }
    }
  }

}


@Riverpod(keepAlive: true)
PinService pinService(Ref ref) => PinService(ref: ref);

class PinService {

  final Ref ref;
  late final PinRepository _pinRepository;
  late final ImageRepository _pinImageRepository;
  late final PinsApi _pinsApi;

  PinService({required this.ref}) {
    _pinRepository = ref.watch(pinRepositoryProvider);
    _pinImageRepository = ref.watch(pinImageRepositoryProvider);
    _pinsApi = ref.read(pinApiProvider);
    ref.listen(userGroupServiceProvider, (_,__) => ());
  }

  Future<String?> addPinToGroup(PinEntity pin, Uint8List image, {bool showPrompt = false}) async {
    try {
      if (showPrompt) CustomErrorSnackBar.loadingMessage(message: "Uploading image");
      await _pinRepository.put(pin);
      await _pinImageRepository.addImage(pin.pinId, image, true);
      await ref.read(userGroupServiceProvider.notifier).setIsActive(pin.groupId, true);
      await _addPinToRemote(pin, image);
      if (showPrompt) CustomErrorSnackBar.message(message: "Succesfully uploaded", type: CustomErrorSnackBarType.success);
    } on ApiException catch (e) {
      if (showPrompt) CustomErrorSnackBar.message(message: "Uploading failed", type: CustomErrorSnackBarType.warning);
      return e.message;
    }
    return null;
  }
  
  Future<void> _addPinToRemote(PinEntity pin, Uint8List image) async {
    
    final result = await _pinsApi.createPin(pin.toRequestDto(image));
    final newPin = PinEntity.fromDto(result!, false);
    await _pinRepository.replacePin(pin.pinId, newPin);
  }

  Future<String?> deletePinFromGroup(String pinId) async {
    try {
      final pin = await _pinRepository.get(pinId);

      // only delete from remote server if its not marked as offline
      // keepAlive being true means it is not synced to remote
      if (pin != null && pin.keepAlive == false) {
        await _pinsApi.deletePin(pinId);
      }
      await _pinRepository.delete(pinId);
    } on ApiException catch (e) {
      return e.message;
    }
    return null;

  }

}

@riverpod
Future<Set<PinEntity>> activatedPins(Ref ref) async {
  final groups = await ref.watch(activeGroupsProvider.future);
  final pins = <PinEntity>{};
  for (final group in groups) {
    final p = await ref.watch(pinGroupServiceProvider(group.groupId).future);
    pins.addAll(p);
  }
  return pins;
}

@riverpod
Set<PinEntity> activatedPinsWithoutLoading(Ref ref) {
  final viewState = ref.watch(viewServiceProvider);
  final pins = <PinEntity>{};
  if (viewState == ViewState.group) {
    final groups = ref.watch(activeGroupsProvider).value ?? {};
    
    for (final group in groups) {
      final p = ref.watch(pinGroupServiceProvider(group.groupId)).value ?? [];
      pins.addAll(p);
    }
    
  } else {
    final userId = ref.watch(userIdProvider);
    final p = ref.watch(pinUserServiceProvider(userId)).value ?? [];
    pins.addAll(p);
  }
  return pins;
}

@riverpod
Future<List<PinEntity>> sortedActivatedPins(Ref ref) async {
  final value = ref.watch(activatedPinsProvider).value?.toList() ?? [];
  value.sort((a, b) => b.creationDate.compareTo(a.creationDate));
  return value;
}

@riverpod
Future<List<PinEntity>?> sortedGroupPins(Ref ref, String groupId) async {
  final pins = ref.watch(pinGroupServiceProvider(groupId)).value?.toList();
  if (pins == null) return null;
  pins.sort((a, b) => b.creationDate.compareTo(a.creationDate));
  return pins;
}
