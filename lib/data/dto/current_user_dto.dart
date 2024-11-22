
import 'dart:typed_data';

import 'package:buff_lisa/data/dto/local_user_dto.dart';

class CurrentUserDto {
  final String? username;
  final Uint8List? profileImage;
  final Uint8List? profileImageSmall;
  final String? description;

  CurrentUserDto({required this.username, this.profileImage, this.profileImageSmall, this.description});

  LocalUserDto toLocalUser(String userId) {
    return LocalUserDto(
        username: username!,
        description: description,
        userId: userId
    );
  }
}