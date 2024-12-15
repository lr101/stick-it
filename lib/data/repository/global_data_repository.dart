

import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import 'package:buff_lisa/data/dto/current_user_dto.dart';
import 'package:buff_lisa/data/dto/global_data_dto.dart';
import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:openapi/api.dart';
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
  static const String lastKnownLat = "lastKnownLat";
  static const String lastKnownLong = "lastKnownLong";
  static const String descriptionKey = "descriptionKey";
  static const String profileImageKey = "profileImageKey";
  static const String profileImageSmallKey = "profileImageSmallKey";
  static const String selectedBatchKey = "selectedBatchKey";
  static const String xpKey = "xpKey";
  static const String currentLevelKey = "currentLevelKey";
  static const String currentLevelXpKey = "currentLevelXpKey";
  static const String nextLevelXpKey = "nextLevelXpKey";
  static const String lastReviewKey = "lastReviewKey";

  GlobalDataRepository({required this.ref}) {
    sharedPreferences = ref.watch(sharedPreferencesProvider);
  }

  static Future<GlobalDataDto> get(SharedPreferences sharedPreferences, FlutterSecureStorage storage) async{
    return GlobalDataDto(
        userId: await storage.read(key: userIdKey),
        refreshToken: await storage.read(key: tokenKey),
        cameras: await availableCameras(),
    );
  }

  static Future<CurrentUserDto> getUser(SharedPreferences sharedPreferences, FlutterSecureStorage storage) async{
    final prImage = await sharedPreferences.getString(profileImageKey);
    final prImageSmall = await sharedPreferences.getString(profileImageSmallKey);
    return CurrentUserDto(
      username: await storage.read(key: usernameKey),
      description: await sharedPreferences.getString(descriptionKey),
      profileImage: prImage != null ? base64Decode(prImage) : null,
      profileImageSmall: prImageSmall != null ? base64Decode(prImageSmall) : null,
      selectedBatch: await sharedPreferences.getInt(selectedBatchKey),
      xp: UserXpDto(
        totalXp: await sharedPreferences.getInt(xpKey) ?? 0,
        currentLevel: await sharedPreferences.getInt(currentLevelKey) ?? 0,
        currentLevelXp: await sharedPreferences.getInt(currentLevelXpKey) ?? 0,
        nextLevelXp: await sharedPreferences.getInt(nextLevelXpKey) ?? 0
      )
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

  Future<void> updateCurrentUser({
      String? username,
      String? description,
      Uint8List? profileImage,
      Uint8List? profileImageSmall,
    int? selectedBatch
  }) async {
    final sharedPrefs = ref.watch(sharedPreferencesProvider);
    final storage = ref.watch(flutterSecureStorageProvider);
    if (description != null) await sharedPrefs.setString(descriptionKey, description);
    if (username != null) await storage.write(key: usernameKey, value: username);
    if (profileImage != null) await sharedPrefs.setString(profileImageKey, base64Encode(profileImage));
    if (profileImageSmall != null) await sharedPrefs.setString(profileImageSmallKey, base64Encode(profileImageSmall));
    if (selectedBatch != null) await sharedPrefs.setInt(selectedBatchKey, selectedBatch);
  }

  Future<void> setXp(UserXpDto xp) async {
    final sharedPrefs = ref.watch(sharedPreferencesProvider);
    await sharedPrefs.setInt(xpKey, xp.totalXp);
    await sharedPrefs.setInt(currentLevelKey, xp.currentLevel);
    await sharedPrefs.setInt(currentLevelXpKey, xp.currentLevelXp);
    await sharedPrefs.setInt(nextLevelXpKey, xp.nextLevelXp);
  }

}

@Riverpod(keepAlive: true)
GlobalDataRepository globalDataRepository(Ref ref) => GlobalDataRepository(ref: ref);

@Riverpod(keepAlive: true)
GlobalDataDto globalDataOnce(Ref ref) => throw UnimplementedError();

@Riverpod(keepAlive: true)
CurrentUserDto currentUserOnce(Ref ref) => throw UnimplementedError();

@Riverpod(keepAlive: true)
FlutterSecureStorage flutterSecureStorage(Ref ref) => throw UnimplementedError();
