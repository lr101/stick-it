
import 'package:camera/camera.dart';

class GlobalDataDto {

  String? userId;
  String? username;
  String? refreshToken;
  String host = "https://stick-it.lr-projects.de"; //"http://10.217.236.10:8081"; // "https://stick-it.lr-projects.de"; //; //10.0.2.2
  List<CameraDescription> cameras = [];

  GlobalDataDto({
    required this.userId,
    required this.username,
    required this.refreshToken,
    required this. cameras
  });
}