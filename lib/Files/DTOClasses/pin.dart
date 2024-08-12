import 'dart:convert';
import 'dart:typed_data';

import 'package:buff_lisa/Files/AbstractClasses/async_type.dart';
import 'package:buff_lisa/Files/ServerCalls/fetch_pins.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

import 'group.dart';

class Pin {

  /// latitude position of the pin
  final double latitude;

  /// longitude position of the pin
  final double longitude;

  /// unique id of the pin
  final String id;

  /// date of creation of the pin
  final DateTime creationDate;

  /// user that created the pin
  final String creatorId;

  /// group the pin belongs to
  Group group;

  /// Uint8List:  image as byte list of the pin
  /// null: not loaded from server yet
  late final AsyncType<Uint8List> image;

  late final AsyncType<Uint8List> preview;

  bool isOffline;

  /// Constructor of pin
  Pin( {
    required this.latitude,
    required this.longitude,
    required this.id,
    required this.creationDate,
    required this.creatorId,
    required this.group,
    this.isOffline = false,
    Uint8List? image,
    Uint8List? preview
  }) {
    this.image = AsyncType<Uint8List>(value: image, callback: () => FetchPins.fetchImageOfPin(this), builder: (_) => Image.memory(_));
    this.preview = AsyncType<Uint8List>(value: image, callback: () => FetchPins.fetchImageOfPin(this, "1", "500"), builder: (_) => Image.memory(_));
  }

  /// Constructor of pin from json when pin is loaded from server
  static Pin fromJson(Map<String, dynamic> json, group) {
    return Pin(
        latitude : json['latitude'],
        longitude : json['longitude'],
        id : json['id'],
        creatorId : json.containsKey('username') ? json['username'] : json.containsKey('creationUser') ? json['creationUser'] : "",
        creationDate : DateTime.parse((json['creationDate'])),
        group: group,
        isOffline : false
    );
  }

  static Pin fromDto(PinWithoutImageDto pinDto, group) {
    return Pin(
        latitude : pinDto.latitude.toDouble(),
        longitude : pinDto.longitude.toDouble(),
        id : pinDto.id,
        creatorId : pinDto.creationUser,
        creationDate : pinDto.creationDate,
        group: group,
        isOffline : false
    );
  }

  static Pin fromDtoWithImage(PinWithOptionalImageDto pinDto, Group group) {
    return Pin(
        latitude : pinDto.latitude.toDouble(),
        longitude : pinDto.longitude.toDouble(),
        id : pinDto.id,
        creatorId : pinDto.creationUser,
        creationDate : pinDto.creationDate!,
        image: pinDto.image != null ? base64Decode(pinDto.image!) : null,
        group: group,
        isOffline : false
    );
  }

  /// returns json format for posting pin to server
  Future<Map<String, dynamic>> toJson() async {
    return {
      "longitude": longitude,
      "latitude": latitude,
      "id": id,
      "creationDate": formatDateTim(creationDate),
      "username" : creatorId
    };
  }

  /// format DateTime object to string
  static String formatDateTim(DateTime d) {
    DateTime date = DateTime(d.year, d.month, d.day);
    return date.toString();
  }

}

