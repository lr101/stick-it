import 'dart:convert';

import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/dto/pin_dto.dart';
import 'package:buff_lisa/data/repository/group_repository.dart';
import 'package:buff_lisa/data/service/filter_service.dart';
import 'package:buff_lisa/data/service/pin_image_service.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:buff_lisa/features/map_home/data/map_state.dart';
import 'package:buff_lisa/widgets/custom_interaction/presentation/custom_error_snack_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:mutex/mutex.dart';
import 'package:openapi/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repository/global_data_repository.dart';
import '../repository/pin_repository.dart';
import 'global_data_service.dart';

part 'pin_service.g.dart';

@Riverpod(keepAlive: true)
class PinService extends _$PinService {
  late PinRepository _pinRepository;
  final Mutex _mutex = Mutex();

  @override
  Future<List<LocalPinDto>> build(String groupId) async {
    final isUserGroup = (await ref.watch(groupRepositoryProvider).getGroupById(groupId)) != null;
    _pinRepository = ref.watch(pinRepositoryProvider);
    final pinsApi = ref.watch(pinApiProvider);
    final hiddenUsers = ref.watch(hiddenUserServiceProvider);
    final hiddenPosts = ref.watch(hiddenPostsServiceProvider);
    if (isUserGroup) {
      final localPins = await _pinRepository.getPinsOfGroup(groupId);
      localPins.removeWhere((e) => hiddenUsers.contains(e.creatorId) || hiddenPosts.contains(e.id));
      sync();
      return localPins;
    } else {
      final remotePins = await pinsApi.getPinImagesByIds(groupId: groupId, withImage: false);
      final localPins = remotePins!.items.map((e) => LocalPinDto.fromDtoWithImage(e)).toList();
      localPins.removeWhere((e) => hiddenUsers.contains(e.creatorId) || hiddenPosts.contains(e.id));
      return localPins;
    }
  }

  Future<void> sync() async {
    final key = GlobalDataRepository.lastSeenPinKey + groupId;
    final lastSeen = ref.read(lastSeenProvider(key));
    final pinsApi = ref.watch(pinApiProvider);
    if (_mutex.isLocked) return;
    await _mutex.acquire();
    final localPins = state.value ?? [];
    final storedState = [...state.value!];
    try {
      final remotePins = await pinsApi.getPinImagesByIds(groupId: groupId, withImage: false, updatedAfter: lastSeen);
      // sync local pins to server
      for (int i = 0 ; i < storedState.length; i++) {
        await _syncOfflineToOnline(storedState[i], localPins, pinsApi);
      }
      final mergedState = await _mergeGroups(localPins, remotePins!);
      state = AsyncData(mergedState);
      ref.read(lastSeenProvider(key).notifier).setLastSeenNow();
    } catch (e) {
      if (kDebugMode) print(e);
    } finally {
      _mutex.release();
      if (kDebugMode) print("synced ${state.value!.length} pins of group $groupId");
    }
  }

  Future<bool> _syncOfflineToOnline(LocalPinDto pin, List<LocalPinDto> localPins, PinsApi pinsApi) async {
    if (pin.lastSynced == null) {
      try {
        final newPin = await pinsApi.createPin(pin.toPinRequestDto(base64Encode(await ref.watch(pinImageServiceProvider.selectAsync((e) => e[pin.id]!)))));
        localPins.remove(pin);
        _pinRepository.updateToSynced(LocalPinDto.fromDtoWithImage(newPin!), pin.id);
      } on ApiException catch (e) {
        if (e.code == 409) {
          if (kDebugMode) print("Pin already synced -- remove from list");
          _pinRepository.deletePinFromGroup(pin.id);
        } else {
          if (kDebugMode) print("Sync failed for pin ${pin.id} with message ${e.message}");
          return false;
        }
      }
    }
    return true;
  }

  Future<List<LocalPinDto>> _mergeGroups(List<LocalPinDto> localPins, PinsSyncDto remotePins) async  {
    Map<String, LocalPinDto> localPinMap = {for (var pin in localPins) pin.id: pin};
    localPinMap.removeWhere((k,v) => remotePins.deleted.contains(k));
    final hiddenUsers = ref.watch(hiddenUserServiceProvider);
    final hiddenPosts = ref.watch(hiddenPostsServiceProvider);
    for (var pin in remotePins.items) {
      final p = LocalPinDto.fromDtoWithImage(pin);
      _pinRepository.createOrUpdate(p);
      if (hiddenUsers.contains(p.creatorId) || hiddenPosts.contains(p.id)) continue;
      localPinMap[pin.id] = p;
    }
    for (var pin in remotePins.deleted) {
      await _pinRepository.deletePinFromGroup(pin);
    }
    return localPinMap.values.toList();
  }

  // Optimized state update function
  Future<void> updateSinglePin(LocalPinDto updatedPin, {String? oldPinId}) async {
    await _mutex.protect(() async {
      final id = oldPinId ?? updatedPin.id;
      final currentState = state.value ?? [];
      final index = currentState.indexWhere((pin) => pin.id == id);
      if (index != -1) {
        final updatedState = [...currentState];
        updatedState[index] = updatedPin;
        state = AsyncValue.data(updatedState);
      } else {
        state = AsyncValue.data([...currentState, updatedPin]);
      }
    });
  }

