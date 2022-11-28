import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:buff_lisa/Files/DTOClasses/group.dart';
import 'package:buff_lisa/Files/DTOClasses/pin.dart';
import 'package:buff_lisa/Files/ServerCalls/restAPI.dart';
import 'package:http/http.dart';

import '../global.dart' as global;
class FetchPins {

  /// returns a set of all pins contained in a [group]
  /// throws an Exception if an error occurs
  /// GET Request to Server
  static Future<Set<Pin>> fetchGroupPins(Group group) async {
    HttpClientResponse response = await RestAPI.createHttpsRequest("/api/groups/${group.groupId}/pins", {}, 0, null);
    if (response.statusCode == 200) {
      return toPinSet(response, group);
    } else {
      throw Exception("Pins could not be loaded: ${response.statusCode} error code");
    }
  }

  /// returns the image of a pin as a byte list that is identified by [pin]
  /// throws an Exception if an error occurs
  /// GET Request to Server
  static Future<Uint8List> fetchImageOfPin(Pin pin) async {
    HttpClientResponse response = await RestAPI.createHttpsRequest("/api/groups/${pin.group.groupId}/pins/${pin.id}/image", {}, 0, null);
    if (response.statusCode == 200) {
      return await ByteStream(response.cast()).toBytes();
    } else {
      throw Exception("failed to load mona");
    }
  }


  /// this method creates a pin by posting the existing information of a pin, contained in [pin], to the server
  /// returns the pin that is returned by the server
  /// throws an Exception if an error occurs
  /// POST Request to Server
  static Future<Pin> postPin(Pin mona) async {
    final String json = jsonEncode(<String, dynamic> {
      "latitude" : mona.latitude,
      "longitude" : mona.longitude,
      "groupId" : mona.group.groupId,
      "image": mona.image,
      "username": global.username,
    });
    final response =  await RestAPI.createHttpsRequest("/api/groups/${mona.group.groupId}/pins", {}, 1, json);
    if (response.statusCode == 201 || response.statusCode == 200) {
      final body = await response.transform(utf8.decoder).join();
      Map<String, dynamic> json = jsonDecode(body) as Map<String, dynamic>;
      return Pin.fromJson(json, mona.group);
    }
    throw Exception("Pin could not be created");
  }

  /// deletes a pin on the server identified by [id]
  /// throws an Exception if an error occurs
  /// GET Request to Server
  static Future<bool> deleteMonaFromPinId(int id) async {
    HttpClientResponse response = await RestAPI.createHttpsRequest("/api/groups/$id/pins", {}, 3, null);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    }
    throw Exception("failed to delete pin");
  }

  //---------------------------------------

  /// converts a client response to a pin set
  static Future<Set<Pin>> toPinSet(HttpClientResponse response, Group group) async {
    List<dynamic> values = json.decode(await response.transform(utf8.decoder).join());

    Set<Pin> pins = {};
    for (var element in values) {
      pins.add(Pin.fromJson(element, group));

    }
    return pins;
  }
}