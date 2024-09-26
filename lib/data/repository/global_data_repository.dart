

import 'dart:ui';

import 'package:buff_lisa/data/dto/global_data_dto.dart';
import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../service/shared_preferences_service.dart';

part 'global_data_repository.g.dart';

class GlobalDataRepository {

  final Ref ref;

  late SharedPreferences sharedPreferences;




  static const String usernameKey = "username";
  static const String userIdKey = "userId";
  static const String tokenKey = "auth";
  static const String pinFileNameKey = 'pin_new';
  static const String groupFileNameKey = 'groups';
  static const String hiddenUsersKey = "hiddenUsers";
  static const String hiddenPostsKey = "hiddenPosts";
  static const String activeGroupKey = "activeGroups";
  static const String offlineKeyValue = "offlineKeyValue";
  static const String themeKey = "themeKey";
  static const String orderKey = "orderKey";
  static const String langKey = "langKey";
  static const String expandKey = "expandKey";
  static const String lastSeenKey = "lastSeenKey";
  static const String lastSeenPinKey = "lastSeenPin";
  static const String mapApiKey = "mapApiKey";
  static const String mapStyle = "mapStyle";
  static const String notice0 = "notice0";
  static const String cameraTorch = "cameraTorch";

  GlobalDataRepository({required this.ref}) {
    sharedPreferences = ref.watch(sharedPreferencesProvider);
  }

  static Future<GlobalDataDto> get(SharedPreferences sharedPreferences, FlutterSecureStorage storage) async{
    return GlobalDataDto(
        userId: await storage.read(key: userIdKey),
        username: await storage.read(key: usernameKey),
        refreshToken: await storage.read(key: tokenKey),
        cameras: await availableCameras(),
    );
  }

  Future<void> logout() async {
    sharedPreferences.clear();
    ref.watch(flutterSecureStorageProvider).deleteAll();
  }

  Future<void> login(String username, String userId, String token) async {
    final storage = ref.watch(flutterSecureStorageProvider);
    await storage.write(key: usernameKey, value: username);
    await storage.write(key: userIdKey, value: userId);
    await storage.write(key: tokenKey, value: token);
  }

}

@Riverpod(keepAlive: true)
GlobalDataRepository globalDataRepository(GlobalDataRepositoryRef ref) => GlobalDataRepository(ref: ref);

@Riverpod(keepAlive: true)
GlobalDataDto globalDataOnce(GlobalDataOnceRef ref) => throw UnimplementedError();

@Riverpod(keepAlive: true)
FlutterSecureStorage flutterSecureStorage(FlutterSecureStorageRef ref) => throw UnimplementedError();
