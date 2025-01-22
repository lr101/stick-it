import 'dart:convert';

import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/dto/pin_dto.dart';
import 'package:buff_lisa/data/entity/pin_entity.dart';
import 'package:buff_lisa/data/repository/group_repository.dart';
import 'package:buff_lisa/data/repository/pin_image_repository.dart';
import 'package:buff_lisa/data/service/filter_service.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:buff_lisa/features/map_home/data/map_state.dart';
import 'package:buff_lisa/util/core/cache_api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:mutex/mutex.dart';
import 'package:openapi/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../repository/pin_repository.dart';
import 'global_data_service.dart';

part 'pin_service.g.dart';

@riverpod
class PinService extends _$PinService {
  late PinRepositoryApi _pinRepository;
  final Mutex _mutex = Mutex();

  /// returns cached pins by groupId
  /// If pins do not exists AND the current user is not a member, they are fetched from the server
  /// Pins of a group that the current user is a member of are synced by the SyncingService
  @override
  Future<Set<LocalPinDto>> build(String groupId) async {
    final isUserGroup = (await ref.watch(groupRepositoryProvider).get(groupId)) != null;
    _pinRepository = isUserGroup ? ref.watch(pinRepositoryProvider) : ref.watch(otherPinRepositoryProvider);
    final hiddenUsers = ref.watch(hiddenUserServiceProvider);
    final hiddenPosts = ref.watch(hiddenPostsServiceProvider);
    Set<LocalPinDto> localPins = await _pinRepository.getPinsByGroup(groupId);
    if (isUserGroup && localPins.isEmpty) {
      localPins = await _fetchOtherUserGroupPins();
    }
    localPins.removeWhere((e) => hiddenUsers.contains(e.creatorId) || hiddenPosts.contains(e.id));
    return localPins;
  }
  
  Future<Set<LocalPinDto>> _fetchOtherUserGroupPins() async {
    final pinsApi = ref.watch(pinApiProvider);
    final remotePins = await pinsApi.getPinImagesByIds(groupId: groupId, withImage: false);
    final localPins = remotePins!.items.map((e) => LocalPinDto.fromDtoWithImage(e)).toSet();
    final storage = (_pinRepository as CacheApi<PinEntity>);
    final map = <String, PinEntity>{};
    for (final pin in remotePins.items) {
      map[pin.id] = PinEntity.fromDto(pin);
    }
    storage.putMultiple(map);
    return localPins;
  }
  
  Future<void> updateSinglePin(LocalPinDto? oldPin, LocalPinDto updatedPin) async {
    final storage = (_pinRepository as CacheApi<PinEntity>);
    await _mutex.protect(() async {
      final currentState = {...state.value!};
      currentState.remove(oldPin);
      currentState.add(updatedPin);
      state = AsyncData(currentState);
      if (oldPin != null) await storage.delete(oldPin.id);
      await storage.put(updatedPin.id, updatedPin.toEntityCompanion(keepAlive: true));
    });
  }

  Future<String?> addPinToGroup(LocalPinDto pin, Uint8List image) async {
    final pinImageRepo = ref.read(pinImageRepositoryProvider);
    try {
      await updateSinglePin(null, pin);
      await pinImageRepo.addOfflineImage(pin.id, image);
      ref.read(userGroupServiceProvider.notifier).setIsActive(groupId, true);
      await _addPinToRemote(pin, image, pinImageRepo);
    } on ApiException catch (e) {
      return e.message;
    }
    return null;
  }
  
  Future<void> _addPinToRemote(LocalPinDto pin, Uint8List image, PinImageRepository pinImageRepo) async {
    final pinsApi = ref.read(pinApiProvider);
    final result = await pinsApi.createPin(pin.toPinRequestDto(base64Encode(image)));
    final newPin = LocalPinDto.fromDto(result!);
    updateSinglePin(pin, newPin);
    await pinImageRepo.delete(pin.id);
  }

  Future<String?> deletePinFromGroup(String pinId) async {
    final pinsApi = ref.watch(pinApiProvider);
    final storage = (_pinRepository as CacheApi<PinEntity>);
    try {
      final pin = state.value!.firstWhere((e) => e.id == pinId);
      if (pin.lastSynced != null) {
        await pinsApi.deletePin(pinId);
      }
      await _mutex.protect(() async {
        final currentState = {...state.value!};
        currentState.remove(pin);
        state = AsyncValue.data(currentState);
      });
      storage.delete(pinId);
    } on ApiException catch (e) {
      return e.message;
    }
    return null;
  }

}

@riverpod
Future<Set<LocalPinDto>> activatedPins(Ref ref) async {
  final groups = await ref.watch(activeGroupsProvider.future);
  final pins = <LocalPinDto>{};
  for (var group in groups) {
    final p = await ref.watch(pinServiceProvider(group.groupId).future);
    pins.addAll(p);
  }
  return pins;
}

@riverpod
Set<LocalPinDto> activatedPinsWithoutLoading(Ref ref) {
  final groups = ref.watch(activeGroupsProvider).value ?? {};
  final pins = <LocalPinDto>{};
  for (var group in groups) {
    final p = ref.watch(pinServiceProvider(group.groupId)).value ?? {};
    pins.addAll(p);
  }
  return pins;
}

@riverpod
Future<List<LocalPinDto>> sortedActivatedPins(Ref ref) async {
  final value = ref.watch(activatedPinsProvider).value?.toList() ?? [];
  value.sort((a, b) => b.creationDate.compareTo(a.creationDate));
  return value;
}

@riverpod
Future<List<LocalPinDto>?> sortedGroupPins(Ref ref, String groupId) async {
  final pins = ref.watch(pinServiceProvider(groupId)).value?.toList();
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
      final pins = value.value?.toList() ?? [];
      final pinsWithDistance = pins.map((e) => MapEntry(e, d.distance(latlong, LatLng(e.latitude, e.longitude)))).toList();
      pinsWithDistance.sort((a, b) => a.value.compareTo(b.value));
      return AsyncData(pinsWithDistance);
    },
    error: (error, stackTrace) => AsyncValue.error(error, stackTrace),
    loading: () => AsyncLoading(),
  );
}
