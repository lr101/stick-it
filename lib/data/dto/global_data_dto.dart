
import 'package:camera/camera.dart';

class GlobalDataDto {

  DateTime lastSeen;
  int mapStyle;
  String? userId;
  String? username;
  String? refreshToken;
  List<String> groupOrder;
  String host = "http://192.168.148.43:8081";
  List<CameraDescription> cameras = [];

  GlobalDataDto({
    required this.userId,
    required this.username,
    required this.refreshToken,
    required this.lastSeen,
    required this.mapStyle,
    required this.groupOrder,
    required this. cameras
  });
}