  Future<String?> addPinToGroup(LocalPinDto pin, Uint8List image) async {
    try {
      await _pinRepository.createOrUpdate(pin);
      await ref.read(pinImageServiceProvider.notifier).addOfflineImage(pin.id, image);
      await updateSinglePin(pin);
      ref.read(groupRepositoryProvider).addPoint(pin.creatorId, pin.groupId);
      ref.read(userGroupServiceProvider.notifier).setIsActive(groupId, true);
      final pinsApi = ref.read(pinApiProvider);
      final result = await pinsApi.createPin(pin.toPinRequestDto(base64Encode(image)));
      if (result != null) {
        final newPin = LocalPinDto.fromDto(result);
        await updateSinglePin(newPin, oldPinId: pin.id);
        _pinRepository.updateToSynced(newPin, pin.id);
        await ref.read(pinImageServiceProvider.notifier).addImage(newPin.id, removeKeepAlive: true);
        return null;
      } else {
        return 'Failed to add pin to group';
      }
    } on ApiException catch (e) {
      return e.message;
    }
  }

  Future<String?> deletePinFromGroup(String pinId) async {
    try {
      final pin = (state.value ?? []).firstWhere((pin) => pin.id == pinId);
      if (pin.lastSynced != null) {
        final pinsApi = ref.watch(pinApiProvider);
        await pinsApi.deletePin(pinId);
      }
      await _mutex.protect(() async {
        final currentState = state.value ?? [];
        currentState.removeWhere((pin) => pin.id == pinId);
        state = AsyncValue.data(currentState);
      });
      await _pinRepository.deletePinFromGroup(pinId);
      ref.watch(groupRepositoryProvider).removePoint(ref.watch(globalDataServiceProvider).userId!, groupId);
      return null;
    } on ApiException catch (e) {
      return e.message;
    }
  }

}

@riverpod
AsyncValue<List<LocalPinDto>> activatedPins(Ref ref) {
  final groups = ref.watch(activeGroupsProvider);
  if (groups.isLoading) return AsyncLoading();
  final pins = <LocalPinDto>[];
  for (var group in groups.value ?? []) {
    final p = ref.watch(pinServiceProvider(group.groupId)).value ?? [];
    pins.addAll(p);
  }
  return AsyncData(pins);
}

@riverpod
AsyncValue<List<LocalPinDto>> activatedPinsWithoutLoading(Ref ref) {
  final groups = ref.watch(activeGroupsProvider);
  final pins = <LocalPinDto>[];
  for (var group in groups.value ?? []) {
    final p = ref.watch(pinServiceProvider(group.groupId)).value ?? [];
    pins.addAll(p);
  }
  return AsyncData(pins);
}

@riverpod
Future<List<LocalPinDto>> sortedActivatedPins(Ref ref) async {
  final value = ref.watch(activatedPinsProvider).value ?? [];
  value.sort((a, b) => b.creationDate.compareTo(a.creationDate));
  return value;
}

@riverpod
Future<List<LocalPinDto>?> sortedGroupPins(Ref ref, String groupId) async {
  final pins = ref.watch(pinServiceProvider(groupId)).value;
  if (pins == null) return null;
  pins.sort((a, b) => b.creationDate.compareTo(a.creationDate));
  return pins;
}

@riverpod
Future<List<LocalPinDto>> sortedUserPins(Ref ref) async {
  final userId = ref.watch(globalDataServiceProvider).userId!;
  final groups = await ref.watch(userGroupServiceProvider.selectAsync((e) => e.map((e) => e.groupId)));
  final pins = <LocalPinDto>[];
  for (var groupId in groups) {
    final p = await ref.watch(pinServiceProvider(groupId).selectAsync(((data) => data.where((e) => e.creatorId == userId))));
    pins.addAll(p);
  }
  pins.sort((a, b) => b.creationDate.compareTo(a.creationDate));
  return pins;
}

@riverpod
AsyncValue<List<MapEntry<LocalPinDto, double>>> pinsSortedByDistance(Ref ref) {
  Distance d = Distance();
  final value = ref.watch(activatedPinsProvider);
  if (value.isLoading) return AsyncLoading();
  if (value.value == null) return AsyncData([]);
  return ref.watch(currentLocationProvider).when(
    data: (data) {
      final latlong = LatLng(data.latitude, data.longitude);
      final pins = value.value ?? [];
      final pinsWithDistance = pins.map((e) => MapEntry(e, d.distance(latlong, LatLng(e.latitude, e.longitude)))).toList();
      pinsWithDistance.sort((a, b) => a.value.compareTo(b.value));
      return AsyncData(pinsWithDistance);
    },
    error: (error, stackTrace) => AsyncValue.error(error, stackTrace),
    loading: () => AsyncLoading(),
  );
}
