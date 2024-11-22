
import 'package:buff_lisa/data/service/user_image_service.dart';
import 'package:openapi/api.dart';

class LocalUserDto {
  final String username;
  final String userId;
  final String? description;
  LocalUserDto({required this.username, required this.userId, required this.description});

  factory LocalUserDto.fromInfoDto(UserInfoDto user) {
    return LocalUserDto(
        username: user.username, userId: user.userId, description: user.description);
  }
}