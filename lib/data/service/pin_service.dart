
import 'dart:typed_data';
import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/dto/group_dto.dart';
import 'package:buff_lisa/data/dto/pin_dto.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:openapi/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../dto/global_data_dto.dart';
import '../repository/pin_repository.dart';
import 'global_data_service.dart';

part 'pin_service.g.dart';

@Riverpod(keepAlive: true)
class PinService extends _$PinService {
  late PinRepository _pinRepository;
  late PinsApi _pinsApi;
  late String _groupId;

  @override
  Future<List<LocalPinDto>> build(String groupId) async {
    _groupId = groupId;
    _pinRepository = ref.watch(pinRepositoryProvider);
    _pinsApi = ref.watch(pinApiProvider);
    try {
      final localPins = await _pinRepository.getPinsOfGroup(groupId);
      if (localPins.isNotEmpty) return localPins;

      final remotePins = await _pinsApi.getPinImagesByIds(groupId: groupId, withImage: false);
      List<LocalPinDto> pins = [];
      if (remotePins == null) return pins;

      for (var pin in remotePins) {
        final pinDto = LocalPinDto.fromDtoWithImage(pin);
        pins.add(pinDto);
        await _pinRepository.createOrUpdate(pinDto);
      }
      return pins;
    } catch (e) {
      print('Error fetching pins: $e');
      return [];
    }
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

  Future<List<LocalPinDto>> getPinsOfActiveGroup() async {
    try {
      final localPins = await _pinRepository.getPinsOActiveGroup();
      if (localPins.isNotEmpty) return localPins;

      final List<LocalGroupDto> groups  = await ref.watch(userGroupServiceProvider).whenOrNull() ?? [];
      final List<PinWithOptionalImageDto> remotePins = [];
      for (var group in groups) {
        final p = await _pinsApi.getPinImagesByIds(groupId: group.groupId, withImage: false);
        if (p == null) continue;
        remotePins.addAll(p);
      }
      List<LocalPinDto> pins = [];
      for (var pin in remotePins) {
        final pinDto = LocalPinDto.fromDtoWithImage(pin);
        pins.add(pinDto);
        await _pinRepository.createOrUpdate(pinDto);
        updateSinglePin(pinDto);  // Update state for each pin
      }
      return pins;
    } catch (e) {
      print('Error fetching pins: $e');
      return [];
    }
  }

  Future<void> addPinToGroup(LocalPinDto pin) async {
    try {
      await _pinRepository.createOrUpdate(pin);
      await _pinsApi.createPin(pin.toPinRequestDto());

      // Update state for the added pin without updating the whole list
      updateSinglePin(pin);
    } catch (e) {
      print('Error adding pin: $e');
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

  Future<void> deletePinFromGroup(String pinId) async {
    try {
      final result = await _pinsApi.deletePinWithHttpInfo(pinId);
      if (result.statusCode != 200) {
        throw Exception('Failed to delete pin');
      }

      await _pinRepository.deletePinFromGroup(pinId);

      // Update the state by removing the deleted pin
      final currentState = state.value ?? [];
      final updatedState = currentState.where((pin) => pin.id != pinId).toList();
      state = AsyncValue.data(updatedState);
    } catch (e) {
      print('Error deleting pin: $e');
    }
  }

  Future<Uint8List> fetchImageOfPin(String pinId) async {
    try {
      final pin = await _pinRepository.getPinById(pinId);
      if (pin != null && pin.image != null) {
        return pin.image!;
      }

      final pinImage = await _pinsApi.getPinImagesByIds(ids: [pinId], withImage: true);
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
List<LocalPinDto> activatedPins(ActivatedPinsRef ref) {
  final List<LocalGroupDto> groups = ref.watch(activeGroupsProvider).value ?? [];
  final pins = <LocalPinDto>[];
  for (var group in groups) {
    final p = ref.watch(pinServiceProvider(group.groupId)).value ?? [];
    pins.addAll(p);
  }
  return pins;
}
