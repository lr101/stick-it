
import 'package:camera/camera.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GlobalDataDto {

  String? userId;
  String? refreshToken;
  String host = dotenv.env['API_HOST']!;
  String minioHost = dotenv.env['MINIO_HOST']!;
  List<CameraDescription> cameras = [];

  GlobalDataDto({
    required this.userId,
    required this.refreshToken,
    required this. cameras
  });
}