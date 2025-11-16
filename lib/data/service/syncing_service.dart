
import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/dto/local_user_dto.dart';
import 'package:buff_lisa/data/entity/group_entity.dart';
import 'package:buff_lisa/data/entity/pin_entity.dart';
import 'package:buff_lisa/data/repository/global_data_repository.dart';
import 'package:buff_lisa/data/repository/group_repository.dart';
import 'package:buff_lisa/data/repository/pin_image_repository.dart';
import 'package:buff_lisa/data/repository/pin_repository.dart';
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/data/service/pin_service.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:buff_lisa/data/service/user_service.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:mutex/mutex.dart';
import 'package:openapi/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'syncing_service.g.dart';

enum SyncState {
  init,
  syncing,
  finished,
  failed
}

@riverpod
class SyncingService extends _$SyncingService {

  late GroupsApi _groupsApi;
  late PinsApi _pinsApi;
  late GroupRepository _groupRepository;
  late PinRepository _pinRepository;
  late AsyncValue<LocalUserDto> _userService;
  late String userId;
  final Mutex _mutex = Mutex();
  final Logger _logger = Logger();


  @override
  SyncState build() {
    _groupsApi = ref.watch(groupApiProvider);
    _pinsApi = ref.watch(pinApiProvider);
    _groupRepository = ref.watch(groupRepositoryProvider);
    _pinRepository = ref.watch(pinRepositoryProvider);
    userId = ref.watch(userIdProvider);
    _userService = ref.watch(userServiceProvider(userId));
    return SyncState.init;
  }

  Future<void> syncToBackend() async {
    if (_mutex.isLocked || state != SyncState.init) return;
    await _mutex.acquire();
    state = SyncState.syncing;
    const key = GlobalDataRepository.lastSeenKey;
    final lastSeen = ref.read(lastSeenProvider(key));
    final userId = ref.watch(userIdProvider);
    try {
      _logger.i("Syncing groups of user $userId and lastSeen: $lastSeen");
      final remoteGroups = await _groupsApi.getGroupsByIds(userId: userId, withUser: true, withImages: true, updatedAfter: lastSeen);
      for (final groupId in remoteGroups!.deleted) {
        _logger.i("Trying to delete $groupId from local repo");
        await _groupRepository.delete(groupId);
      }
      for (final group in remoteGroups.items) {
        _logger.i("Trying to update $group in local repo");
        await _groupRepository.put(group.id, GroupEntity.fromGroupDto(group, keepAlive: true, isActivated: true));
      }
      ref.invalidate(userGroupServiceProvider);
      await syncOfflinePins();
      final groups = await _groupRepository.getAll();
      for (final group in groups) {
        syncPins(group.groupId, lastSeen); // run async
      }
      ref.read(lastSeenProvider(key).notifier).setLastSeenNow();
      await ref.read(userServiceProvider(ref.read(userIdProvider)).notifier).updateRemote();
      state = SyncState.finished;
      _logger.i("Successfully finished syncing");
    } catch (e) {
      state = SyncState.failed;
      _logger.i("Failed syncing with error: $e");
    } finally {
      _mutex.release();
    }
  }

  Future<void> syncPins(String groupId, DateTime? lastSeen) async {
    try {
      final remotePins = await _pinsApi.getPinImagesByIds(groupId: groupId, withImage: false, updatedAfter: lastSeen);
      for (final pinId in remotePins!.deleted) {
        _logger.i("Trying to delete pin $pinId from local repo");
        await _pinRepository.delete(pinId);
      }
      for (final pin in remotePins.items) {
        _logger.i("Trying to update pin $pin in local repo");
        await _pinRepository.put(pin.id, PinEntity.fromDto(pin, keepAlive: true));
      }
      await ref.read(pinServiceProvider(groupId).notifier).refreshRepo();
    } catch (e) {
      if(kDebugMode) print(e);
    }
  }

  Future<void> syncOfflinePins() async {
    final offlinePins = (await _pinRepository.getAll()).where((e) => e.lastSynced == null);
    for (final pin in offlinePins) {
      final image = await ref.read(pinImageRepositoryProvider).offlineImage(pin.pinId);
      try {
        _logger.i("Trying to sync $pin to online backend");
        final newPin = await _pinsApi.createPin(pin.toRequestDto(image!));
        await _pinRepository.put(newPin!.id, PinEntity.fromDto(newPin, keepAlive: true));
        await _pinRepository.delete(pin.pinId);
      } on ApiException catch(e) {
        if (e.code == 409) {
          _logger.i("Pin $pin already exists on online backend");
          await _pinRepository.delete(pin.pinId);
        }
      } catch (e) {
        if (kDebugMode) print(e);
      }
    }
  }

}
