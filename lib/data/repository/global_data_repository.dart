

import 'dart:ui';

import 'package:buff_lisa/data/dto/global_data_dto.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
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
        cameraMode: sharedPreferences.getInt(cameraTorch) ?? 0,
        mapStyle: sharedPreferences.getInt(mapStyle) ?? 0,
        lastSeen: DateTime.fromMicrosecondsSinceEpoch(sharedPreferences.getInt(lastSeenKey) ?? 0),
        groupOrder: sharedPreferences.getStringList(orderKey) ?? [],
        cameras: await availableCameras(),
    );
  }

  void setTheme(Brightness theme) {
    sharedPreferences.setInt(themeKey, theme == Brightness.dark ? 1 : 0);
  }

  /// update group order and save offline
  Future<void> setGroupOrder(List<String> order) async {
    await sharedPreferences.setStringList(orderKey, order);
  }

  /// updates last seen to the current time
  Future<void> setLastSeenNow() async {
    sharedPreferences.setInt(lastSeenKey, DateTime
        .now()
        .microsecondsSinceEpoch);
  }

  Future<void> setMapStyle(int style) async {
    sharedPreferences.setInt(mapStyle, style);
  }

  Future<void> setCameraMode(int value) async {
    await sharedPreferences.setInt(cameraTorch, value);
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
