import 'dart:typed_data';
import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/dto/group_dto.dart';
import 'package:buff_lisa/data/dto/pin_dto.dart';
import 'package:buff_lisa/data/service/filter_service.dart';
import 'package:buff_lisa/data/service/member_service.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
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
      ref.read(memberServiceProvider(pin.groupId).notifier).addPoint();
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
      await _pinRepository.deletePinFromGroup(pinId);
      final currentState = state.value ?? [];
      currentState.removeWhere((pin) => pin.id != pinId);
      state = AsyncValue.data(currentState);
      ref.read(memberServiceProvider(groupId).notifier).removePoint(ref.watch(globalDataServiceProvider).userId!);
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
AsyncValue<List<LocalPinDto>> sortedActivatedPins(SortedActivatedPinsRef ref) {
  final value = ref.watch(activatedPinsProvider);
  if (value.isLoading) return AsyncLoading();
  value.value!.sort((a, b) => b.creationDate.compareTo(a.creationDate));
  return value;
}

@riverpod
AsyncValue<List<LocalPinDto>> sortedGroupPins(
    SortedGroupPinsRef ref, String groupId) {
  final pins = ref.watch(pinServiceProvider(groupId));
  if (pins.isLoading) return AsyncLoading();
  pins.value!.sort((a, b) => b.creationDate.compareTo(a.creationDate));
  return pins;
}

@riverpod
AsyncValue<List<LocalPinDto>> sortedUserPins(SortedUserPinsRef ref) {
  final groups = ref.watch(userGroupServiceProvider);
  final userId = ref.watch(globalDataServiceProvider).userId!;
  if (groups.isLoading) return AsyncLoading();
  final pins = <LocalPinDto>[];
  for (var group in groups.value!) {
    final p = ref.watch(pinServiceProvider(group.groupId).select((p) => p.whenOrNull(data: (data) => data.where((e) => e.creatorId == userId))));
    if (p == null) return AsyncLoading();
    pins.addAll(p);
  }
  pins.sort((a, b) => b.creationDate.compareTo(a.creationDate));
  return AsyncData(pins);
}
