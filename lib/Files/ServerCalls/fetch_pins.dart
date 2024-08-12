import 'dart:convert';
import 'dart:typed_data';

import 'package:buff_lisa/Files/DTOClasses/group.dart';
import 'package:buff_lisa/Files/DTOClasses/pin.dart';
import 'package:buff_lisa/Files/Other/global.dart' as global;
import 'package:http/http.dart' as http;
import 'package:openapi/api.dart';

class FetchPins {
  static final PinsApi _pinsApi = global.openApiServices.pinApi;

  static Future<Set<Pin>> fetchGroupPins(Group group) async {
    final response = await _pinsApi.getPinImagesByIds(groupId: group.groupId, withImage: false);
    if (response != null) {
      return response.map((dto) => Pin.fromDtoWithImage(dto, group)).toSet();
    } else {
      throw Exception("Pins could not be loaded");
    }
  }

  static Future<List<Pin>> fetchUserPins(String userId, List<Group> groups, Future<Group> Function(String id, List<Group>) getGroup) async {
    final response = await _pinsApi.getPinImagesByIds(userId: userId, withImage: true);
    if (response != null) {
      return await Future.wait(response.map((dto) async {
        final group = await getGroup(dto.groupId, groups);
        return Pin.fromDtoWithImage(dto, group);
      }));
    } else {
      throw Exception("Pins could not be loaded");
    }
  }

  static Future<Pin> fetchUserPin(String pinId, List<Group> userGroups) async {
    final response = await _pinsApi.getPin(pinId.toString());
    if (response != null) {
      final group = userGroups.firstWhere((element) => element.groupId == response.groupId, orElse: () => throw Exception("Group not found"));
      return Pin.fromDto(response, group);
    } else {
      throw Exception("Pins could not be loaded");
    }
  }

  static Future<Set<Pin>> fetchUserPinsOfGroup(String userId, Group group) async {
    final response = await _pinsApi.getPinImagesByIds(userId: userId, groupId: group.groupId, withImage: false);
    if (response != null) {
      return response.map((dto) => Pin.fromDtoWithImage(dto, group)).toSet();
    } else {
      throw Exception("Pins could not be loaded");
    }
  }

  static Future<Uint8List> fetchImageOfPin(Pin pin, [String? compression, String? height]) async {
    final response = await _pinsApi.getPinImageWithHttpInfo(pin.id);
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception("Failed to load pin image");
    }
  }

  static Future<void> fetchPreviewsOfPins(List<Pin> pins, [int? height, int? compression]) async {
    final ids = pins.where((pin) => pin.preview.isEmpty).map((pin) => pin.id).toList();
    if (ids.isEmpty) return;

    final response = await _pinsApi.getPinImagesByIds(ids: ids, height: height, compression: compression);
    if (response != null) {
      for (int i = 0; i < response.length; i++) {
        try {
          pins[i].preview.setValue(base64Decode(response[i].image!));
        } catch (_) {}
      }
    } else {
      throw Exception("Failed to load pin previews");
    }
  }

  static Future<void> fetchImagesOfPins(List<Pin> pins, [int? compression]) async {
    final ids = pins.where((pin) => pin.image.isEmpty).map((pin) => pin.id).toList();
    if (ids.isEmpty) return;

    final response = await _pinsApi.getPinImagesByIds(ids: ids, compression: compression);
    if (response != null) {
      for (int i = 0; i < response.length; i++) {
        try {
          pins[i].image.setValue(base64Decode(response[i].image!));
        } catch (_) {}
      }
    } else {
      throw Exception("Failed to load pin images");
    }
  }

  static Future<Uint8List> fetchImageFromBrowserCache(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception("Failed to load image from browser cache");
    }
  }

  static Future<Pin> postPin(Pin pin) async {
    final requestDto = PinRequestDto(
      latitude: pin.latitude,
      longitude: pin.longitude,
      groupId: pin.group.groupId,
      image: base64Encode(pin.image.syncValue!.toList()),
      creationDate: pin.creationDate,
      userId: global.localData.userId,
    );
    final response = await _pinsApi.createPin(requestDto);
    if (response != null) {
      return Pin.fromDto(response, pin.group);
    } else {
      throw Exception("Pin could not be created");
    }
  }

  static Future<bool> deletePin(String id) async {
    try {
      await _pinsApi.deletePin(id.toString());
      return true;
    } catch (e) {
      return false;
    }
  }

}
