
import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/entity/group_entity.dart';
import 'package:buff_lisa/data/entity/pin_entity.dart';
import 'package:buff_lisa/data/repository/global_data_repository.dart';
import 'package:buff_lisa/data/repository/group_repository.dart';
import 'package:buff_lisa/data/repository/pin_image_repository.dart';
import 'package:buff_lisa/data/repository/pin_repository.dart';
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/data/service/pin_service.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:flutter/foundation.dart';
import 'package:mutex/mutex.dart';
import 'package:openapi/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'syncing_service.g.dart';

@Riverpod(keepAlive: true)
class SyncingService extends _$SyncingService {

  late GroupsApi _groupsApi;
  late PinsApi _pinsApi;
  late GroupRepository _groupRepository;
  late PinRepository _pinRepository;
  final Mutex _mutex = Mutex();

  @override
  Future<bool> build() async {
    _groupsApi = ref.watch(groupApiProvider);
    _pinsApi = ref.watch(pinApiProvider);
    _groupRepository = ref.watch(groupRepositoryProvider);
    _pinRepository = ref.watch(pinRepositoryProvider);
    await syncGroups();
    return true;
  }

  Future<void> syncGroups() async {
    if (_mutex.isLocked) return;
    await _mutex.acquire();
    const key = GlobalDataRepository.lastSeenKey;
    final lastSeen = ref.read(lastSeenProvider(key));
    final userId = ref.watch(userIdProvider);
    try {
      final remoteGroups = await _groupsApi.getGroupsByIds(userId: userId, withUser: true, withImages: true, updatedAfter: lastSeen);
      for (final groupId in remoteGroups!.deleted) {
        await _groupRepository.delete(groupId);
      }
      for (final group in remoteGroups.items) {
        await _groupRepository.put(group.id, GroupEntity.fromGroupDto(group, keepAlive: true, isActivated: true));
      }
      ref.invalidate(userGroupServiceProvider);
      await syncOfflinePins();
      final groups = await _groupRepository.getAll();
      for (final group in groups) {
        syncPins(group.groupId, lastSeen); // run async
      }
      ref.read(lastSeenProvider(key).notifier).setLastSeenNow();
    } catch (e) {
      rethrow;
    } finally {
      _mutex.release();
    }
  }

  Future<void> syncPins(String groupId, DateTime? lastSeen) async {
    try {
      final remotePins = await _pinsApi.getPinImagesByIds(groupId: groupId, withImage: false, updatedAfter: lastSeen);
      for (final pinId in remotePins!.deleted) {
        await _pinRepository.delete(pinId);
      }
      for (final pin in remotePins.items) {
        await _pinRepository.put(pin.id, PinEntity.fromDto(pin, keepAlive: true));
      }
      ref.invalidate(pinServiceProvider(groupId));
    } catch (e) {
      if(kDebugMode) print(e);
    }
  }

  Future<void> syncOfflinePins() async {
    final offlinePin = (await _pinRepository.getAll()).where((e) => e.lastSynced == null);
    for (final pin in offlinePin) {
      final image = await ref.read(pinImageRepositoryProvider).get(pin.pinId);
      try {
        final newPin = await _pinsApi.createPin(pin.toRequestDto(image!.blob1!));
        await _pinRepository.put(newPin!.id, PinEntity.fromDto(newPin, keepAlive: true));
      } on ApiException catch(e) {
        if (e.code == 409) {
          await _pinRepository.delete(pin.pinId);
        }
      } catch (e) {
        if (kDebugMode) print(e);
        await _pinRepository.delete(pin.pinId);
      }
    }
  }

}
