
import 'package:camera/camera.dart';

class GlobalDataDto {

  DateTime lastSeen;
  int mapStyle;
  int cameraMode;
  String? userId;
  String? username;
  String? refreshToken;
  List<String> groupOrder;
  String host = "http://10.0.2.2:8081";
  List<CameraDescription> cameras = [];

  GlobalDataDto({
    required this.userId,
    required this.username,
    required this.refreshToken,
    required this.lastSeen,
    required this.mapStyle,
    required this.cameraMode,
    required this.groupOrder,
    required this. cameras
  });
}