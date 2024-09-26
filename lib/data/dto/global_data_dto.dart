
import 'package:camera/camera.dart';

class GlobalDataDto {

  String? userId;
  String? username;
  String? refreshToken;
  String host = "http://192.168.0.41:8081"; //10.0.2.2
  List<CameraDescription> cameras = [];

  GlobalDataDto({
    required this.userId,
    required this.username,
    required this.refreshToken,
    required this. cameras
  });
}