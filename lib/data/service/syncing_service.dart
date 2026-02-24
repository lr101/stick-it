
import 'dart:ffi';

import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/entity/pin_entity.dart';
import 'package:buff_lisa/data/repository/global_data_repository.dart';
import 'package:buff_lisa/data/repository/group_repository.dart';
import 'package:buff_lisa/data/repository/image_repository.dart';
import 'package:buff_lisa/data/repository/pin_repository.dart';
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/data/service/group_service.dart';
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
  late String userId;
  final Mutex _mutex = Mutex();
  final Logger _logger = Logger();


  @override
  SyncState build() {
    ref.listen(userGroupServiceProvider, (_,__) => ());
    _groupsApi = ref.watch(groupApiProvider);
    _pinsApi = ref.watch(pinApiProvider);
    _groupRepository = ref.watch(groupRepositoryProvider);
    _pinRepository = ref.watch(pinRepositoryProvider);
    userId = ref.watch(userIdProvider);
    // ignore: unused_local_variable
    final user = ref.watch(userServiceProvider(userId)); // keep provider alive
    return SyncState.init;
  }

  void toInit() {
    state = SyncState.init;
  }

  Future<void> syncToBackend() async {
    if (_mutex.isLocked || state != SyncState.init) return;
    await _mutex.acquire();
    state = SyncState.syncing;
    const key = GlobalDataRepository.lastSeenKey;
    final lastSeen = ref.read(lastSeenProvider(key));
    final userId = ref.read(userIdProvider);
    try {
      _logger.i("Syncing groups of user $userId and lastSeen: $lastSeen");
      await ref.read(userGroupServiceProvider.notifier).sync(lastSeen);
      await syncOfflinePins();
      final groups = await _groupRepository.getAll();
      for (final group in groups) {
        syncPins(group.groupId, lastSeen); // run async
      }
      ref.read(lastSeenProvider(key).notifier).setLastSeenNow();
      state = SyncState.finished;
      _logger.i("Successfully finished syncing");
    } catch (e) {
      state = SyncState.failed;
      _logger.i("Failed syncing with error: $e");
      rethrow;
    } finally {
      _mutex.release();
    }
  }

  Future<void> syncPins(String groupId, DateTime? lastSeen) async {
    try {
      final remotePins = await _pinsApi.getPinImagesByIds(groupId: groupId, withImage: false, updatedAfter: lastSeen);
      if (remotePins != null) {
        await _pinRepository.deleteMultiple(remotePins.deleted);
        await _pinRepository.putMultiple(remotePins.items.map((e) => PinEntity.fromDto(e, false)));
      }
    } catch (e) {
      if(kDebugMode) print(e);
    }
  }

  Future<void> syncOfflinePins() async {
    final offlinePins = (await _pinRepository.getAll()).where((e) => e.lastSynced == null);
    for (final pin in offlinePins) {
      final image = await ref.read(pinImageRepositoryProvider).fetchImage(pin.pinId, true);
      try {
        _logger.i("Trying to sync $pin to online backend");
        final newPin = await _pinsApi.createPin(pin.toRequestDto(image!));
        await _pinRepository.put(PinEntity.fromDto(newPin!, false, keepAlive: true));
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
