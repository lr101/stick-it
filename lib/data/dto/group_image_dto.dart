
import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:buff_lisa/data/entity/database.dart';
import 'package:openapi/api.dart';

class GroupImageDto {

  final Uint8List profileImage;
  final Uint8List pinImage;
  final Uint8List? profileImageSmall;

  GroupImageDto({
    required this.profileImage,
    required this.pinImage,
    required this.profileImageSmall
  });

  factory GroupImageDto.fromEntity(GroupImageEntityData entity) {
    return GroupImageDto(
      profileImage: entity.profileImage,
      pinImage: entity.pinImage,
      profileImageSmall: entity.profileImageSmall
    );
  }

  static Future<GroupImageDto> fromGroupDto(GroupDto dto) async {
    return GroupImageDto(
        profileImage: (await http.get(Uri.parse(dto.profileImage!))).bodyBytes,
        pinImage: (await http.get(Uri.parse(dto.pinImage!))).bodyBytes,
        profileImageSmall: null
    );
  }

}