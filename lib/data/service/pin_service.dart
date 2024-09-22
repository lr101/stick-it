import 'dart:math';
import 'dart:typed_data';
import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/dto/group_dto.dart';
import 'package:buff_lisa/data/dto/pin_dto.dart';
import 'package:buff_lisa/data/service/filter_service.dart';
import 'package:buff_lisa/data/service/member_service.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:buff_lisa/features/map_home/data/map_state.dart';
import 'package:latlong2/latlong.dart';
import 'package:openapi/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../repository/pin_repository.dart';
import 'global_data_service.dart';

part 'pin_service.g.dart';

@Riverpod(keepAlive: true)
class PinService extends _$PinService {
  late PinRepository _pinRepository;
  late PinsApi _pinsApi;

  @override
  Future<List<LocalPinDto>> build(String groupId) async {
    _pinRepository = ref.watch(pinRepositoryProvider);
    _pinsApi = ref.watch(pinApiProvider);
    final hiddenUsers = ref.watch(hiddenUserServiceProvider);
    final hiddenPosts = ref.watch(hiddenPostsServiceProvider);
    final localPins = await _pinRepository.getPinsOfGroup(groupId);
    localPins.removeWhere((e) => hiddenUsers.contains(e.creatorId) || hiddenPosts.contains(e.id));
    if (localPins.isNotEmpty) return localPins;

    final remotePins = await _pinsApi.getPinImagesByIds(groupId: groupId, withImage: false);
    List<LocalPinDto> pins = [];
    if (remotePins == null) return pins;

    for (var pin in remotePins) {
      final pinDto = LocalPinDto.fromDtoWithImage(pin);
      if (hiddenUsers.contains(pinDto.creatorId) || hiddenPosts.contains(pinDto.id)) continue;
      pins.add(pinDto);
      await _pinRepository.createOrUpdate(pinDto);
    }
    return pins;
  }

  // Optimized state update function
  void updateSinglePin(LocalPinDto updatedPin) {
    final currentState = state.value ?? [];
    final index = currentState.indexWhere((pin) => pin.id == updatedPin.id);

    if (index != -1) {
      // Replace the old pin with the updated one in the state
      final updatedState = [...currentState];
      updatedState[index] = updatedPin;
      state = AsyncValue.data(updatedState);
    }
  }

  void updateMultiplePins(List<LocalPinDto> updatedPin) {
    final currentState = state.value ?? [];
    final updatedState = [...currentState];
    for (var pin in updatedPin) {
      final index = currentState.indexWhere((p) => p.id == pin.id);
      if (index != -1) {
        updatedState[index] = pin;
      }
    }
    state = AsyncValue.data(updatedState);
  }

  Future<List<LocalPinDto>> getPinsOfActiveGroup() async {
    try {
      final localPins = await _pinRepository.getPinsOActiveGroup();
      if (localPins.isNotEmpty) return localPins;

      final List<LocalGroupDto> groups =
          await ref.watch(userGroupServiceProvider).whenOrNull() ?? [];
      final List<PinWithOptionalImageDto> remotePins = [];
      for (var group in groups) {
        final p = await _pinsApi.getPinImagesByIds(
            groupId: group.groupId, withImage: false);
        if (p == null) continue;
        remotePins.addAll(p);
      }
      List<LocalPinDto> pins = [];
      for (var pin in remotePins) {
        final pinDto = LocalPinDto.fromDtoWithImage(pin);
        pins.add(pinDto);
        await _pinRepository.createOrUpdate(pinDto);
        updateSinglePin(pinDto); // Update state for each pin
      }
      return pins;
    } catch (e) {
      print('Error fetching pins: $e');
      return [];
    }
  }

