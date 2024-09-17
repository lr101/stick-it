
import 'package:camera/camera.dart';

class GlobalDataDto {

  DateTime lastSeen;
  String? userId;
  String? username;
  String? refreshToken;
  List<String> groupOrder;
  String host = "http://192.168.46.43:8081"; //10.0.2.2
  List<CameraDescription> cameras = [];

  GlobalDataDto({
    required this.userId,
    required this.username,
    required this.refreshToken,
    required this.lastSeen,
    required this.groupOrder,
    required this. cameras
  });
}