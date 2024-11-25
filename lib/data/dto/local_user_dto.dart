
import 'package:buff_lisa/data/service/user_image_service.dart';
import 'package:openapi/api.dart';

class LocalUserDto {
  final String username;
  final String userId;
  final String? description;
  final UserLikesDto? likes;
  LocalUserDto({required this.username, required this.userId, required this.description, this.likes});

  factory LocalUserDto.fromInfoDto(UserInfoDto user) {
    return LocalUserDto(
        username: user.username, userId: user.userId, description: user.description);
  }

  LocalUserDto fromCurrentWithLikes(UserLikesDto likes) {
    return LocalUserDto(username: username, userId: userId, description: description, likes: likes);
  }
}