  Future<String?> addPinToGroup(LocalPinDto pin) async {
    try {
      await _pinRepository.createOrUpdate(pin);
      updateSinglePin(pin);
      //ref.read(memberServiceProvider(pin.groupId).notifier).addPoint();
      final result = await _pinsApi.createPin(pin.toPinRequestDto());
      if (result != null) {
        await _pinRepository.deletePinFromGroup(pin.id);
        state.value!.removeWhere((t) => t.id == pin.id);
        updateSinglePin(LocalPinDto.fromDto(result));
        await _pinRepository.createOrUpdate(LocalPinDto.fromDto(result));
        return null;
      } else {
        return 'Failed to add pin to group';
      }
    } on ApiException catch (e) {
      return e.message;
    }
  }

  Future<LocalPinDto?> getPinById(String pinId) async {
    try {
      final localPin = await _pinRepository.getPinById(pinId);
      if (localPin != null) return localPin;

      final remotePin = await _pinsApi.getPin(pinId);
      if (remotePin != null) {
        final pinDto = LocalPinDto.fromDto(remotePin);
        await _pinRepository.createOrUpdate(pinDto);

        // Update state for the fetched pin
        updateSinglePin(pinDto);
        return pinDto;
      }
      return null;
    } catch (e) {
      print('Error fetching pin by ID: $e');
      return null;
    }
  }

  Future<String?> deletePinFromGroup(String pinId) async {
    try {
      await _pinsApi.deletePin(pinId);
      final currentState = state.value ?? [];
      currentState.removeWhere((pin) => pin.id == pinId);
      state = AsyncValue.data(currentState);
      await _pinRepository.deletePinFromGroup(pinId);
      //ref.read(memberServiceProvider(groupId).notifier).removePoint(ref.watch(globalDataServiceProvider).userId!);
      return null;
    } on ApiException catch (e) {
      return e.message;
    }
  }

  Future<Uint8List> fetchImageOfPin(String pinId) async {
    try {
      final pin = await _pinRepository.getPinById(pinId);
      if (pin != null && pin.image != null) {
        return pin.image!;
      }

      final pinImage =
          await _pinsApi.getPinImagesByIds(ids: [pinId], withImage: true);
      if (pinImage != null && pinImage.isNotEmpty) {
        final pinDto = LocalPinDto.fromDtoWithImage(pinImage.first);
        _pinRepository.createOrUpdate(pinDto);

        // Update state for the pin with the image
        updateSinglePin(pinDto);
        return pinDto.image!;
      } else {
        throw Exception("Image not available");
      }
    } catch (e) {
      print('Error fetching pin image: $e');
      throw Exception("Failed to load pin image");
    }
  }
}

@riverpod
AsyncValue<List<LocalPinDto>> activatedPins(ActivatedPinsRef ref) {
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
AsyncValue<List<LocalPinDto>> activatedPinsWithoutLoading(ActivatedPinsWithoutLoadingRef ref) {
  final groups = ref.watch(activeGroupsProvider);
  final pins = <LocalPinDto>[];
  for (var group in groups.value ?? []) {
    final p = ref.watch(pinServiceProvider(group.groupId)).value ?? [];
    pins.addAll(p);
  }
  return AsyncData(pins);
}

@riverpod
Future<List<LocalPinDto>> sortedActivatedPins(SortedActivatedPinsRef ref) async {
  final value = ref.watch(activatedPinsProvider).value ?? [];
  value.sort((a, b) => b.creationDate.compareTo(a.creationDate));
  return value;
}

@riverpod
Future<List<LocalPinDto>> sortedGroupPins(SortedGroupPinsRef ref, String groupId) async {
  final pins = ref.watch(pinServiceProvider(groupId)).value ?? [];
  pins.sort((a, b) => b.creationDate.compareTo(a.creationDate));
  return pins;
}

@riverpod
Future<List<LocalPinDto>> sortedUserPins(SortedUserPinsRef ref) async {
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
AsyncValue<List<MapEntry<LocalPinDto, double>>> pinsSortedByDistance(PinsSortedByDistanceRef ref) {
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
