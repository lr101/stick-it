import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/entity/group_entity.dart';
import 'package:buff_lisa/data/entity/pin_entity.dart';
import 'package:buff_lisa/data/repository/image_repository.dart';
import 'package:buff_lisa/data/repository/pin_repository.dart';
import 'package:buff_lisa/data/repository/user_pins_repository.dart';
import 'package:buff_lisa/data/service/filter_service.dart';
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/data/service/group_service.dart';
import 'package:buff_lisa/data/service/view_service.dart';
import 'package:buff_lisa/widgets/custom_interaction/presentation/custom_error_snack_bar.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pin_service.g.dart';


@riverpod
class PinUserService extends _$PinUserService {

  late final IPinRepository _pinRepository;
  late final PinsApi _pinsApi;
  late final String _userId;

  @override
  Stream<List<PinEntity>> build(String userId) {
    final hiddenUsers = ref.watch(hiddenUserServiceProvider);
    final hiddenPosts = ref.watch(hiddenPostsServiceProvider);
    _pinRepository = ref.watch(pinRepositoryProvider);
    _pinsApi = ref.watch(pinApiProvider);
    _userId = ref.watch(userIdProvider);

    _remoteFetch();

    final pinStream = _pinRepository.getPinsByUser(userId);
    return pinStream.map((e) {
      e.removeWhere((e) => hiddenUsers.contains(e.creator) || hiddenPosts.contains(e.pinId));
      e.sort((a,b) => b.creationDate.compareTo(a.creationDate));
      return e;
    }); 
  }

  // update non-user pins
  Future<void> _remoteFetch() async {
    final stream = _pinRepository.getPinsByUser(_userId);
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
  final result = repo.watchById(pinId);
  if (await result.last == null) {
    final pin = await  ref.watch(pinApiProvider).getPin(pinId);
    await repo.put(PinEntity.fromDto(pin!, true));
  }
  yield* result;
}

@riverpod
class PinGroupServiceUnfiltered extends _$PinGroupServiceUnfiltered {

  late final IPinRepository _pinRepository;
  late final PinsApi _pinsApi;

  @override
  Stream<List<PinEntity>> build(String groupId) {
    _pinRepository = ref.watch(pinRepositoryProvider);
    _pinsApi = ref.watch(pinApiProvider);
    final userGroups = ref.watch(userGroupServiceProvider).value ?? [];

    Future.microtask(() => _remoteFetch(userGroups));

    return _pinRepository.getPinsByGroup(groupId);
  }


  // update non user groups
  Future<void> _remoteFetch(List<GroupEntity> userGroups) async {
    final stream = _pinRepository.getPinsByGroup(groupId);
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

@riverpod
Future<List<PinEntity>> pinGroupService(Ref ref, String groupId) async {
  final rawPinsAsync = ref.watch(pinGroupServiceUnfilteredProvider(groupId));
  final hiddenUsers = ref.watch(hiddenUserServiceProvider);
  final hiddenPosts = ref.watch(hiddenPostsServiceProvider);

  final pins = rawPinsAsync.value ?? [];

  return pins.where((pin) => 
    !hiddenUsers.contains(pin.creator) && 
    !hiddenPosts.contains(pin.pinId)
  ).toList();
}


@Riverpod(keepAlive: true)
PinService pinService(Ref ref) => PinService(ref: ref);

class PinService {

  final Ref ref;
  late final IPinRepository _pinRepository;
  late final IImageRepository _pinImageRepository;
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
      await _addPinToRemote(pin, image);
      await ref.read(userGroupServiceProvider.notifier).setIsActive(pin.groupId, true);
      if (showPrompt) CustomErrorSnackBar.message(message: "Succesfully uploaded", type: CustomErrorSnackBarType.success);
    } on ApiException catch (e) {
      if (!kIsWeb) {
        await _pinRepository.put(pin);
        await _pinImageRepository.addImage(pin.pinId, image, true);
        await ref.read(userGroupServiceProvider.notifier).setIsActive(pin.groupId, true);
      }
      if (showPrompt) CustomErrorSnackBar.message(message: "Uploading failed", type: CustomErrorSnackBarType.warning);
      return e.message;
    }
    return null;
  }
  
  Future<void> _addPinToRemote(PinEntity pin, Uint8List image) async {
    final result = await _pinsApi.createPin(pin.toRequestDto(image));
    final newPin = PinEntity.fromDto(result!, false);
    await _pinRepository.put(newPin);
  }

  Future<String?> deletePinFromGroup(String pinId) async {
    try {
      final pin = await _pinRepository.get(pinId);

      // only delete from remote server if its not marked as offline
      // keepAlive being  true means it is not synced to remote
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
AsyncValue<List<PinEntity>> sortedActivatedPins(Ref ref) {
  // Watch the groups. If they change, this whole function runs again.
  final groups = ref.watch(activeGroupsProvider).valueOrNull ?? {};
  final pins = <PinEntity>[];

  for (final group in groups) {
    final p = ref.watch(pinGroupServiceProvider(group.groupId)).valueOrNull ?? [];
    pins.addAll(p);
  }

  // Sort the newly combined list
  pins.sort((a, b) => b.creationDate.compareTo(a.creationDate));
  
  return AsyncData(pins);
}

@riverpod
Future<List<PinEntity>?> sortedGroupPins(Ref ref, String groupId) async {
  final pins = ref.watch(pinGroupServiceProvider(groupId)).value?.toList();
  if (pins == null) return null;
  pins.sort((a, b) => b.creationDate.compareTo(a.creationDate));
  return pins;
}
